@implementation VTAnalyzerNDAPI

- (VTAnalyzerNDAPI)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  VTAnalyzerNDAPI *v8;
  IntNovDetect *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *decodedInfo;
  VTAnalyzerNDAPI *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VTAnalyzerNDAPI;
  v8 = -[VTAnalyzerNDAPI init](&v17, sel_init);
  if (v8)
  {
    v9 = (IntNovDetect *)operator new();
    IntNovDetect::IntNovDetect(v9);
    v8->_novDetect = v9;
    v10 = objc_retainAutorelease(v6);
    IntNovDetect::initialize(v9, (const char *)objc_msgSend(v10, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4));
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("corespeech.json"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTAnalyzerNDAPI _decodeJson:](v8, "_decodeJson:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    decodedInfo = v8->_decodedInfo;
    v8->_decodedInfo = (NSDictionary *)v13;

  }
  v15 = v8;

  return v15;
}

- (void)dealloc
{
  IntNovDetect *novDetect;
  objc_super v4;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    IntNovDetect::~IntNovDetect(novDetect);
    MEMORY[0x212BAC9D8]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VTAnalyzerNDAPI;
  -[VTAnalyzerNDAPI dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  IntNovDetect *novDetect;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
    IntNovDetect::reset(novDetect, a2);
}

- (void)resetBest
{
  IntNovDetect *novDetect;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
    IntNovDetect::resetbest(novDetect, a2);
}

- (void)analyzeWavData:(const signed __int16 *)a3 length:(int)a4
{
  IntNovDetect *novDetect;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
    IntNovDetect::wavedata(novDetect, (const char *)a3, a4);
}

- (const)getAnalyzedResult
{
  const _ndresult *result;

  result = (const _ndresult *)self->_novDetect;
  if (result)
    return (const _ndresult *)IntNovDetect::getresults((IntNovDetect *)result, a2);
  return result;
}

- (const)getAnalyzedResult:(unsigned int)a3
{
  _DWORD *novDetect;
  const char *v4;
  IntNovDetect *v6;
  char *v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  novDetect = self->_novDetect;
  if (!novDetect)
    return 0;
  if (*novDetect != -1838836561)
  {
    v8 = "Invalid NovDetect Object Signature";
    goto LABEL_11;
  }
  if (novDetect[1] != 1)
  {
    v8 = "NovDetect: phrasecount() can only be called after initialize()";
LABEL_11:
    Error::chuck((Error *)v8, a2, *(_QWORD *)&a3);
  }
  v4 = *(const char **)&a3;
  v6 = (IntNovDetect *)self->_novDetect;
  if (*((_BYTE *)novDetect + 40))
  {
    v9 = 6;
    (*(void (**)(_DWORD *, const char *, int *))(*((_QWORD *)novDetect + 2) + 64))(novDetect + 4, "all ok", &v9);
    *((_BYTE *)novDetect + 40) = 0;
    v6 = (IntNovDetect *)self->_novDetect;
  }
  if ((int)novDetect[770] < 1)
    return (const _ndresult *)IntNovDetect::getresults(v6, a2);
  else
    return (const _ndresult *)IntNovDetect::getphraseresults(v6, v4);
}

- (BOOL)initializeSAT:(id)a3
{
  id v4;
  void *v5;
  IntNovDetect *novDetect;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    IntNovDetect::sat_initialize(novDetect, (const char *)objc_msgSend(objc_retainAutorelease(v4), "cStringUsingEncoding:", 4));
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (const)getSuperVectorWithEndPoint:(unsigned int)a3
{
  double v3;
  const _ndsupervec *result;

  result = (const _ndsupervec *)self->_novDetect;
  if (result)
    return (const _ndsupervec *)IntNovDetect::getsupervector((IntNovDetect *)result, *(const char **)&a3, v3);
  return result;
}

- (const)analyzeSAT:(const float *)a3 size:(unsigned int)a4
{
  char *novDetect;
  const _ndsvscore *v5;
  int v6;
  char *v7;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  novDetect = (char *)self->_novDetect;
  if (!novDetect)
    return 0;
  if (*(_DWORD *)novDetect != -1838836561)
  {
    v7 = "Invalid NovDetect Object Signature";
    goto LABEL_8;
  }
  if (*((_DWORD *)novDetect + 3) != 1)
  {
    v7 = "NovDetect: sat_analyze() can only be called after sat_initialize()";
LABEL_8:
    Error::chuck((Error *)v7, a2, a3, *(_QWORD *)&a4);
  }
  *((_DWORD *)novDetect + 670) = 0;
  TSSATScorer::score((TSSATScorer *)(novDetect + 2184), a3, *(uint64_t *)&a4);
  v5 = (const _ndsvscore *)(novDetect + 2680);
  *((_DWORD *)novDetect + 670) = v6;
  if (novDetect[40])
  {
    v9 = 6;
    (*(void (**)(char *, const char *, int *))(*((_QWORD *)novDetect + 2) + 64))(novDetect + 16, "all ok", &v9);
    novDetect[40] = 0;
  }
  return v5;
}

- (void)updateSAT
{
  IntNovDetect *novDetect;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
    IntNovDetect::sat_update(novDetect, a2);
}

- (const)getScoreSuperVector:(const float *)a3 size:(unsigned int)a4
{
  const _ndsvscore *result;

  result = (const _ndsvscore *)self->_novDetect;
  if (result)
    return (const _ndsvscore *)IntNovDetect::scoresupervector((IntNovDetect *)result, a3, *(uint64_t *)&a4);
  return result;
}

- (void)deleteVectorIndex:(int)a3
{
  IntNovDetect *novDetect;

  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
    IntNovDetect::sat_deletevector(novDetect, *(const char **)&a3);
}

- (int)getSATVectorCount
{
  _DWORD *novDetect;
  int v3;
  char *v5;
  int v6[7];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  novDetect = self->_novDetect;
  if (!novDetect)
    return -1;
  if (*novDetect != -1838836561)
  {
    v5 = "Invalid NovDetect Object Signature";
    goto LABEL_10;
  }
  if (novDetect[3] != 1)
  {
    v5 = "NovDetect: sat_vectorcount() can only be called after sat_initialize()";
LABEL_10:
    Error::chuck((Error *)v5, a2);
  }
  v3 = novDetect[577];
  if (*((_BYTE *)novDetect + 40))
  {
    v6[0] = 6;
    (*(void (**)(_DWORD *, const char *, int *))(*((_QWORD *)novDetect + 2) + 64))(novDetect + 4, "all ok", v6);
    *((_BYTE *)novDetect + 40) = 0;
  }
  return v3;
}

- (double)getCombinedTriggerThreshold
{
  void *v2;
  float v3;
  double v4;

  -[VTAnalyzerNDAPI _getNumberForKey:category:default:](self, "_getNumberForKey:category:default:", CFSTR("threshold"), CFSTR("voiceTriggerSecondPass"), &unk_24C803170);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (double)getNDAPITriggerThreshold
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("threshold_normal"), INFINITY);
  return result;
}

- (double)getCombinedSecondChanceThreshold
{
  void *v2;
  float v3;
  double v4;

  -[VTAnalyzerNDAPI _getNumberForKey:category:default:](self, "_getNumberForKey:category:default:", CFSTR("2ndChanceThreshold"), CFSTR("voiceTriggerSecondPass"), &unk_24C803170);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (double)getNDAPISecondChanceThreshold
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("threshold_2ndchance"), INFINITY);
  return result;
}

