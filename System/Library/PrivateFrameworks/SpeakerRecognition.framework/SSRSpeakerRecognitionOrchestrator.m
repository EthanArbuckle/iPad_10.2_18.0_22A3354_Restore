@implementation SSRSpeakerRecognitionOrchestrator

- (SSRSpeakerRecognitionOrchestrator)initWithContext:(id)a3 withDelegate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SSRSpeakerRecognitionOrchestrator *v11;
  SSRSpeakerRecognitionOrchestrator *v12;
  id *p_context;
  SSRSpeakerRecognizerPSR *v14;
  SSRSpeakerRecognizer *psrRecognizer;
  os_log_t *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  SSRSpeakerRecognizerSAT *v21;
  SSRSpeakerRecognizer *satRecognizer;
  os_log_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSString *debugUtteranceAudioFilePath;
  uint64_t v29;
  NSString *debugUtteranceJsonFilePath;
  SSRVoiceActivityDetector *v31;
  SSRVoiceActivityDetector *vad;
  uint64_t v33;
  OS_dispatch_queue *queue;
  CSAudioFileWriter *ssrUttLogger;
  void *v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  CSAudioFileWriter *v42;
  NSObject *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  SSRSpeakerRecognitionOrchestrator *v56;
  void *v57;
  void *v58;
  uint64_t v60;
  char v61[40];
  objc_super v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)SSRSpeakerRecognitionOrchestrator;
  v11 = -[SSRSpeakerRecognitionOrchestrator init](&v62, sel_init);
  v12 = v11;
  if (!v11)
  {
LABEL_35:
    v56 = v12;
    goto LABEL_36;
  }
  p_context = (id *)&v11->_context;
  objc_storeStrong((id *)&v11->_context, a3);
  v14 = -[SSRSpeakerRecognizerPSR initWithContext:delegate:]([SSRSpeakerRecognizerPSR alloc], "initWithContext:delegate:", v9, v12);
  psrRecognizer = v12->_psrRecognizer;
  v12->_psrRecognizer = (SSRSpeakerRecognizer *)v14;

  v16 = (os_log_t *)MEMORY[0x24BE284B8];
  if (!v12->_psrRecognizer)
  {
    v17 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v18 = *p_context;
      v19 = v17;
      objc_msgSend(v18, "sessionId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      v65 = 2114;
      v66 = v20;
      _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Failed to create PSR Recognizer", buf, 0x16u);

    }
  }
  v21 = -[SSRSpeakerRecognizerSAT initWithContext:delegate:]([SSRSpeakerRecognizerSAT alloc], "initWithContext:delegate:", v9, v12);
  satRecognizer = v12->_satRecognizer;
  v12->_satRecognizer = (SSRSpeakerRecognizer *)v21;

  if (!v12->_satRecognizer)
  {
    v23 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *p_context;
      v25 = v23;
      objc_msgSend(v24, "sessionId");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      v65 = 2114;
      v66 = v26;
      _os_log_impl(&dword_2117D4000, v25, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Failed to create SAT Recognizer", buf, 0x16u);

    }
  }
  if (!v12->_psrRecognizer && !v12->_satRecognizer)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Failed to init PSR and SAT recognizers - Bailing out"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      v65 = 2114;
      v66 = v46;
      _os_log_error_impl(&dword_2117D4000, v53, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!a5)
        goto LABEL_29;
    }
    else if (!a5)
    {
LABEL_29:
      objc_msgSend(*p_context, "logAggregator");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v50;
      v52 = 101;
      goto LABEL_30;
    }
    v54 = (void *)MEMORY[0x24BDD1540];
    v73 = CFSTR("reason");
    v74[0] = v46;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 101, v55);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  objc_msgSend(v9, "debugUtteranceAudioFile");
  v27 = objc_claimAutoreleasedReturnValue();
  debugUtteranceAudioFilePath = v12->_debugUtteranceAudioFilePath;
  v12->_debugUtteranceAudioFilePath = (NSString *)v27;

  objc_msgSend(v9, "debugUtteranceMetaFile");
  v29 = objc_claimAutoreleasedReturnValue();
  debugUtteranceJsonFilePath = v12->_debugUtteranceJsonFilePath;
  v12->_debugUtteranceJsonFilePath = (NSString *)v29;

  v12->_segmentCounter = 0;
  if (objc_msgSend(v9, "recognitionStyle") != 2
    || (v31 = -[SSRVoiceActivityDetector initWithContext:delegate:]([SSRVoiceActivityDetector alloc], "initWithContext:delegate:", v9, v12), vad = v12->_vad, v12->_vad = v31, vad, v12->_vad))
  {
    objc_msgSend(MEMORY[0x24BE28488], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.ssr.orchestratorq"), *MEMORY[0x24BE284E0]);
    v33 = objc_claimAutoreleasedReturnValue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v33;

    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_myriadResult = 0;
    v12->_numSamplesAddedToSpeakerRecognizers = 0;
    *(_WORD *)&v12->_endAudioCalled = 0;
    if (objc_msgSend(v9, "recognitionStyle") == 2)
      -[SSRSpeakerRecognitionOrchestrator updateDebugFilePathsForSegment:](v12, "updateDebugFilePathsForSegment:", v12->_segmentCounter);
    ssrUttLogger = v12->_ssrUttLogger;
    v12->_ssrUttLogger = 0;

    if (CSIsInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "speakerRecognitionAudioLoggingEnabled");

      if (v37)
      {
        +[SSRUtils ssrAudioLogsDir](SSRUtils, "ssrAudioLogsDir");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v38);

        if (+[SSRUtils ssrAudioLogsCountWithinPrivacyLimit](SSRUtils, "ssrAudioLogsCountWithinPrivacyLimit"))
        {
          v39 = objc_alloc(MEMORY[0x24BE28470]);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12->_debugUtteranceAudioFilePath);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
          objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
          v41 = objc_msgSend(v39, "initWithURL:inputFormat:outputFormat:", v40, v61, &v60);
          v42 = v12->_ssrUttLogger;
          v12->_ssrUttLogger = (CSAudioFileWriter *)v41;

        }
      }
    }
    v43 = *v16;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      -[SSRSpeakerRecognitionContext sessionId](v12->_context, "sessionId");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12->_satRecognizer)
      {
        if (v12->_psrRecognizer)
          v45 = CFSTR("SAT+PSR");
        else
          v45 = CFSTR("SAT");
      }
      else
      {
        v45 = CFSTR("PSR");
      }
      objc_msgSend(*p_context, "debugUtteranceAudioFile");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "lastPathComponent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
      v65 = 2114;
      v66 = v44;
      v67 = 2114;
      v68 = v45;
      v69 = 2114;
      v70 = v58;
      _os_log_impl(&dword_2117D4000, v43, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Successfully initialized with {%{public}@, %{public}@}", buf, 0x2Au);

    }
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Failed to init VAD - Bailing out"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "-[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]";
    v65 = 2114;
    v66 = v46;
    _os_log_error_impl(&dword_2117D4000, v47, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    if (!a5)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (a5)
  {
LABEL_24:
    v48 = (void *)MEMORY[0x24BDD1540];
    v71 = CFSTR("reason");
    v72 = v46;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 102, v49);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_25:
  objc_msgSend(*p_context, "logAggregator");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  v52 = 102;
LABEL_30:
  objc_msgSend(v50, "setSpeakerRecognitionProcessingStatus:", v52);

  v56 = 0;
LABEL_36:

  return v56;
}

