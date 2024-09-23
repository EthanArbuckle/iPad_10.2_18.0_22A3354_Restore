@implementation VTKeywordAnalyzerNDAPI

- (VTKeywordAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  VTKeywordAnalyzerNDAPI *v8;
  VTNovDetector *v9;
  VTNovDetector *novDetector;
  VTKeywordAnalyzerNDAPI *v11;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VTKeywordAnalyzerNDAPI;
  v8 = -[VTKeywordAnalyzerNDAPI init](&v15, sel_init);
  if (v8
    && (v9 = -[VTNovDetector initWithConfigPath:resourcePath:]([VTNovDetector alloc], "initWithConfigPath:resourcePath:", v6, v7), novDetector = v8->_novDetector, v8->_novDetector = v9, novDetector, !v8->_novDetector))
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_20D965000, v12, OS_LOG_TYPE_ERROR, "NDAPI initialization failed", v14, 2u);
    }
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (void)reset
{
  self->_lastSampleFed = 0;
  self->_sampleFedWrapAroundOffset = 0;
  -[VTNovDetector reset](self->_novDetector, "reset");
  -[VTKeywordAnalyzerNDAPI _resetStartAnalyzeTime](self, "_resetStartAnalyzeTime");
}

- (void)resetBest
{
  -[VTNovDetector resetBest](self->_novDetector, "resetBest");
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_startAnalyzeSampleCount = 0;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_startAnalyzeSampleCount = a3;
    v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134349056;
      v6 = a3;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "set StartAnalyzeSampleCount = %{public}lld", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)getAnalyzedResultsFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  -[VTKeywordAnalyzerNDAPI _processAudioFloatBuffer:numSamples:](self, "_processAudioFloatBuffer:numSamples:", a3, a4);
  return -[VTKeywordAnalyzerNDAPI getAnalyzedResults](self, "getAnalyzedResults");
}

- (id)getAnalyzedResultsFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  -[VTKeywordAnalyzerNDAPI _processAudioInt16Buffer:numSamples:](self, "_processAudioInt16Buffer:numSamples:", a3, a4);
  return -[VTKeywordAnalyzerNDAPI getAnalyzedResults](self, "getAnalyzedResults");
}

- (id)getBestAnalyzedResultsFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  -[VTKeywordAnalyzerNDAPI _processAudioFloatBuffer:numSamples:](self, "_processAudioFloatBuffer:numSamples:", a3, a4);
  return -[VTKeywordAnalyzerNDAPI getBestAnalyzedResults](self, "getBestAnalyzedResults");
}

- (id)getBestAnalyzedResultsFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  -[VTKeywordAnalyzerNDAPI _processAudioInt16Buffer:numSamples:](self, "_processAudioInt16Buffer:numSamples:", a3, a4);
  return -[VTKeywordAnalyzerNDAPI getBestAnalyzedResults](self, "getBestAnalyzedResults");
}

- (void)_processAudioFloatBuffer:(id)a3 numSamples:(unint64_t)a4
{
  void *v5;
  id v6;

  -[VTKeywordAnalyzerNDAPI analyzeWavFloatData:numSamples:](self, "analyzeWavFloatData:numSamples:", a3, a4);
  -[VTNovDetector getAnalyzedResultForPhId:](self->_novDetector, "getAnalyzedResultForPhId:", self->_activePhId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "sampleFed") < self->_lastSampleFed)
      self->_sampleFedWrapAroundOffset += 0xFFFFFFFFLL;
    self->_lastSampleFed = objc_msgSend(v6, "sampleFed");
    v5 = v6;
  }

}

- (void)_processAudioInt16Buffer:(id)a3 numSamples:(unint64_t)a4
{
  void *v5;
  id v6;

  -[VTKeywordAnalyzerNDAPI analyzeWavData:numSamples:](self, "analyzeWavData:numSamples:", a3, a4);
  -[VTNovDetector getAnalyzedResultForPhId:](self->_novDetector, "getAnalyzedResultForPhId:", self->_activePhId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "sampleFed") < self->_lastSampleFed)
      self->_sampleFedWrapAroundOffset += 0xFFFFFFFFLL;
    self->_lastSampleFed = objc_msgSend(v6, "sampleFed");
    v5 = v6;
  }

}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  -[VTNovDetector analyzeWavData:numSamples:](self->_novDetector, "analyzeWavData:numSamples:", a3, a4);
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
  -[VTNovDetector analyzeWavFloatData:numSamples:](self->_novDetector, "analyzeWavFloatData:numSamples:", a3, a4);
}

