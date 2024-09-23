@implementation SLProgressiveCheckerAnalyzer

- (SLProgressiveCheckerAnalyzer)initWithConfig:(id)a3 withDelegate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SLProgressiveCheckerAnalyzer *v10;
  NSObject *v11;
  SLProgressiveCheckerAnalyzer *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLProgressiveCheckerAnalyzer;
  v10 = -[SLProgressiveCheckerAnalyzer init](&v14, sel_init);
  if (v10)
  {
    if (SLLogInitIfNeeded_once != -1)
      dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
    if (!-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:](v10, "_setUpAnalyzerWithConfig:error:", v8, a5))
    {
      v12 = 0;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&v10->_delegate, a4);
    v11 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SLProgressiveCheckerAnalyzer initWithConfig:withDelegate:error:]";
      _os_log_impl(&dword_213B50000, v11, OS_LOG_TYPE_INFO, "%s Initialized Progressive Checkers !", buf, 0xCu);
    }
  }
  v12 = v10;
LABEL_9:

  return v12;
}

- (BOOL)_setUpAnalyzerWithConfig:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSDictionary *v18;
  NSDictionary *invocationToPhraseMap;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  NSMutableArray *v29;
  NSMutableArray *activeRecognizers;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  NSMutableArray *checkerEndSamples;
  unint64_t checkerType;
  void *v36;
  float v37;
  float v38;
  void *v39;
  float v40;
  id v41;
  double v42;
  double v43;
  CSAudioCircularBuffer *v44;
  CSAudioCircularBuffer *circBuffer;
  NSMutableArray *v46;
  void *v47;
  NSObject *v48;
  unint64_t numSamplesInStride;
  NSMutableArray *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  double v55;
  _QWORD v57[4];
  id v58;
  SLProgressiveCheckerAnalyzer *v59;
  uint64_t *v60;
  _QWORD v61[5];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  double v71;
  __int16 v72;
  unint64_t v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE28430], "decodeJsonFromFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__722;
  v66 = __Block_byref_object_dispose__723;
  v67 = 0;
  if (!v8
    || (objc_msgSend(MEMORY[0x24BE28430], "getAftmCheckerConfigFromConfigDict:", v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9 == 0,
        v9,
        v10))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing config for Progressive checker %@"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD1540];
    v76 = CFSTR("reason");
    v77[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 103, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v63[5];
    v63[5] = v14;

    if (a4)
    {
LABEL_14:
      v28 = 0;
      *a4 = objc_retainAutorelease((id)v63[5]);
      goto LABEL_32;
    }

  }
  self->_shouldUseMultiPhrasesCheckerOutput = 0;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tokenToInvocationMap"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    self->_shouldUseMultiPhrasesCheckerOutput = 1;
    v17 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]";
      _os_log_impl(&dword_213B50000, v17, OS_LOG_TYPE_INFO, "%s multi phreases output checker model is used", buf, 0xCu);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tokenToInvocationMap"));
    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    invocationToPhraseMap = self->_invocationToPhraseMap;
    self->_invocationToPhraseMap = v18;

    -[NSDictionary objectForKeyedSubscript:](self->_invocationToPhraseMap, "objectForKeyedSubscript:", CFSTR("hsInvocationToken"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_invocationToPhraseMap, "objectForKeyedSubscript:", CFSTR("jsInvocationToken"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_invocationToPhraseMap, "objectForKeyedSubscript:", CFSTR("magusInvocationToken"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        if (!v23)
          goto LABEL_16;
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing keys hsInvocationToken/jsInvocationToken/magusInvocationToken in 'tokenToInvocationMap'  %@"), self->_invocationToPhraseMap);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldUseMultiPhrasesCheckerOutput = 0;
    v24 = (void *)MEMORY[0x24BDD1540];
    v74 = CFSTR("reason");
    v75 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 103, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v63[5];
    v63[5] = v26;

    if (a4)
      goto LABEL_14;

  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BE28430], "getAftmCheckerConfigFromConfigDict:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  activeRecognizers = self->_activeRecognizers;
  self->_activeRecognizers = v29;

  objc_msgSend(v11, "objectForKey:", CFSTR("checkerType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  self->_checkerType = objc_msgSend(v31, "unsignedIntValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("checkerTimes"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  checkerEndSamples = self->_checkerEndSamples;
  self->_checkerEndSamples = v33;

  checkerType = self->_checkerType;
  if (checkerType == 2)
  {
    objc_msgSend(v32, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    v38 = v37;

    objc_msgSend(v32, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "floatValue");
    self->_numSamplesInStride = (unint64_t)(float)(v40 * 16000.0);

    v41 = objc_alloc(MEMORY[0x24BE28398]);
    LODWORD(v42) = 1182400512;
    *(float *)&v43 = v38;
    v44 = (CSAudioCircularBuffer *)objc_msgSend(v41, "initWithNumChannels:recordingDuration:samplingRate:", 1, v43, v42);
    circBuffer = self->_circBuffer;
    self->_circBuffer = v44;

    v46 = self->_checkerEndSamples;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0xFFFFFFFFLL);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v46, "addObject:", v47);

    self->_numSamplesAddedToBufferSinceLastFlush = 0;
    v48 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      numSamplesInStride = self->_numSamplesInStride;
      *(_DWORD *)buf = 136315650;
      v69 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]";
      v70 = 2048;
      v71 = (float)(v38 * 16000.0);
      v72 = 2048;
      v73 = numSamplesInStride;
      _os_log_impl(&dword_213B50000, v48, OS_LOG_TYPE_DEFAULT, "%s Configured buffer size: %f samples, to be flushed after every %lu samples", buf, 0x20u);
    }
  }
  else if (checkerType)
  {
    v50 = self->_checkerEndSamples;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0xFFFFFFFFLL);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v50, "addObject:", v51);

  }
  else
  {
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke;
    v61[3] = &unk_24D0C62F0;
    v61[4] = self;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v61);
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE28430], "getAftmRecognizerRelativeConfigFromConfigDict:", v8);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = 0;
  }
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke_89;
  v57[3] = &unk_24D0C6318;
  v59 = self;
  v60 = &v62;
  v58 = v7;
  objc_msgSend(v52, "enumerateObjectsUsingBlock:", v57);
  v53 = (void *)v63[5];
  v28 = v53 == 0;
  if (v53)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v53);
    v54 = (id)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v63[5], "localizedDescription");
      v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v69 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]";
      v70 = 2114;
      v71 = v55;
      _os_log_impl(&dword_213B50000, v54, OS_LOG_TYPE_DEFAULT, "%s Failed to initialize SLProgressiveCheckerAnalyzer with error %{public}@", buf, 0x16u);

    }
  }