- (void)dealloc
{
  OS_os_transaction *transaction;
  NSObject *v4;
  NSString *transDesc;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  transaction = self->_transaction;
  if (transaction)
  {
    v4 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      transDesc = self->_transDesc;
      *(_DWORD *)buf = 136315394;
      v8 = "-[SSRSpeakerRecognitionOrchestrator dealloc]";
      v9 = 2114;
      v10 = transDesc;
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Released OS transaction for %{public}@", buf, 0x16u);
      transaction = self->_transaction;
    }
  }
  self->_transaction = 0;

  v6.receiver = self;
  v6.super_class = (Class)SSRSpeakerRecognitionOrchestrator;
  -[SSRSpeakerRecognitionOrchestrator dealloc](&v6, sel_dealloc);
}

- (void)processAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;

  v6 = a3;
  if (self->_lastScoreReportTimeStamp == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    self->_lastScoreReportTimeStamp = v8;

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SSRSpeakerRecognitionOrchestrator_processAudio_numSamples___block_invoke;
  block[3] = &unk_24CC86490;
  v12 = v6;
  v13 = a4;
  block[4] = self;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SSRSpeakerRecognitionOrchestrator_endAudio__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)resetWithContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__SSRSpeakerRecognitionOrchestrator_resetWithContext___block_invoke;
  v8[3] = &unk_24CC85EE8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_async_and_wait(queue, v8);

  return 0;
}