- (double)getCombinedLoggingThreshold
{
  void *v2;
  float v3;
  double v4;

  -[VTAnalyzerNDAPI _getNumberForKey:category:default:](self, "_getNumberForKey:category:default:", CFSTR("loggingThreshold"), CFSTR("voiceTriggerSecondPass"), &unk_24C803170);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (double)getNDAPILoggingThreshold
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("threshold_logging"), INFINITY);
  return result;
}

- (double)getExtraSamplesAtStart
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("extra_samples_at_start"), 0.0);
  return result;
}

- (double)getSecondPassTrailingTime
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("second_pass_trailing_time"), 0.5);
  return result;
}

- (BOOL)getDoSupervectorSecondaryTest
{
  return -[VTAnalyzerNDAPI _getBooleanValueFromConfigurationName:defaultTo:](self, "_getBooleanValueFromConfigurationName:defaultTo:", CFSTR("do_supervector_secondarytest"), 0);
}

- (double)getThresholdPresuperVector
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("threshold_presupervector"), INFINITY);
  return result;
}

- (BOOL)getDoSAT
{
  return -[VTAnalyzerNDAPI _getBooleanValueFromConfigurationName:defaultTo:](self, "_getBooleanValueFromConfigurationName:defaultTo:", CFSTR("do_sat"), 0);
}