LABEL_32:
  _Block_object_dispose(&v62, 8);

  return v28;
}

- (void)_startNewRequestWithContext:(id)a3
{
  id v5;
  SLProgressiveCheckerContext **p_context;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *activeRecognizers;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  p_context = &self->_context;
  objc_storeStrong((id *)&self->_context, a3);
  -[SLProgressiveCheckerContext vtei](self->_context, "vtei");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SLProgressiveCheckerContext vtei](*p_context, "vtei");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("triggerEndSampleCount"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_5:

      goto LABEL_6;
    }
    v11 = (void *)v10;
    -[SLProgressiveCheckerContext vtei](*p_context, "vtei");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("triggerStartSampleCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SLProgressiveCheckerContext vtei](*p_context, "vtei");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndSampleCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unsignedIntegerValue");
      -[SLProgressiveCheckerContext vtei](*p_context, "vtei");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("triggerStartSampleCount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "unsignedIntegerValue");

      goto LABEL_5;
    }
  }
LABEL_6:
  activeRecognizers = self->_activeRecognizers;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__SLProgressiveCheckerAnalyzer__startNewRequestWithContext___block_invoke;
  v18[3] = &unk_24D0C6340;
  v19 = v5;
  v17 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](activeRecognizers, "enumerateObjectsUsingBlock:", v18);
  -[CSAudioCircularBuffer reset](self->_circBuffer, "reset");

}