- (unint64_t)getPSRProcessingTime
{
  return -[SSRSpeakerRecognizer getSpeakerRecognizerProcessingTime](self->_psrRecognizer, "getSpeakerRecognizerProcessingTime");
}

- (void)_logSpeakerIdProcessorScoreDelayWithScoreInfo:(id)a3 hasFinished:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  os_log_t *v14;
  void *v15;
  SSRSpeakerRecognitionContext *context;
  NSObject *v17;
  void *v18;
  const __CFString *v19;
  double v20;
  float v21;
  NSObject *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = v10 - self->_lastScoreReportTimeStamp;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spIdAudioProcessedDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "integerValue");
  v14 = (os_log_t *)MEMORY[0x24BE284B8];
  v15 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    v17 = v15;
    -[SSRSpeakerRecognitionContext sessionId](context, "sessionId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v19 = CFSTR("finished");
    else
      v19 = CFSTR("reported");
    v20 = (double)self->_numSamplesAddedToSpeakerRecognizers * 1000.0;
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v24 = 136316418;
    v25 = "-[SSRSpeakerRecognitionOrchestrator _logSpeakerIdProcessorScoreDelayWithScoreInfo:hasFinished:]";
    v26 = 2114;
    v27 = (uint64_t)v18;
    v28 = 2114;
    v29 = v19;
    v30 = 2050;
    v31 = (uint64_t)(v11 * 1000.0);
    v32 = 2050;
    v33 = v13;
    v34 = 2050;
    v35 = (uint64_t)(v20 / v21 - (double)v13);
    _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Scorecard %{public}@ with delay:%{public}ldms, processed:%{public}ldms, await:%{public}ldms", (uint8_t *)&v24, 0x3Eu);

  }
  if (CSIsCommunalDevice() && v11 > 0.8)
  {
    v22 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v24 = 136315394;
      v25 = "-[SSRSpeakerRecognitionOrchestrator _logSpeakerIdProcessorScoreDelayWithScoreInfo:hasFinished:]";
      v26 = 2048;
      v27 = (uint64_t)(v11 * 1000.0);
      _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s ERR: Posting diagnostic report for abnormal score delay - %ldms", (uint8_t *)&v24, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitVoiceIdIssueReport:", *MEMORY[0x24BE284E8]);

  }
  self->_lastScoreReportTimeStamp = v10;
}

