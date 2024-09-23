@implementation VTPhraseDetector

- (VTPhraseDetector)init
{
  VTPhraseDetector *v2;
  VTPhraseDetector *v3;
  uint64_t v4;
  NSMutableArray *phraseDetectorInfos;
  uint64_t v6;
  NSMutableArray *phraseResult;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VTPhraseDetector;
  v2 = -[VTPhraseDetector init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_nearMissDelayTimeout = 8000;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    phraseDetectorInfos = v3->_phraseDetectorInfos;
    v3->_phraseDetectorInfos = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    phraseResult = v3->_phraseResult;
    v3->_phraseResult = (NSMutableArray *)v6;

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "VTPhraseDetector Deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VTPhraseDetector;
  -[VTPhraseDetector dealloc](&v4, sel_dealloc);
}

- (void)setRunAsSecondChance:(BOOL)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  NSObject *v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  VTPhraseDetector *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  double v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = self;
  v3 = self->_phraseDetectorInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    if (a3)
    {
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v9, "phraseConfig", v21);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "secondChanceThreshold");
            v13 = v12;
            objc_msgSend(v11, "threshold");
            *(float *)&v14 = v13;
            objc_msgSend(v9, "setEffectiveKeywordThreshold:", v14);
            v15 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134349056;
              v28 = v13;
              _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "Using second chance threshold for voice trigger second pass: %{public}f", buf, 0xCu);
            }
          }
          else
          {
            v8 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20D965000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch config", buf, 2u);
            }
          }

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v5);
    }
    else
    {
      do
      {
        for (j = 0; j != v5; ++j)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v3);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(v17, "phraseConfig", v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "secondChanceThreshold");
            objc_msgSend(v19, "threshold");
            objc_msgSend(v17, "setEffectiveKeywordThreshold:");
          }
          else
          {
            v20 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20D965000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch config", buf, 2u);
            }
          }

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v5);
    }
  }

  v21->_isSecondChance = a3;
}

- (void)reset
{
  NSObject *v3;
  unint64_t v4;
  VTSinglePhraseResult *v5;
  double v6;
  double v7;
  double v8;
  VTSinglePhraseResult *v9;
  uint8_t v10[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }
  -[VTKeywordAnalyzerNDAPI reset](self->_syncKeywordAnalyzerNDAPI, "reset");
  -[VTSyncKeywordAnalyzerQuasar reset](self->_syncKeywordAnalyzerQuasar, "reset");
  -[NSMutableArray removeAllObjects](self->_phraseResult, "removeAllObjects");
  if (-[NSMutableArray count](self->_phraseDetectorInfos, "count"))
  {
    v4 = 0;
    do
    {
      v5 = [VTSinglePhraseResult alloc];
      LODWORD(v6) = -8388608;
      LODWORD(v7) = -998637568;
      LODWORD(v8) = -8388608;
      v9 = -[VTSinglePhraseResult initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:](v5, "initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:", v4, 0, 0, 0, 0, self->_syncKeywordAnalyzerQuasar != 0, v6, v8, v7);
      -[NSMutableArray addObject:](self->_phraseResult, "addObject:", v9);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_phraseDetectorInfos, "count"));
  }
}