- (void)_addAudio:(id)a3
{
  id v4;
  char v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  CSAudioCircularBuffer *circBuffer;
  id v11;
  CSAudioCircularBuffer *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  unint64_t numSamplesAddedToBufferSinceLastFlush;
  NSMutableArray *activeRecognizers;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  SLProgressiveCheckerAnalyzer *v22;
  id v23;
  _BYTE *v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SLProgressiveCheckerContext audioOption](self->_context, "audioOption");
  v6 = objc_msgSend(v4, "length");
  v7 = v5 & 2;
  v8 = 1;
  if ((v5 & 2) != 0)
    v8 = 2;
  v9 = v6 >> v8;
  if (self->_checkerType != 2)
    goto LABEL_11;
  circBuffer = self->_circBuffer;
  v11 = objc_retainAutorelease(v4);
  -[CSAudioCircularBuffer addSamples:numSamples:](circBuffer, "addSamples:numSamples:", objc_msgSend(v11, "bytes"), v9);
  v12 = self->_circBuffer;
  self->_numSamplesAddedToBufferSinceLastFlush += v9;
  v13 = -[CSAudioCircularBuffer sampleCount](v12, "sampleCount");
  if (self->_numSamplesAddedToBufferSinceLastFlush < self->_numSamplesInStride
    || (v14 = v13, v13 < -[CSAudioCircularBuffer bufferLength](self->_circBuffer, "bufferLength")))
  {
    v4 = v11;
    goto LABEL_14;
  }
  v27 = 0;
  v4 = (id)-[CSAudioCircularBuffer copyBufferWithNumSamplesCopiedIn:](self->_circBuffer, "copyBufferWithNumSamplesCopiedIn:", &v27);

  v9 = v27;
  v15 = SLLogContextFacilityCoreSpeech;
  if (v27)
  {
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      numSamplesAddedToBufferSinceLastFlush = self->_numSamplesAddedToBufferSinceLastFlush;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SLProgressiveCheckerAnalyzer _addAudio:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2048;
      v29 = (uint64_t (*)(uint64_t, uint64_t))numSamplesAddedToBufferSinceLastFlush;
      LOWORD(v30) = 2048;
      *(_QWORD *)((char *)&v30 + 2) = v14;
      _os_log_impl(&dword_213B50000, v15, OS_LOG_TYPE_DEFAULT, "%s Flushed %lu samples to checker, samples since last flush %lu, total samples in buffer %lu", buf, 0x2Au);
      v9 = v27;
    }
    self->_numSamplesAddedToBufferSinceLastFlush = 0;
LABEL_11:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__722;
    *(_QWORD *)&v30 = __Block_byref_object_dispose__723;
    *((_QWORD *)&v30 + 1) = 0;
    activeRecognizers = self->_activeRecognizers;
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __42__SLProgressiveCheckerAnalyzer__addAudio___block_invoke;
    v21 = &unk_24D0C6368;
    v22 = self;
    v25 = v9;
    v26 = v7 >> 1;
    v4 = v4;
    v23 = v4;
    v24 = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](activeRecognizers, "enumerateObjectsUsingBlock:", &v18);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      -[NSMutableArray removeObjectsAtIndexes:](self->_activeRecognizers, "removeObjectsAtIndexes:", v18, v19, v20, v21, v22);

    _Block_object_dispose(buf, 8);
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SLProgressiveCheckerAnalyzer _addAudio:]";
    _os_log_error_impl(&dword_213B50000, v15, OS_LOG_TYPE_ERROR, "%s Unable to copy from circular buffer !", buf, 0xCu);
  }
LABEL_14:

}

- (void)_endAudio
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  unint64_t numSamplesAddedToBufferSinceLastFlush;
  char v7;
  NSMutableArray *activeRecognizers;
  NSMutableArray *v9;
  SLProgressiveCheckerResult *v10;
  double latestScore;
  SLProgressiveCheckerResult *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _BYTE buf[24];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDAC760];
  if (self->_checkerType == 2)
  {
    -[CSAudioCircularBuffer copybufferFrom:to:](self->_circBuffer, "copybufferFrom:to:", -[CSAudioCircularBuffer sampleCount](self->_circBuffer, "sampleCount")- self->_numSamplesAddedToBufferSinceLastFlush);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        numSamplesAddedToBufferSinceLastFlush = self->_numSamplesAddedToBufferSinceLastFlush;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SLProgressiveCheckerAnalyzer _endAudio]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = numSamplesAddedToBufferSinceLastFlush;
        _os_log_impl(&dword_213B50000, v5, OS_LOG_TYPE_DEFAULT, "%s Flushed %lu samples to checker", buf, 0x16u);
      }
      v7 = -[SLProgressiveCheckerContext audioOption](self->_context, "audioOption");
      activeRecognizers = self->_activeRecognizers;
      v14[0] = v3;
      v14[1] = 3221225472;
      v14[2] = __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke;
      v14[3] = &unk_24D0C6390;
      v14[4] = self;
      v16 = (v7 & 2) != 0;
      v15 = v4;
      -[NSMutableArray enumerateObjectsUsingBlock:](activeRecognizers, "enumerateObjectsUsingBlock:", v14);

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v18 = 0;
  v9 = self->_activeRecognizers;
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke_2;
  v13[3] = &unk_24D0C63B8;
  v13[4] = self;
  v13[5] = buf;
  -[NSMutableArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v13);
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = [SLProgressiveCheckerResult alloc];
    latestScore = self->_latestScore;
    *(float *)&latestScore = latestScore;
    v12 = -[SLProgressiveCheckerResult initWithScore:ofType:analyzedSamples:detailedResults:](v10, "initWithScore:ofType:analyzedSamples:detailedResults:", self->_checkerType, self->_analyzedSamplesSoFar, 0, latestScore);
    -[SLProgressiveCheckerAnalyzerDelegate analyzer:hasFinalResult:](self->_delegate, "analyzer:hasFinalResult:", self, v12);

  }
  _Block_object_dispose(buf, 8);
}