- (id)orchestratorScoresWithPSRScores:(id)a3 withSATScores:(id)a4 withSegmentStartTime:(double)a5
{
  SSRSpeakerRecognitionContext *context;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  context = self->_context;
  v9 = a4;
  v10 = a3;
  -[SSRSpeakerRecognitionContext combinationWeight](context, "combinationWeight");
  +[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:](SSRUtils, "combineScoreFromPSR:fromSAT:withCombinedWt:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSRSpeakerRecognitionContext numEnrollmentUtterances](self->_context, "numEnrollmentUtterances");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("numEnrollmentUtt"));

  v13 = (void *)MEMORY[0x24BDD16E0];
  -[SSRSpeakerRecognitionContext combinationWeight](self->_context, "combinationWeight");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("combinationWeight"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SSRSpeakerRecognitionContext scoreType](self->_context, "scoreType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("spIdUserScoresVersion"));

  -[SSRSpeakerRecognitionContext sessionId](self->_context, "sessionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("sessionId"));

  -[SSRSpeakerRecognitionContext configVersion](self->_context, "configVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("spIdAssetVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("segmentStartTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_segmentCounter);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("segmentCounter"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_myriadResult);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("myriad"));

  if (CSIsInternalBuild())
    objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_debugUtteranceJsonFilePath, CFSTR("ssrMeta"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("spIdVTInvocationScoreThresholdingType"), CFSTR("spIdScoreThresholdingType"));
  return v11;
}

- (void)_resetWithContext:(id)a3
{
  id v5;
  id v6;
  void *v7;
  CSAudioFileWriter *v8;
  CSAudioFileWriter *ssrUttLogger;
  CSAudioFileWriter *v10;
  NSDictionary *psrFinalSpeakerInfo;
  NSDictionary *satLastSpeakerInfo;
  NSDictionary *psrLastSpeakerInfo;
  NSDictionary *v14;
  uint64_t v15;
  _BYTE v16[40];

  v5 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  if (objc_msgSend(v5, "recognitionStyle") == 2)
  {
    -[CSAudioFileWriter endAudio](self->_ssrUttLogger, "endAudio");
    +[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:](SSRUtils, "logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:", self->_debugUtteranceJsonFilePath, self->_combinedScores);
    -[SSRSpeakerRecognitionOrchestrator updateDebugFilePathsForSegment:](self, "updateDebugFilePathsForSegment:", self->_segmentCounter);
    if (CSIsInternalBuild()
      && +[SSRUtils ssrAudioLogsCountWithinPrivacyLimit](SSRUtils, "ssrAudioLogsCountWithinPrivacyLimit"))
    {
      v6 = objc_alloc(MEMORY[0x24BE28470]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_debugUtteranceAudioFilePath);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
      objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
      v8 = (CSAudioFileWriter *)objc_msgSend(v6, "initWithURL:inputFormat:outputFormat:", v7, v16, &v15);
      ssrUttLogger = self->_ssrUttLogger;
      self->_ssrUttLogger = v8;

    }
    else
    {
      v10 = self->_ssrUttLogger;
      self->_ssrUttLogger = 0;

    }
  }
  psrFinalSpeakerInfo = self->_psrFinalSpeakerInfo;
  self->_psrFinalSpeakerInfo = 0;

  satLastSpeakerInfo = self->_satLastSpeakerInfo;
  self->_satLastSpeakerInfo = 0;

  psrLastSpeakerInfo = self->_psrLastSpeakerInfo;
  self->_psrLastSpeakerInfo = 0;

  v14 = self->_satLastSpeakerInfo;
  self->_satLastSpeakerInfo = 0;

  self->_numSamplesAddedToSpeakerRecognizers = 0;
  self->_startPointReported = 0;
  -[SSRVoiceActivityDetector resetWithContext:](self->_vad, "resetWithContext:", v5);
  -[SSRSpeakerRecognizer resetWithContext:](self->_psrRecognizer, "resetWithContext:", v5);
  -[SSRSpeakerRecognizer resetWithContext:](self->_satRecognizer, "resetWithContext:", v5);

}

- (void)updateDebugFilePathsForSegment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *debugUtteranceAudioFilePath;
  void *v14;
  NSString *v15;
  NSString *debugUtteranceJsonFilePath;
  id v17;

  -[SSRSpeakerRecognitionContext debugUtteranceAudioFile](self->_context, "debugUtteranceAudioFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SSRSpeakerRecognitionContext debugUtteranceAudioFile](self->_context, "debugUtteranceAudioFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%d"), v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("wav"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathComponent:", v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  debugUtteranceAudioFilePath = self->_debugUtteranceAudioFilePath;
  self->_debugUtteranceAudioFilePath = v12;

  objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("json"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathComponent:", v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  debugUtteranceJsonFilePath = self->_debugUtteranceJsonFilePath;
  self->_debugUtteranceJsonFilePath = v15;

}

- (id)getLatestVoiceRecognitionInfo
{
  void *v3;
  NSObject *queue;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke;
  block[3] = &unk_24CC864E8;
  block[4] = self;
  block[5] = &v21;
  dispatch_async_and_wait(queue, block);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend(v6, "timeIntervalSinceDate:", v3);
  v19 = v7;
  v8 = (id)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SSRSpeakerRecognitionContext sessionId](self->_context, "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17[3];
    objc_msgSend((id)v22[5], "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v28 = "-[SSRSpeakerRecognitionOrchestrator getLatestVoiceRecognitionInfo]";
    v29 = 2114;
    v30 = v9;
    v31 = 2050;
    v32 = v10;
    v33 = 2114;
    v34 = v11;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Sync score report with %{public}f delay - with known user scores %{public}@", buf, 0x2Au);

  }
  v12 = self->_queue;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke_46;
  v15[3] = &unk_24CC864E8;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_async(v12, v15);
  v13 = (id)v22[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (void)speakerRecognizer:(id)a3 hasSpeakerIdInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSRSpeakerRecognitionOrchestrator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__SSRSpeakerRecognitionOrchestrator_speakerRecognizer_hasSpeakerIdInfo___block_invoke;
  block[3] = &unk_24CC861E0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)speakerRecognizerFinishedProcessing:(id)a3 withFinalSpeakerIdInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSRSpeakerRecognitionOrchestrator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__SSRSpeakerRecognitionOrchestrator_speakerRecognizerFinishedProcessing_withFinalSpeakerIdInfo___block_invoke;
  block[3] = &unk_24CC861E0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)SSRVoiceActivityDetector:(id)a3 didDetectStartPointAt:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectStartPointAt___block_invoke;
  v5[3] = &unk_24CC84D80;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)SSRVoiceActivityDetector:(id)a3 didDetectEndPointAt:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectEndPointAt___block_invoke;
  v5[3] = &unk_24CC84D80;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (SSRSpeakerRecognitionOrchestratorDelegate)delegate
{
  return (SSRSpeakerRecognitionOrchestratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSAudioFileWriter)ssrUttLogger
{
  return self->_ssrUttLogger;
}

- (void)setSsrUttLogger:(id)a3
{
  objc_storeStrong((id *)&self->_ssrUttLogger, a3);
}

- (unint64_t)myriadResult
{
  return self->_myriadResult;
}

- (void)setMyriadResult:(unint64_t)a3
{
  self->_myriadResult = a3;
}

- (SSRSpeakerRecognizer)psrRecognizer
{
  return self->_psrRecognizer;
}

- (void)setPsrRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_psrRecognizer, a3);
}

- (SSRSpeakerRecognizer)satRecognizer
{
  return self->_satRecognizer;
}

- (void)setSatRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_satRecognizer, a3);
}

- (SSRVoiceActivityDetector)vad
{
  return self->_vad;
}

- (void)setVad:(id)a3
{
  objc_storeStrong((id *)&self->_vad, a3);
}

- (NSDictionary)psrLastSpeakerInfo
{
  return self->_psrLastSpeakerInfo;
}

- (void)setPsrLastSpeakerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_psrLastSpeakerInfo, a3);
}