- (void)setConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  VTPhraseDetectorInfo *v12;
  VTKeywordAnalyzerNDAPI *v13;
  void *v14;
  void *v15;
  VTKeywordAnalyzerNDAPI *v16;
  VTKeywordAnalyzerNDAPI *syncKeywordAnalyzerNDAPI;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  float v49;
  float v50;
  int v51;
  int v52;
  int v53;
  NSObject *v54;
  float v55;
  float v56;
  int v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  int v62;
  void *v63;
  NSObject *v64;
  const __CFString *v65;
  VTSyncKeywordAnalyzerQuasar *v66;
  void *v67;
  VTSyncKeywordAnalyzerQuasar *v68;
  VTSyncKeywordAnalyzerQuasar *syncKeywordAnalyzerQuasar;
  uint64_t v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  double v85;
  __int16 v86;
  double v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "phraseConfigs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[NSMutableArray removeAllObjects](self->_phraseDetectorInfos, "removeAllObjects");
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v4, "phraseConfigs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v81 != v10)
            objc_enumerationMutation(v7);
          v12 = -[VTPhraseDetectorInfo initWithPhraseConfig:]([VTPhraseDetectorInfo alloc], "initWithPhraseConfig:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
          if (v12)
            -[NSMutableArray addObject:](self->_phraseDetectorInfos, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v9);
    }

    v13 = [VTKeywordAnalyzerNDAPI alloc];
    objc_msgSend(v4, "configPathNDAPI");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resourcePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[VTKeywordAnalyzerNDAPI initWithConfigPath:resourcePath:](v13, "initWithConfigPath:resourcePath:", v14, v15);
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    self->_syncKeywordAnalyzerNDAPI = v16;

    v71 = v4;
    if (self->_syncKeywordAnalyzerNDAPI
      && +[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets")
      && objc_msgSend(v4, "useRecognizerCombination"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v19 = self->_phraseDetectorInfos;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v77;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v77 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "phraseConfig");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "recognizerToken");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v25);

          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
        }
        while (v21);
      }

      v60 = +[VTUtilities horsemanDeviceType](VTUtilities, "horsemanDeviceType") == 3;
      +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "shouldOverwriteVoiceTriggerMLock");

      if (v62)
      {
        +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v63, "overwritingVoiceTriggerMLock");

      }
      v64 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&v65 = COERCE_DOUBLE(CFSTR("disabled"));
        if ((_DWORD)v60)
          *(double *)&v65 = COERCE_DOUBLE(CFSTR("enabled"));
        *(_DWORD *)buf = 138412290;
        v85 = *(double *)&v65;
        _os_log_impl(&dword_20D965000, v64, OS_LOG_TYPE_DEFAULT, "VoiceTrigger memory lock %@", buf, 0xCu);
      }
      v66 = [VTSyncKeywordAnalyzerQuasar alloc];
      objc_msgSend(v71, "configPathRecognizer");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[VTSyncKeywordAnalyzerQuasar initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:](v66, "initWithConfigPath:triggerTokensArray:preventDuplicatedReset:memoryLock:", v67, v18, +[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"), v60);
      syncKeywordAnalyzerQuasar = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = v68;

    }
    else
    {
      v18 = self->_syncKeywordAnalyzerQuasar;
      self->_syncKeywordAnalyzerQuasar = 0;
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v26 = self->_phraseDetectorInfos;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v73;
      v70 = 134349312;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v73 != v29)
            objc_enumerationMutation(v26);
          v33 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
          objc_msgSend(v33, "phraseConfig", v70);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "threshold");
          v36 = v35;
          objc_msgSend(v34, "secondChanceThreshold");
          v38 = v37;
          objc_msgSend(v34, "loggingThreshold");
          v40 = v39;
          objc_msgSend(v34, "ndapiScaleFactor");
          v48 = LODWORD(v41);
          if (self->_syncKeywordAnalyzerNDAPI)
          {
            if (self->_syncKeywordAnalyzerQuasar)
              goto LABEL_31;
          }
          else
          {
            v54 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D965000, v54, OS_LOG_TYPE_DEFAULT, "Reset all thresholds to HUGE_VALF since NDAPI is nil", buf, 2u);
            }
            v36 = INFINITY;
            v38 = INFINITY;
            v40 = INFINITY;
            if (self->_syncKeywordAnalyzerQuasar)
            {
LABEL_31:
              objc_msgSend(v34, "recognizerScoreOffset");
              v50 = v49;
              v36 = v36 + v49;
              v38 = v38 + v49;
              objc_msgSend(v34, "recognizerScoreScaleFactor");
              v52 = v51;
              objc_msgSend(v34, "keywordRejectLoggingThreshold");
              v53 = LODWORD(v41);
              if (!self->_syncKeywordAnalyzerNDAPI)
                goto LABEL_26;
              goto LABEL_37;
            }
          }
          v50 = 0.0;
          v53 = 2139095040;
          v52 = 0;
          if (!self->_syncKeywordAnalyzerNDAPI)
            goto LABEL_26;
LABEL_37:
          if (!self->_syncKeywordAnalyzerQuasar)
          {
            if (objc_msgSend(v71, "useRecognizerCombination"))
            {
              -[VTKeywordAnalyzerNDAPI getThreshold](self->_syncKeywordAnalyzerNDAPI, "getThreshold");
              v36 = v55;
              -[VTKeywordAnalyzerNDAPI getLoggingThreshold](self->_syncKeywordAnalyzerNDAPI, "getLoggingThreshold");
              v40 = v56;
              -[VTKeywordAnalyzerNDAPI getRejectLoggingThreshold](self->_syncKeywordAnalyzerNDAPI, "getRejectLoggingThreshold");
              v53 = v57;
              v58 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v70;
                v85 = v36;
                v86 = 2050;
                v87 = v40;
                _os_log_impl(&dword_20D965000, v58, OS_LOG_TYPE_DEFAULT, "Using threshold from NDAPI since we are not able to use Quasar, threshold = %{public}f, logging threshold = %{public}f", buf, 0x16u);
              }
            }
          }