- (id)_getTokenByInvocationType:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_shouldUseMultiPhrasesCheckerOutput)
  {
    v6 = 0;
    goto LABEL_27;
  }
  if (-[SLProgressiveCheckerContext invocationType](self->_context, "invocationType") == 4)
  {
    v5 = CFSTR("hsInvocationToken");
    goto LABEL_9;
  }
  if (-[SLProgressiveCheckerContext invocationType](self->_context, "invocationType") == 5)
  {
    v5 = CFSTR("jsInvocationToken");
    goto LABEL_9;
  }
  if (-[SLProgressiveCheckerContext invocationType](self->_context, "invocationType") == 6)
  {
    v5 = CFSTR("magusInvocationToken");
LABEL_9:
    -[NSDictionary objectForKeyedSubscript:](self->_invocationToPhraseMap, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
LABEL_12:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "tokens", (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastObject");
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "tokenName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v7);

          if ((v15 & 1) != 0)
            break;

          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v10)
              goto LABEL_12;
            goto LABEL_18;
          }
        }

        if (v6)
          goto LABEL_26;
      }
      else
      {
LABEL_18:

      }
      v16 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[SLProgressiveCheckerAnalyzer _getTokenByInvocationType:]";
        _os_log_debug_impl(&dword_213B50000, v16, OS_LOG_TYPE_DEBUG, "%s No token found in multiPhrases checker output, Check if phrases are correctly defined in asset decoder config", buf, 0xCu);
      }
    }
    goto LABEL_25;
  }
  v17 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SLProgressiveCheckerAnalyzer _getTokenByInvocationType:]";
    _os_log_debug_impl(&dword_213B50000, v17, OS_LOG_TYPE_DEBUG, "%s context invocation type does not map to either of HS/JS/MAGUS", buf, 0xCu);
  }
  v7 = 0;
LABEL_25:
  v6 = 0;
LABEL_26:

LABEL_27:
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationToPhraseMap, 0);
  objc_storeStrong((id *)&self->_circBuffer, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_checkerEndSamples, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_activeRecognizers, 0);
}

id __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) += *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (*(_BYTE *)(a1 + 48))
    return (id)objc_msgSend(a2, "resultsWithAddedFloatAudio:numberOfSamples:taskName:", v2, v3, &stru_24D0C6768);
  else
    return (id)objc_msgSend(a2, "resultsWithAddedAudio:numberOfSamples:taskName:", v2, v3, &stru_24D0C6768);
}

void __41__SLProgressiveCheckerAnalyzer__endAudio__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "resultsWithEndedAudio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getTokenByInvocationType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_5;
  }
  objc_msgSend(v5, "end");
  if (v8 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v5, "confidence");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v9;
    objc_msgSend(v5, "end");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  }
  else
  {
LABEL_5:
    v11 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[SLProgressiveCheckerAnalyzer _endAudio]_block_invoke_2";
      _os_log_impl(&dword_213B50000, v11, OS_LOG_TYPE_DEFAULT, "%s All Checkers Finished, but with confidence of last audio chunk not updated", (uint8_t *)&v17, 0xCu);
    }
  }
  v12 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v14 = v12;
    objc_msgSend(v5, "tokenName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v17 = 136315906;
    v18 = "-[SLProgressiveCheckerAnalyzer _endAudio]_block_invoke";
    v19 = 2050;
    v20 = v13;
    v21 = 2114;
    v22 = v15;
    v23 = 2050;
    v24 = v16;
    _os_log_impl(&dword_213B50000, v14, OS_LOG_TYPE_DEFAULT, "%s All Checkers Finished, analyzed %{public}lu samples, token %{public}@, confidence %{public}f", (uint8_t *)&v17, 0x2Au);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", v3);

}