- (NSDictionary)satLastSpeakerInfo
{
  return self->_satLastSpeakerInfo;
}

- (void)setSatLastSpeakerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_satLastSpeakerInfo, a3);
}

- (NSDictionary)combinedScores
{
  return self->_combinedScores;
}

- (void)setCombinedScores:(id)a3
{
  objc_storeStrong((id *)&self->_combinedScores, a3);
}

- (NSDictionary)psrFinalSpeakerInfo
{
  return self->_psrFinalSpeakerInfo;
}

- (void)setPsrFinalSpeakerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_psrFinalSpeakerInfo, a3);
}

- (NSDictionary)satFinalSpeakerInfo
{
  return self->_satFinalSpeakerInfo;
}

- (void)setSatFinalSpeakerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_satFinalSpeakerInfo, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)debugUtteranceAudioFilePath
{
  return self->_debugUtteranceAudioFilePath;
}

- (void)setDebugUtteranceAudioFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_debugUtteranceAudioFilePath, a3);
}

- (NSString)debugUtteranceJsonFilePath
{
  return self->_debugUtteranceJsonFilePath;
}

- (void)setDebugUtteranceJsonFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_debugUtteranceJsonFilePath, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSString)transDesc
{
  return self->_transDesc;
}

- (void)setTransDesc:(id)a3
{
  objc_storeStrong((id *)&self->_transDesc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transDesc, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_debugUtteranceJsonFilePath, 0);
  objc_storeStrong((id *)&self->_debugUtteranceAudioFilePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_satFinalSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_psrFinalSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_combinedScores, 0);
  objc_storeStrong((id *)&self->_satLastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_psrLastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_vad, 0);
  objc_storeStrong((id *)&self->_satRecognizer, 0);
  objc_storeStrong((id *)&self->_psrRecognizer, 0);
  objc_storeStrong((id *)&self->_ssrUttLogger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __82__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectEndPointAt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  *(double *)(*(_QWORD *)(a1 + 32) + 16) = (double)*(unint64_t *)(a1 + 40) / 1000.0;
  v2 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v4 = v2;
    objc_msgSend(v3, "sessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 136315650;
    v9 = "-[SSRSpeakerRecognitionOrchestrator SSRVoiceActivityDetector:didDetectEndPointAt:]_block_invoke";
    v10 = 2114;
    v11 = v5;
    v12 = 2048;
    v13 = v6;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Starting a new segment of speech - %ldms", (uint8_t *)&v8, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_resetWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

void __84__SSRSpeakerRecognitionOrchestrator_SSRVoiceActivityDetector_didDetectStartPointAt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v4 = v2;
    objc_msgSend(v3, "sessionId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 136315650;
    v8 = "-[SSRSpeakerRecognitionOrchestrator SSRVoiceActivityDetector:didDetectStartPointAt:]_block_invoke";
    v9 = 2114;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Speech started at - %ldms", (uint8_t *)&v7, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
}

void __96__SSRSpeakerRecognitionOrchestrator_speakerRecognizerFinishedProcessing_withFinalSpeakerIdInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t *v5;
  os_log_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  const char *v17;
  os_log_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  os_log_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  os_log_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  __CFString *v36;
  id WeakRetained;
  char v38;
  NSObject *v39;
  os_log_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  os_log_t v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  _BYTE v52[24];
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    v12 = (void *)*MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      return;
    v13 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v14 = v12;
    objc_msgSend(v13, "sessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(const __CFString **)(a1 + 48);
    *(_DWORD *)v52 = 136315650;
    *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:]_block_invoke";
    *(_WORD *)&v52[12] = 2114;
    *(_QWORD *)&v52[14] = v15;
    *(_WORD *)&v52[22] = 2114;
    v53 = v16;
    v17 = "%s SSROrch[%{public}@]:: ERR: VoiceInfo is nil from recognizer %{public}@";
LABEL_28:
    _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, v17, v52, 0x20u);
LABEL_29:

    return;
  }
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "recognitionStyle");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == 2 && !*(_BYTE *)(v3 + 40))
  {
    v44 = (void *)*MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      return;
    v45 = *(void **)(v3 + 48);
    v14 = v44;
    objc_msgSend(v45, "sessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *(const __CFString **)(a1 + 48);
    *(_DWORD *)v52 = 136315650;
    *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:]_block_invoke";
    *(_WORD *)&v52[12] = 2114;
    *(_QWORD *)&v52[14] = v15;
    *(_WORD *)&v52[22] = 2114;
    v53 = v46;
    v17 = "%s SSROrch[%{public}@]:: EndAudioCalled is false, returning for recognizer %{public}@";
    goto LABEL_28;
  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  if (v4 == *(_QWORD *)(v3 + 80))
  {
    objc_storeStrong((id *)(v3 + 128), *(id *)(a1 + 32));
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v8 = v18;
      objc_msgSend(v19, "sessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)v52 = 136315650;
      *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v9;
      *(_WORD *)&v52[22] = 2114;
      v53 = v20;
      v11 = "%s SSROrch[%{public}@]:: PSR Analyzer finished the session with %{public}@";
      goto LABEL_12;
    }
  }
  else if (v4 == *(_QWORD *)(v3 + 88))
  {
    objc_storeStrong((id *)(v3 + 136), *(id *)(a1 + 32));
    v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v8 = v6;
      objc_msgSend(v7, "sessionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)v52 = 136315650;
      *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v9;
      *(_WORD *)&v52[22] = 2114;
      v53 = v10;
      v11 = "%s SSROrch[%{public}@]:: SAT Analyzer finished the session with %{public}@";
LABEL_12:
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, v11, v52, 0x20u);

    }
  }
  v21 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v21 + 80) || !*(_QWORD *)(v21 + 88) || *(_QWORD *)(v21 + 128))
  {
    objc_msgSend(*(id *)(a1 + 40), "orchestratorScoresWithPSRScores:withSATScores:withSegmentStartTime:", *(_QWORD *)(v21 + 128), *(_QWORD *)(v21 + 136), *(double *)(v21 + 16), *(_OWORD *)v52, *(_QWORD *)&v52[16], v53);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(void **)(v23 + 120);
    *(_QWORD *)(v23 + 120) = v22;

    v25 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v27 = v25;
      objc_msgSend(v26, "sessionId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(const __CFString **)(v29 + 160);
      v31 = *(void **)(v29 + 120);
      *(_DWORD *)v52 = 136315906;
      *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v28;
      *(_WORD *)&v52[22] = 2112;
      v53 = v30;
      v54 = 2114;
      v55 = v31;
      _os_log_impl(&dword_2117D4000, v27, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: FilePath:%@, combinedScores - %{public}@", v52, 0x2Au);

    }
    +[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:](SSRUtils, "logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
    v32 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v34 = v32;
      objc_msgSend(v33, "sessionId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"));
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 136315650;
      *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v35;
      *(_WORD *)&v52[22] = 2114;
      v53 = v36;
      _os_log_impl(&dword_2117D4000, v34, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Finished the session with known user scores %{public}@", v52, 0x20u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
    v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) != 0)
    {
      v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
      -[NSObject voiceRecognitionOrchestratorFinishedProcessing:withFinalVoiceRecognitionInfo:](v39, "voiceRecognitionOrchestratorFinishedProcessing:withFinalVoiceRecognitionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
    }
    else
    {
      v40 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        objc_msgSend(*(id *)(a1 + 40), "_logSpeakerIdProcessorScoreDelayWithScoreInfo:hasFinished:", *(_QWORD *)(a1 + 32), 1);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "logAggregator");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "pushAnalytics");

        return;
      }
      v41 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v39 = v40;
      objc_msgSend(v41, "sessionId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v52 = 136315394;
      *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInf"
                           "o:]_block_invoke";
      *(_WORD *)&v52[12] = 2114;
      *(_QWORD *)&v52[14] = v42;
      _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Discarded speaker scores for session", v52, 0x16u);

    }
    goto LABEL_25;
  }
  v47 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v48 = *(void **)(v21 + 48);
    v14 = v47;
    objc_msgSend(v48, "sessionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v49 + 128))
      v50 = CFSTR("SAT");
    else
      v50 = CFSTR("PSR");
    objc_msgSend(*(id *)(v49 + 48), "sessionId", *(_QWORD *)v52, *(_OWORD *)&v52[8], v53);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v52 = 136315906;
    *(_QWORD *)&v52[4] = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:]_block_invoke";
    *(_WORD *)&v52[12] = 2114;
    *(_QWORD *)&v52[14] = v15;
    *(_WORD *)&v52[22] = 2114;
    v53 = v50;
    v54 = 2114;
    v55 = v51;
    _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Wait for %{public}@ analyzer to complete the session - %{public}@", v52, 0x2Au);

    goto LABEL_29;
  }
}