- (id)_keywordAnalyzerNDAPIResultFromNovDetectorResult:(id)a3 phId:(unint64_t)a4
{
  id v6;
  VTKeywordAnalyzerNDAPIResult *v7;
  uint64_t v8;

  if (a3)
  {
    v6 = a3;
    v7 = objc_alloc_init(VTKeywordAnalyzerNDAPIResult);
    -[VTKeywordAnalyzerNDAPIResult setPhId:](v7, "setPhId:", a4);
    -[VTKeywordAnalyzerNDAPIResult setSamplesFed:](v7, "setSamplesFed:", objc_msgSend(v6, "sampleFed"));
    -[VTKeywordAnalyzerNDAPIResult setBestPhrase:](v7, "setBestPhrase:", objc_msgSend(v6, "bestPhrase"));
    -[VTKeywordAnalyzerNDAPIResult setBestStart:](v7, "setBestStart:", self->_startAnalyzeSampleCount + objc_msgSend(v6, "bestStart") + self->_sampleFedWrapAroundOffset);
    -[VTKeywordAnalyzerNDAPIResult setBestEnd:](v7, "setBestEnd:", self->_startAnalyzeSampleCount + objc_msgSend(v6, "bestEnd") + self->_sampleFedWrapAroundOffset);
    objc_msgSend(v6, "bestScore");
    -[VTKeywordAnalyzerNDAPIResult setBestScore:](v7, "setBestScore:");
    -[VTKeywordAnalyzerNDAPIResult setIsEarlyWarning:](v7, "setIsEarlyWarning:", objc_msgSend(v6, "earlyWarning"));
    v8 = objc_msgSend(v6, "sampleFed");

    -[VTKeywordAnalyzerNDAPIResult setSamplesAtFire:](v7, "setSamplesAtFire:", self->_startAnalyzeSampleCount + v8 + self->_sampleFedWrapAroundOffset);
    -[VTKeywordAnalyzerNDAPIResult setStartSampleCount:](v7, "setStartSampleCount:", self->_startAnalyzeSampleCount);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)getAnalyzedResults
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[VTNovDetector numResultsAvailable](self->_novDetector, "numResultsAvailable");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = v4;
    do
    {
      -[VTNovDetector getAnalyzedResultForPhId:](self->_novDetector, "getAnalyzedResultForPhId:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTKeywordAnalyzerNDAPI _keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:](self, "_keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      ++v6;
    }
    while (v7 != v6);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)getBestAnalyzedResults
{
  void *v3;
  void *v4;

  -[VTNovDetector getBestAnalyzedResult](self->_novDetector, "getBestAnalyzedResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTKeywordAnalyzerNDAPI _keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:](self, "_keywordAnalyzerNDAPIResultFromNovDetectorResult:phId:", v3, objc_msgSend(v3, "bestPhrase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  return -[VTNovDetector getSuperVectorWithEndPoint:](self->_novDetector, "getSuperVectorWithEndPoint:", a3 - (self->_startAnalyzeSampleCount + self->_sampleFedWrapAroundOffset));
}

- (float)getThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  uint8_t v8[16];

  -[VTNovDetector getOptionValue:](self->_novDetector, "getOptionValue:", CFSTR("threshold_normal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_20D965000, v6, OS_LOG_TYPE_FAULT, "NDAPI config doesn't contain threshold_normal", v8, 2u);
    }
    v5 = INFINITY;
  }

  return v5;
}

- (float)getLoggingThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  uint8_t v8[16];

  -[VTNovDetector getOptionValue:](self->_novDetector, "getOptionValue:", CFSTR("threshold_logging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "NDAPI config doesn't contain threshold_logging", v8, 2u);
    }
    v5 = INFINITY;
  }

  return v5;
}

- (float)getRejectLoggingThreshold
{
  void *v2;
  void *v3;
  float v4;
  float v5;
  NSObject *v6;
  uint8_t v8[16];

  -[VTNovDetector getOptionValue:](self->_novDetector, "getOptionValue:", CFSTR("threshold_reject_logging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "NDAPI config doesn't contain threshold_reject_logging", v8, 2u);
    }
    v5 = INFINITY;
  }

  return v5;
}

- (unsigned)activePhId
{
  return self->_activePhId;
}

- (void)setActivePhId:(unsigned int)a3
{
  self->_activePhId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_novDetector, 0);
}

@end