- (double)getThresholdSAT
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("threshold_sat"), INFINITY);
  return result;
}

- (int)getRetrainNumExplicitUtt
{
  return -[VTAnalyzerNDAPI _getIntValueFromConfigurationName:defaultTo:](self, "_getIntValueFromConfigurationName:defaultTo:", CFSTR("retrain_num_explicit_utt"), 0x7FFFFFFFLL);
}

- (int)getRetrainNumImplicitUtt
{
  return -[VTAnalyzerNDAPI _getIntValueFromConfigurationName:defaultTo:](self, "_getIntValueFromConfigurationName:defaultTo:", CFSTR("retrain_num_implicit_utt"), 0x7FFFFFFFLL);
}

- (id)getRetrainSamplingPolicy
{
  return -[VTAnalyzerNDAPI _getStringValueFromConfigurationName:defaultTo:](self, "_getStringValueFromConfigurationName:defaultTo:", CFSTR("retrain_sampling_policy"), CFSTR("random"));
}

- (int)getVoiceProfilePruningNumRetentionUtterances
{
  return -[VTAnalyzerNDAPI _getIntValueFromConfigurationName:defaultTo:](self, "_getIntValueFromConfigurationName:defaultTo:", CFSTR("pruning_retention_utterances"), 7);
}

- (id)getVoiceProfilePruningCookie
{
  return -[VTAnalyzerNDAPI _getStringValueFromConfigurationName:defaultTo:](self, "_getStringValueFromConfigurationName:defaultTo:", CFSTR("voice_profile_pruning_cookie"), 0);
}

- (double)getRetrainThresholdTrigger
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("retrain_threshold_trigger"), -INFINITY);
  return result;
}

- (double)getRetrainThresholdSAT
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("retrain_threshold_sat"), -INFINITY);
  return result;
}

- (double)getRetrainThresholdTDSR
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("retrain_threshold_tdsr"), -INFINITY);
  return result;
}

- (double)getRetrainExplicitUttThresholdSAT
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("retrain_explicit_threshold_sat"), -INFINITY);
  return result;
}

- (double)getRetrainExplicitUttThresholdTDSR
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("retrain_explicit_threshold_tdsr"), -INFINITY);
  return result;
}

- (int)getMaximumSpeakerVectors
{
  return -[VTAnalyzerNDAPI _getIntValueFromConfigurationName:defaultTo:](self, "_getIntValueFromConfigurationName:defaultTo:", CFSTR("max_speaker_vectors"), 40);
}

- (int)getPayloadUtteranceLifeTimeInDays
{
  return -[VTAnalyzerNDAPI _getIntValueFromConfigurationName:defaultTo:](self, "_getIntValueFromConfigurationName:defaultTo:", CFSTR("payload_utterance_lifetime_days"), 180);
}

- (BOOL)getUseRecognizer
{
  return -[VTAnalyzerNDAPI _getBooleanValueFromConfigurationName:defaultTo:](self, "_getBooleanValueFromConfigurationName:defaultTo:", CFSTR("use_recognizer"), 0);
}

- (id)getRecognizerConfig
{
  return -[VTAnalyzerNDAPI _getStringValueFromConfigurationName:defaultTo:](self, "_getStringValueFromConfigurationName:defaultTo:", CFSTR("recognizer_config"), 0);
}

- (double)getRecognizerThresholdOffset
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("recognizer_threshold_offset"), 0.5);
  return result;
}

- (double)getRecognizerWaitTime
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("recognizer_wait_time"), 1.0);
  return result;
}