void __72__SSRSpeakerRecognitionOrchestrator_speakerRecognizer_hasSpeakerIdInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    if (v4 == *(_QWORD *)(v3 + 80))
    {
      v5 = 104;
    }
    else
    {
      if (v4 != *(_QWORD *)(v3 + 88))
        goto LABEL_9;
      v5 = 112;
    }
    objc_storeStrong((id *)(v3 + v5), v2);
    v3 = *(_QWORD *)(a1 + 40);
LABEL_9:
    objc_msgSend((id)v3, "orchestratorScoresWithPSRScores:withSATScores:withSegmentStartTime:", *(_QWORD *)(v3 + 104), *(_QWORD *)(v3 + 112), *(double *)(v3 + 16));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 120);
    *(_QWORD *)(v12 + 120) = v11;

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
      -[NSObject voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:](v16, "voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));
    }
    else
    {
      v17 = (void *)*MEMORY[0x24BE284B8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 40), "_logSpeakerIdProcessorScoreDelayWithScoreInfo:hasFinished:", *(_QWORD *)(a1 + 32), 0);
        return;
      }
      v18 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
      v16 = v17;
      objc_msgSend(v18, "sessionId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "sessionId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizer:hasSpeakerIdInfo:]_block_invoke";
      v23 = 2114;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Discarded speaker scores for session - %{public}@", (uint8_t *)&v21, 0x20u);

    }
    goto LABEL_14;
  }
  v6 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v8 = v6;
    objc_msgSend(v7, "sessionId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    v21 = 136315650;
    v22 = "-[SSRSpeakerRecognitionOrchestrator speakerRecognizer:hasSpeakerIdInfo:]_block_invoke";
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v10;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: ERR: VoiceInfo is nil from recognizer %{public}@", (uint8_t *)&v21, 0x20u);

  }
}