void __42__SLProgressiveCheckerAnalyzer__addAudio___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  SLProgressiveCheckerResult *v26;
  uint64_t v27;
  double v28;
  SLProgressiveCheckerResult *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) += *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v5, "resultsWithAddedFloatAudio:numberOfSamples:taskName:", v7, v8, &stru_24D0C6768);
  else
    objc_msgSend(v5, "resultsWithAddedAudio:numberOfSamples:taskName:", v7, v8, &stru_24D0C6768);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 32);
  objc_msgSend(*(id *)(v10 + 24), "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  if (v11 >= v13)
  {
    v14 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v34 = 136315394;
      v35 = "-[SLProgressiveCheckerAnalyzer _addAudio:]_block_invoke";
      v36 = 2050;
      v37 = v15;
      _os_log_impl(&dword_213B50000, v14, OS_LOG_TYPE_DEFAULT, "%s Calling endAudio after feeding %{public}lu samples to recognizer", (uint8_t *)&v34, 0x16u);
    }
    objc_msgSend(v6, "resultsWithEndedAudio");
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectAtIndex:", a3);
    v9 = (void *)v16;
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_getTokenByInvocationType:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_11;
    objc_msgSend(v9, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tokens");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
LABEL_11:
      objc_msgSend(v17, "confidence");
    else
      v20 = 0xC08F400000000000;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v20;
    v21 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v23 = v21;
      objc_msgSend(v17, "tokenName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v34 = 136316162;
      v35 = "-[SLProgressiveCheckerAnalyzer _addAudio:]_block_invoke";
      v36 = 2048;
      v37 = a3;
      v38 = 2050;
      v39 = v22;
      v40 = 2114;
      v41 = v24;
      v42 = 2050;
      v43 = v25;
      _os_log_impl(&dword_213B50000, v23, OS_LOG_TYPE_DEFAULT, "%s Checker %lu fired, analyzed %{public}lu samples, token %{public}@,  confidence %{public}f", (uint8_t *)&v34, 0x34u);

    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = [SLProgressiveCheckerResult alloc];
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(double *)(v27 + 40);
      *(float *)&v28 = v28;
      v29 = -[SLProgressiveCheckerResult initWithScore:ofType:analyzedSamples:detailedResults:](v26, "initWithScore:ofType:analyzedSamples:detailedResults:", *(_QWORD *)(v27 + 56), *(_QWORD *)(v27 + 32), 0, v28);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "analyzer:hasPartialResult:", *(_QWORD *)(a1 + 32), v29);

    }
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    {
      v30 = (id)objc_msgSend(v6, "resultsWithEndedAudio");
      objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndex:", a3);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

    }
  }

}

void __60__SLProgressiveCheckerAnalyzer__startNewRequestWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "locale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 120;
  LOBYTE(v4) = 0;
  objc_msgSend(v3, "resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:", 16000, v6, CFSTR("Dictation"), &stru_24D0C6768, &stru_24D0C6768, &stru_24D0C6768, v4, CFSTR("ftm"), v5);

}

void __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "floatValue");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(v3 * 16000.0));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

void __63__SLProgressiveCheckerAnalyzer__setUpAnalyzerWithConfig_error___block_invoke_89(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E740]), "initWithConfiguration:", v6);
  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v7);
    v8 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      v10 = v8;
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v19 = "-[SLProgressiveCheckerAnalyzer _setUpAnalyzerWithConfig:error:]_block_invoke";
      v20 = 2050;
      v21 = objc_msgSend(v11, "unsignedIntegerValue");
      v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_213B50000, v10, OS_LOG_TYPE_INFO, "%s Added checker to analyze %{public}lu samples with config file %{public}@", buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EAR recognizer init failed for config: %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v24 = CFSTR("reason");
    v25[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 104, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

@end