- (double)getRecognizerScoreScaleFactor
{
  double result;

  -[VTAnalyzerNDAPI _getFloatValueFromConfigurationName:defaultTo:](self, "_getFloatValueFromConfigurationName:defaultTo:", CFSTR("recognizer_score_scale_factor"), 1.0);
  return result;
}

- (id)getTriggerTokens
{
  return -[VTAnalyzerNDAPI _getStringValueFromConfigurationName:defaultTo:](self, "_getStringValueFromConfigurationName:defaultTo:", CFSTR("trigger_tokens"), CFSTR("hey_Siri"));
}

- (BOOL)getUseFallbackThresholdUponTimeout
{
  return -[VTAnalyzerNDAPI _getBooleanValueFromConfigurationName:defaultTo:](self, "_getBooleanValueFromConfigurationName:defaultTo:", CFSTR("use_fallback_threshold_upon_timeout"), 0);
}

- (BOOL)getUseKeywordSpotting
{
  return -[VTAnalyzerNDAPI _getBooleanValueFromConfigurationName:defaultTo:](self, "_getBooleanValueFromConfigurationName:defaultTo:", CFSTR("use_keyword_spotting"), 0);
}

- (id)_getStringValueFromConfigurationName:(id)a3 defaultTo:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[VTAnalyzerNDAPI _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    v9 = v7;
  }
  v11 = v9;

  return v11;
}

- (int)_getIntValueFromConfigurationName:(id)a3 defaultTo:(int)a4
{
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[VTAnalyzerNDAPI _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v8, "intValue");

  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v6;
      v13 = 1026;
      v14 = a4;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}d", (uint8_t *)&v11, 0x12u);
    }
  }

  return a4;
}

- (double)_getFloatValueFromConfigurationName:(id)a3 defaultTo:(double)a4
{
  id v6;
  const char *v7;
  void *v8;
  float v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[VTAnalyzerNDAPI _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    a4 = v9;

  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v6;
      v14 = 2050;
      v15 = a4;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}f", (uint8_t *)&v12, 0x16u);
    }
  }

  return a4;
}

- (BOOL)_getBooleanValueFromConfigurationName:(id)a3 defaultTo:(BOOL)a4
{
  int v4;
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[VTAnalyzerNDAPI _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (v4)
        v10 = CFSTR("YES");
      v12 = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v4;
}

- (const)_getOptionValueFromConfigurationName:(id)a3
{
  id v4;
  void *v5;
  IntNovDetect *novDetect;

  v4 = a3;
  v5 = v4;
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
    novDetect = (IntNovDetect *)IntNovDetect::getoption(novDetect, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));

  return (const char *)novDetect;
}

- (id)_getNumberForKey:(id)a3 category:(id)a4 default:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSDictionary *decodedInfo;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  decodedInfo = self->_decodedInfo;
  if (!decodedInfo)
    goto LABEL_5;
  -[NSDictionary objectForKeyedSubscript:](decodedInfo, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_5;
  -[NSDictionary objectForKeyedSubscript:](self->_decodedInfo, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_decodedInfo, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v17 = VTLogContextFacilityVoiceTrigger;
    v16 = v10;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v8;
      _os_log_error_impl(&dword_20D965000, v17, OS_LOG_TYPE_ERROR, "Cannot access to %{public}@ %{public}@ using default value", (uint8_t *)&v19, 0x16u);
      v16 = v10;
    }
  }

  return v16;
}

- (id)_decodeJson:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v3;
        _os_log_error_impl(&dword_20D965000, v12, OS_LOG_TYPE_ERROR, "Cannot read configuration file : %{public}@", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_19;
    }
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v8)
    {
      v9 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_error_impl(&dword_20D965000, v9, OS_LOG_TYPE_ERROR, "Cannot decode configuration json file : %{public}@", buf, 0xCu);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v7;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v13 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20D965000, v13, OS_LOG_TYPE_ERROR, "Configuration json file is not expected format", buf, 2u);
      }
    }
    v11 = 0;
    goto LABEL_18;
  }
  v10 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_error_impl(&dword_20D965000, v10, OS_LOG_TYPE_ERROR, "Configuration file is not exists : %{public}@", buf, 0xCu);
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedInfo, 0);
}

@end