void __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "lastScoreCard");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "lastScoreCard");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  objc_msgSend(*(id *)(a1 + 32), "orchestratorScoresWithPSRScores:withSATScores:withSegmentStartTime:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 16));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __66__SSRSpeakerRecognitionOrchestrator_getLatestVoiceRecognitionInfo__block_invoke_46(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "logAggregator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpeakerRecognitionWaitTime:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "logAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpeakerRecognitionProcessingStatus:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "logAggregator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushAnalytics");

}

uint64_t __54__SSRSpeakerRecognitionOrchestrator_resetWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  os_log_t *v4;
  os_log_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  os_log_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  v4 = (os_log_t *)MEMORY[0x24BE284B8];
  if (v3)
  {
    *(_QWORD *)(v2 + 168) = 0;

    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      v7 = v5;
      objc_msgSend(v6, "sessionId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      *(_DWORD *)buf = 136315650;
      v26 = "-[SSRSpeakerRecognitionOrchestrator resetWithContext:]_block_invoke";
      v27 = 2114;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Released OS transaction for %{public}@", buf, 0x20u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "osTransactionReqd"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("SSRSpeakerRecognitionOrchestrator-%@"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 176);
    *(_QWORD *)(v14 + 176) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "UTF8String");
    v16 = os_transaction_create();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 168);
    *(_QWORD *)(v17 + 168) = v16;

    v19 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      v21 = v19;
      objc_msgSend(v20, "sessionId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      *(_DWORD *)buf = 136315650;
      v26 = "-[SSRSpeakerRecognitionOrchestrator resetWithContext:]_block_invoke";
      v27 = 2114;
      v28 = v22;
      v29 = 2114;
      v30 = v23;
      _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Creating OS transaction for %{public}@", buf, 0x20u);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_resetWithContext:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__SSRSpeakerRecognitionOrchestrator_endAudio__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "endAudio");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "endAudio");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "endAudio");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "endAudio");
}

void __61__SSRSpeakerRecognitionOrchestrator_processAudio_numSamples___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 40)
    || objc_msgSend(*(id *)(v2 + 48), "recognitionStyle") != 2
    && (v11 = *(_QWORD *)(a1 + 32),
        v12 = *(_QWORD *)(v11 + 32),
        v12 > objc_msgSend(*(id *)(v11 + 48), "maxAllowedAudioSamples")))
  {
    v3 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      v5 = v3;
      objc_msgSend(v4, "sessionId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(unsigned __int8 *)(v7 + 40);
      v9 = *(_QWORD *)(v7 + 32);
      v10 = objc_msgSend(*(id *)(v7 + 48), "maxAllowedAudioSamples");
      v13 = 136316162;
      v14 = "-[SSRSpeakerRecognitionOrchestrator processAudio:numSamples:]_block_invoke";
      v15 = 2114;
      v16 = v6;
      v17 = 1024;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = v10;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s SSROrch[%{public}@]:: Ignoring addAudio, endAudio: %d procSamples: %lu maxProcSamples: %lu", (uint8_t *)&v13, 0x30u);

    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) += *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "processAudioData:numSamples:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "processAudioData:numSamples:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "processAudioData:numSamples:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

@end