LABEL_26:
          *(float *)&v41 = v36;
          *(float *)&v42 = v38;
          *(float *)&v43 = v40;
          LODWORD(v44) = v48;
          *(float *)&v45 = v50;
          LODWORD(v46) = v52;
          LODWORD(v47) = v53;
          v31 = (void *)objc_msgSend(v34, "copyWithThreshold:secondChanceThreshold:loggingThreshold:ndapiScaleFactor:recognizerScoreOffset:recognizerScoreScaleFactor:keywordRejectLoggingThreshold:", v41, v42, v43, v44, v45, v46, v47);
          objc_msgSend(v33, "setPhraseConfig:", v31);
          *(float *)&v32 = v36;
          objc_msgSend(v33, "setEffectiveKeywordThreshold:", v32);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      }
      while (v28);
    }

    -[VTPhraseDetector reset](self, "reset");
    v4 = v71;
  }
  else
  {
    v59 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v59, OS_LOG_TYPE_ERROR, "Invalid assets config!", buf, 2u);
    }
  }

}

- (id)getAnalyzedResultFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  VTKeywordAnalyzerNDAPI *syncKeywordAnalyzerNDAPI;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    v7 = a3;
    -[VTKeywordAnalyzerNDAPI getAnalyzedResultsFromFloatAudioBuffer:numSamples:](syncKeywordAnalyzerNDAPI, "getAnalyzedResultsFromFloatAudioBuffer:numSamples:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTSyncKeywordAnalyzerQuasar getAnalyzedResultsFromFloatAudioBuffer:numSamples:](self->_syncKeywordAnalyzerQuasar, "getAnalyzedResultsFromFloatAudioBuffer:numSamples:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:](self, "_phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)getAnalyzedResultFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  VTKeywordAnalyzerNDAPI *syncKeywordAnalyzerNDAPI;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    syncKeywordAnalyzerNDAPI = self->_syncKeywordAnalyzerNDAPI;
    v7 = a3;
    -[VTKeywordAnalyzerNDAPI getAnalyzedResultsFromInt16AudioBuffer:numSamples:](syncKeywordAnalyzerNDAPI, "getAnalyzedResultsFromInt16AudioBuffer:numSamples:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTSyncKeywordAnalyzerQuasar getAnalyzedResultsFromInt16AudioBuffer:numSamples:](self->_syncKeywordAnalyzerQuasar, "getAnalyzedResultsFromInt16AudioBuffer:numSamples:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[VTPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:](self, "_phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)getAnalyzedResultFromFlushedAudio
{
  void *v3;
  void *v4;
  void *v5;

  -[VTKeywordAnalyzerNDAPI getAnalyzedResults](self->_syncKeywordAnalyzerNDAPI, "getAnalyzedResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio](self->_syncKeywordAnalyzerQuasar, "getResultsFromFlushedAudio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTPhraseDetector _phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:](self, "_phraseDetectorResultFromNDAPIResults:quasarResult:forceMaximized:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)phraseDetectorInfoFromPhId:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_phraseDetectorInfos, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_phraseDetectorInfos, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_phraseDetectorResultFromNDAPIResults:(id)a3 quasarResult:(id)a4 forceMaximized:(BOOL)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t i;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  uint64_t j;
  void *v31;
  float v32;
  float v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableArray *v39;
  NSObject *v40;
  NSObject *v42;
  __int128 v43;
  NSMutableArray *obj;
  _BOOL4 v45;
  VTPhraseDetector *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v45 = a5;
  v65 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v47 = v7;
  v9 = objc_msgSend(v7, "count");
  if (v9 >= -[NSMutableArray count](self->_phraseDetectorInfos, "count"))
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v46 = self;
    obj = self->_phraseDetectorInfos;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v12)
    {
      v14 = v12;
      v15 = 0;
      v16 = *(_QWORD *)v57;
      *(_QWORD *)&v13 = 134217984;
      v43 = v13;
      v17 = v8;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v8, "count", v43) <= (unint64_t)(v15 + i))
          {
            v21 = 0;
          }
          else
          {
            objc_msgSend(v8, "objectAtIndex:", v15 + i);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v47, "objectAtIndex:", v15 + i);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VTPhraseDetector _getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:](v46, "_getResultWithPhId:phraseDetectorInfo:ndapiResult:quasarResult:forceMaximized:", v15 + i, v20, v22, v21, v45);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23 && -[NSMutableArray count](v46->_phraseResult, "count") > (unint64_t)(v15 + i))
          {
            -[NSMutableArray setObject:atIndexedSubscript:](v46->_phraseResult, "setObject:atIndexedSubscript:", v23, v15 + i);
          }
          else
          {
            v19 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              v63 = v15 + i;
              _os_log_error_impl(&dword_20D965000, v19, OS_LOG_TYPE_ERROR, "Received invalid result with %tu", buf, 0xCu);
            }
          }

          v8 = v17;
        }
        v15 += i;
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v14);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v24 = v46->_phraseResult;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v53;
      v29 = -INFINITY;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v53 != v28)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_msgSend(v31, "ndapiScore");
          if (v32 > v29)
          {
            objc_msgSend(v31, "ndapiScore");
            v29 = v33;
            v27 = objc_msgSend(v31, "phId");
          }
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    -[VTPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:](v46, "_resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:", 1, v27, v46->_phraseResult);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v34 = v46->_phraseResult;
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v49;
LABEL_33:
        v38 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v37)
            objc_enumerationMutation(v34);
          v39 = *(NSMutableArray **)(*((_QWORD *)&v48 + 1) + 8 * v38);
          if (!-[NSMutableArray decision](v39, "decision"))
            break;
          if (v36 == ++v38)
          {
            v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
            if (v36)
              goto LABEL_33;
            goto LABEL_39;
          }
        }
      }
      else
      {
LABEL_39:

        -[VTPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:](v46, "_resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:", 2, v27, v46->_phraseResult);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_45;
        -[VTPhraseDetector _resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:](v46, "_resultCopyWithKeywordDetectorDecision:bestPhId:phraseResult:", 3, v27, v46->_phraseResult);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_45;
        v40 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_20D965000, v40, OS_LOG_TYPE_FAULT, "Phrase detector results fall-into unexpected use case", buf, 2u);
        }
        -[NSMutableArray objectAtIndexedSubscript:](v46->_phraseResult, "objectAtIndexedSubscript:", v27);
        v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v34 = v39;
      }
      v11 = (void *)-[NSMutableArray copy](v39, "copy");

    }
  }
  else
  {
    v10 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v42 = v10;
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = objc_msgSend(v7, "count");
      _os_log_error_impl(&dword_20D965000, v42, OS_LOG_TYPE_ERROR, "Unable to process due to number of result mismatch, ndapiResults number = %d", buf, 8u);

    }
    v11 = 0;
  }
LABEL_45:

  return v11;
}

- (id)_getResultWithPhId:(unint64_t)a3 phraseDetectorInfo:(id)a4 ndapiResult:(id)a5 quasarResult:(id)a6 forceMaximized:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  VTSinglePhraseResult *v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  double v30;
  float v31;
  float v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  double v36;
  _BOOL4 v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  double v44;
  double v45;
  double v46;
  _BOOL8 v47;
  VTSinglePhraseResult *v48;
  double v49;
  double v50;
  double v51;
  double v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  unint64_t nearMissDelayTimeout;
  unint64_t nearMissCandidateDetectedSamples;
  double v60;
  NSObject *v61;
  NSObject *v62;
  double v63;
  unint64_t v64;
  NSObject *v65;
  NSObject *log;
  _BOOL4 v67;
  unint64_t v68;
  void *v69;
  uint8_t buf[4];
  unint64_t v71;
  __int16 v72;
  double v73;
  __int16 v74;
  double v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  uint64_t v82;

  v7 = a7;
  v82 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[NSMutableArray count](self->_phraseResult, "count") > a3)
  {
    v67 = v7;
    -[NSMutableArray objectAtIndex:](self->_phraseResult, "objectAtIndex:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "phraseConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v15, "ndapiScore");
      v18 = v17;
    }
    else
    {
      v18 = -INFINITY;
    }
    v20 = objc_msgSend(v12, "hasPendingNearMiss");
    objc_msgSend(v12, "effectiveKeywordThreshold");
    v22 = v21;
    objc_msgSend(v16, "loggingThreshold");
    v24 = v23;
    objc_msgSend(v16, "ndapiScaleFactor");
    v26 = v25;
    objc_msgSend(v16, "recognizerScoreScaleFactor");
    v28 = v27;
    if (v14)
    {
      objc_msgSend(v14, "triggerConfidence");
      v30 = v29;
    }
    else
    {
      v30 = -1000.0;
    }
    v69 = v15;
    objc_msgSend(v13, "bestScore");
    v32 = v31;
    v33 = v13;
    v34 = objc_msgSend(v13, "samplesFed");
    v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
    if (0xCCCCCCCCCCCCCCCDLL * _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat <= 0x3333333333333333)
    {
      log = VTLogContextFacilityVoiceTrigger;
      v36 = *(double *)&v34;
      v37 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO);
      v34 = *(_QWORD *)&v36;
      if (v37)
      {
        *(_DWORD *)buf = 134219264;
        v71 = a3;
        v72 = 2050;
        v73 = v32;
        v74 = 2050;
        v75 = v36;
        v76 = 2050;
        v77 = v30;
        v78 = 2050;
        v79 = v26;
        v80 = 2050;
        v81 = v28;
        _os_log_impl(&dword_20D965000, log, OS_LOG_TYPE_INFO, "[(%lu)] : NDAPI second pass best score = %{public}f with analyzed samples:                   %{public}tu with quasar score = %{public}f, ndapi scale factor = %{public}f, quasar scale factor = %{public}f", buf, 0x3Eu);
        v34 = *(_QWORD *)&v36;
        v35 = _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat;
      }
    }
    v38 = v35 + 1;
    _getResultWithPhId_phraseDetectorInfo_ndapiResult_quasarResult_forceMaximized__heartbeat = v35 + 1;
    v39 = v32;
    if (self->_syncKeywordAnalyzerQuasar)
      v39 = (float)(v26 * v32) + v30 * v28;
    v40 = v20;
    v13 = v33;
    if (v18 < v32 && !v67)
    {
LABEL_16:
      v41 = 0;
LABEL_17:
      objc_msgSend(v12, "setHasPendingNearMiss:", v40);
      objc_msgSend(v12, "phraseConfig");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "secondChanceThreshold");
      LODWORD(v44) = v43;
      *(float *)&v45 = v39;
      *(float *)&v46 = v22;
      v47 = -[VTPhraseDetector _isSecondChanceCandidateWithScore:effectiveThreshold:secondChanceThreshold:](self, "_isSecondChanceCandidateWithScore:effectiveThreshold:secondChanceThreshold:", v45, v46, v44);

      v48 = [VTSinglePhraseResult alloc];
      *(float *)&v49 = v30;
      *(float *)&v50 = v39;
      *(float *)&v51 = v32;
      v19 = -[VTSinglePhraseResult initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:](v48, "initWithPhId:keywordDetectorDecision:combinedScore:ndapiScore:ndapiResult:recognizerScore:isSecondChance:isSecondChanceCandidate:isRunningQuasar:", a3, v41, v13, self->_isSecondChance, v47, self->_syncKeywordAnalyzerQuasar != 0, v50, v51, v49);

      goto LABEL_18;
    }
    if (v39 >= v22)
    {
      v55 = (void *)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v55;
        *(double *)&v57 = COERCE_DOUBLE(objc_msgSend(v33, "samplesFed"));
        *(_DWORD *)buf = 134218752;
        v71 = a3;
        v72 = 2050;
        v73 = *(double *)&v57;
        v74 = 2050;
        v75 = v39;
        v76 = 2050;
        v77 = v22;
        _os_log_impl(&dword_20D965000, v56, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Trigger detected with %{public}tu analyzed samples in NDAPI,                   combined score = %{public}lf, effective threshold = %{public}f", buf, 0x2Au);

      }
      v41 = 1;
      goto LABEL_17;
    }
    if (v39 < v24)
    {
      if (v67)
      {
        v53 = *(double *)&v34;
        v54 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v71 = a3;
          v72 = 2050;
          v73 = v53;
          v74 = 2050;
          v75 = v39;
          _os_log_impl(&dword_20D965000, v54, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Notify second pass reject at: %{public}tu                   with best score up to: %{public}.3f", buf, 0x20u);
        }
        v41 = 3;
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (!v67)
    {
      if ((_DWORD)v20)
      {
        nearMissDelayTimeout = self->_nearMissDelayTimeout;
        nearMissCandidateDetectedSamples = self->_nearMissCandidateDetectedSamples;
        if (nearMissDelayTimeout + nearMissCandidateDetectedSamples < v34)
          goto LABEL_31;
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v38, 1) <= 0x1999999999999999uLL)
        {
          v68 = v34;
          v65 = VTLogContextFacilityVoiceTrigger;
          v40 = 1;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v71 = a3;
            v72 = 2050;
            *(_QWORD *)&v73 = v68 - nearMissCandidateDetectedSamples + nearMissDelayTimeout;
            _os_log_impl(&dword_20D965000, v65, OS_LOG_TYPE_INFO, "[(%tu)] : Waiting for logging near miss                               until timeout %{public}lu samples", buf, 0x16u);
            v41 = 0;
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else
      {
        self->_nearMissCandidateDetectedSamples = v34;
        v62 = VTLogContextFacilityVoiceTrigger;
        v63 = *(double *)&v34;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v64 = self->_nearMissDelayTimeout;
          *(_DWORD *)buf = 134218496;
          v71 = a3;
          v72 = 2050;
          v73 = v63;
          v74 = 2050;
          v75 = *(double *)&v64;
          _os_log_impl(&dword_20D965000, v62, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Detected near miss candidate at %{public}tu,                       let's wait %{public}tu samples to log", buf, 0x20u);
        }
      }
      v41 = 0;
      v40 = 1;
      goto LABEL_17;
    }
LABEL_31:
    v60 = *(double *)&v34;
    v61 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v71 = a3;
      v72 = 2050;
      v73 = v60;
      v74 = 2050;
      v75 = v39;
      _os_log_impl(&dword_20D965000, v61, OS_LOG_TYPE_DEFAULT, "[(%tu)] : Detected near miss at %{public}lu samples                       with best score up to: %{public}.3f", buf, 0x20u);
    }
    v41 = 2;
    goto LABEL_17;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

- (BOOL)_isSecondChanceCandidateWithScore:(float)a3 effectiveThreshold:(float)a4 secondChanceThreshold:(float)a5
{
  BOOL v5;

  v5 = a3 < a4;
  if (a3 < a5)
    v5 = 0;
  return !self->_isSecondChance && v5;
}

- (id)_resultCopyWithKeywordDetectorDecision:(unint64_t)a3 bestPhId:(unint64_t)a4 phraseResult:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "decision");

  if (v9 == a3)
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v28 = a3;
      v29 = 2048;
      v30 = a4;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Reporting decision (%tu) from (%tu)", buf, 0x16u);
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
LABEL_16:
    v17 = (void *)objc_msgSend(v11, "copy");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v11, "decision", (_QWORD)v22) == a3)
          {
            v18 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              v20 = objc_msgSend(v11, "phId");
              *(_DWORD *)buf = 134218240;
              v28 = a3;
              v29 = 2048;
              v30 = v20;
              _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "Reporting decision (%tu) from (%tu)", buf, 0x16u);

            }
            goto LABEL_16;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 0;
  }

  return v17;
}

- (VTKeywordAnalyzerNDAPI)syncKeywordAnalyzerNDAPI
{
  return self->_syncKeywordAnalyzerNDAPI;
}

- (void)setSyncKeywordAnalyzerNDAPI:(id)a3
{
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerNDAPI, a3);
}

- (VTSyncKeywordAnalyzerQuasar)syncKeywordAnalyzerQuasar
{
  return self->_syncKeywordAnalyzerQuasar;
}

- (void)setSyncKeywordAnalyzerQuasar:(id)a3
{
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, a3);
}

- (NSMutableArray)phraseDetectorInfos
{
  return self->_phraseDetectorInfos;
}

- (void)setPhraseDetectorInfos:(id)a3
{
  objc_storeStrong((id *)&self->_phraseDetectorInfos, a3);
}

- (unint64_t)nearMissDelayTimeout
{
  return self->_nearMissDelayTimeout;
}

- (void)setNearMissDelayTimeout:(unint64_t)a3
{
  self->_nearMissDelayTimeout = a3;
}

- (unint64_t)nearMissCandidateDetectedSamples
{
  return self->_nearMissCandidateDetectedSamples;
}

- (void)setNearMissCandidateDetectedSamples:(unint64_t)a3
{
  self->_nearMissCandidateDetectedSamples = a3;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setIsSecondChance:(BOOL)a3
{
  self->_isSecondChance = a3;
}

- (NSMutableArray)phraseResult
{
  return self->_phraseResult;
}

- (void)setPhraseResult:(id)a3
{
  objc_storeStrong((id *)&self->_phraseResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseResult, 0);
  objc_storeStrong((id *)&self->_phraseDetectorInfos, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerQuasar, 0);
  objc_storeStrong((id *)&self->_syncKeywordAnalyzerNDAPI, 0);
}

@end
