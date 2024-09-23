@implementation VTVoiceProfileRetrainer

- (VTVoiceProfileRetrainer)initWithAnalyzer:(id)a3 languageCode:(id)a4 modelType:(unint64_t)a5 configPath:(id)a6 resourcePath:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  VTVoiceProfileRetrainer *v17;
  VTVoiceProfileRetrainer *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  NSString *languageCode;
  objc_super v27;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)VTVoiceProfileRetrainer;
  v17 = -[VTVoiceProfileRetrainer init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_analyzer, a3);
    objc_storeStrong((id *)&v18->_languageCode, a4);
    v18->_modelType = a5;
    objc_storeStrong((id *)&v18->_configPath, a6);
    objc_storeStrong((id *)&v18->_resourcePath, a7);
    objc_msgSend(v13, "getRetrainThresholdTrigger");
    v18->_retrainThresholdTrigger = v19;
    objc_msgSend(v13, "getRetrainExplicitUttThresholdSAT");
    v18->_retrainExplicitUttThresholdSAT = v20;
    objc_msgSend(v13, "getRetrainExplicitUttThresholdTDSR");
    v18->_retrainExplicitUttThresholdTDSR = v21;
    objc_msgSend(v13, "getRetrainThresholdSAT");
    v18->_retrainThresholdSAT = v22;
    objc_msgSend(v13, "getRetrainThresholdTDSR");
    v18->_retrainThresholdTDSR = v23;
    v18->_numRetentionUtterances = (int)objc_msgSend(v13, "getVoiceProfilePruningNumRetentionUtterances");
    v24 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      languageCode = v18->_languageCode;
      *(_DWORD *)buf = 134218242;
      v29 = a5;
      v30 = 2112;
      v31 = languageCode;
      _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "Retrainer intialized for %lu on %@", buf, 0x16u);
    }
  }

  return v18;
}

- (void)dealloc
{
  VTTextDependentSpeakerRecognizer *satRetrainingTdSr;
  objc_super v4;

  -[VTTextDependentSpeakerRecognizer endAudio](self->_satRetrainingTdSr, "endAudio");
  satRetrainingTdSr = self->_satRetrainingTdSr;
  self->_satRetrainingTdSr = 0;

  v4.receiver = self;
  v4.super_class = (Class)VTVoiceProfileRetrainer;
  -[VTVoiceProfileRetrainer dealloc](&v4, sel_dealloc);
}

- (void)retrainSATModelWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  VTAnalyzerNDAPI *analyzer;
  NSObject *v11;
  int v12;
  VTTextDependentSpeakerRecognizer *v13;
  VTTextDependentSpeakerRecognizer *satRetrainingTdSr;
  NSObject *v15;
  VTTextDependentSpeakerRecognizer *v16;
  void *v17;
  VTTextDependentSpeakerRecognizer *v18;
  NSObject *v19;
  VTTextDependentSpeakerRecognizer *v20;
  NSObject *v21;
  _BOOL4 v22;
  VTTextDependentSpeakerRecognizer *v23;
  _BOOL4 v24;
  NSObject *v25;
  VTTextDependentSpeakerRecognizer *v26;
  uint64_t v27;
  _BOOL4 v28;
  int v29;
  VTTextDependentSpeakerRecognizer *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  +[VTUtilities getAssetHashFromConfigPath:](VTUtilities, "getAssetHashFromConfigPath:", self->_configPath);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATDirectoryForModelType:forLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForModelType:forLanguageCode:", self->_modelType, self->_languageCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Retraining SAT speaker models with previous enrollment data", (uint8_t *)&v29, 2u);
  }
  +[VTSpeakerIdUtilities getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:](VTSpeakerIdUtilities, "getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:", self->_modelType, self->_languageCode, self->_configPath, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAnalyzerNDAPI initializeSAT:](self->_analyzer, "initializeSAT:", v8);
  v9 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    analyzer = self->_analyzer;
    v11 = v9;
    v12 = -[VTAnalyzerNDAPI getSATVectorCount](analyzer, "getSATVectorCount");
    v29 = 67240192;
    LODWORD(v30) = v12;
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "re-initializeSAT after removing old invalidSATModel: %{public}d", (uint8_t *)&v29, 8u);

  }
  v13 = -[VTTextDependentSpeakerRecognizer initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:]([VTTextDependentSpeakerRecognizer alloc], "initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:", self->_resourcePath, v6, v5, 1, self);
  satRetrainingTdSr = self->_satRetrainingTdSr;
  self->_satRetrainingTdSr = v13;

  v15 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_satRetrainingTdSr;
    v29 = 138543362;
    v30 = v16;
    _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "TDSR:: Created _tdSrForSatRetraining: %{public}@", (uint8_t *)&v29, 0xCu);
  }
  +[VTSpeakerIdUtilities getSortedEnrollmentUtterancesForType:forLanguageCode:](VTSpeakerIdUtilities, "getSortedEnrollmentUtterancesForType:forLanguageCode:", self->_modelType, self->_languageCode);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTVoiceProfileRetrainer _analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:](self, "_analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:", v17, 1, 0, 0, 0, -INFINITY, -INFINITY, -INFINITY);
  v18 = (VTTextDependentSpeakerRecognizer *)objc_claimAutoreleasedReturnValue();
  v19 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138543362;
    v30 = v18;
    _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "Retraining results - %{public}@ utterances were successfully enrolled", (uint8_t *)&v29, 0xCu);
    v19 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = self->_satRetrainingTdSr;
    v21 = v19;
    v22 = -[VTTextDependentSpeakerRecognizer tdPsrCanProcessRequest](v20, "tdPsrCanProcessRequest");
    v29 = 138543618;
    v30 = v20;
    v31 = 1026;
    v32 = v22;
    _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: _satRetrainingTdSr: %{public}@, _satRetrainingTdSr.tdPsrCanProcessRequest: %{public}d", (uint8_t *)&v29, 0x12u);

  }
  v23 = self->_satRetrainingTdSr;
  if (v23)
  {
    v24 = -[VTTextDependentSpeakerRecognizer tdPsrCanProcessRequest](v23, "tdPsrCanProcessRequest");
    v25 = VTLogContextFacilityVoiceTrigger;
    if (v24)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_satRetrainingTdSr;
        v29 = 138543362;
        v30 = v26;
        _os_log_impl(&dword_20D965000, v25, OS_LOG_TYPE_DEFAULT, "TDSR:: _satRetrainingTdSr Success. _satRetrainingTdSr: %{public}@", (uint8_t *)&v29, 0xCu);
      }
      v27 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    v25 = VTLogContextFacilityVoiceTrigger;
  }
  v28 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  v27 = 0;
  if (v28)
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_20D965000, v25, OS_LOG_TYPE_DEFAULT, "TDSR:: _satRetrainingTdSr FAILED.", (uint8_t *)&v29, 2u);
    v27 = 0;
  }
LABEL_19:
  if (v4)
    v4[2](v4, 1, v27);

}

- (BOOL)pruneVoiceProfileIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  VTTextDependentSpeakerRecognizer *v15;
  VTTextDependentSpeakerRecognizer *satRetrainingTdSr;
  VTTextDependentSpeakerRecognizer *v17;
  VTTextDependentSpeakerRecognizer *v18;
  NSObject *v19;
  VTTextDependentSpeakerRecognizer *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  BOOL v36;
  NSObject *v38;
  double retrainThresholdTrigger;
  double retrainExplicitUttThresholdSAT;
  double retrainExplicitUttThresholdTDSR;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  double v52;
  double retrainThresholdSAT;
  double retrainThresholdTDSR;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  unint64_t numRetentionUtterances;
  uint64_t i;
  int v64;
  uint64_t v65;
  id v66;
  double v67;
  double v68;
  uint64_t v69;
  NSObject *v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  os_log_t log;
  NSObject *loga;
  os_log_t logb;
  NSObject *logc;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  os_log_t v89;
  NSObject *v90;
  os_log_t v91;
  NSObject *v92;
  os_log_t v93;
  os_log_t v94;
  os_log_t v95;
  NSObject *v96;
  os_log_t v97;
  os_log_t v98;
  NSObject *v99;
  void *v100;
  _QWORD v101[4];
  NSObject *v102;
  uint64_t *v103;
  _QWORD v104[4];
  id v105;
  uint64_t *v106;
  id v107;
  id v108;
  _QWORD v109[4];
  id v110;
  uint64_t *v111;
  _QWORD v112[4];
  id v113;
  uint64_t *v114;
  id v115;
  _QWORD v116[5];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  int v120;
  char v121;
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  unint64_t v125;
  __int16 v126;
  unint64_t v127;
  __int16 v128;
  uint64_t v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 28);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUtilities getAssetHashFromConfigPath:](VTUtilities, "getAssetHashFromConfigPath:", self->_configPath);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATDirectoryForModelType:forLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForModelType:forLanguageCode:", self->_modelType, self->_languageCode);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getExplicitEnrollmentUtterancesForType:forLanguageCode:](VTSpeakerIdUtilities, "getExplicitEnrollmentUtterancesForType:forLanguageCode:", 1, self->_languageCode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSortedImplicitEnrollmentUtterancesForType:forLanguageCode:](VTSpeakerIdUtilities, "getSortedImplicitEnrollmentUtterancesForType:forLanguageCode:", 1, self->_languageCode);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_numRetentionUtterances);
  v89 = (os_log_t)objc_claimAutoreleasedReturnValue();
  -[VTVoiceProfileRetrainer _getLastPruningCookie](self, "_getLastPruningCookie");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTAnalyzerNDAPI getVoiceProfilePruningCookie](self->_analyzer, "getVoiceProfilePruningCookie");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v120 = 0;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v123 = (uint64_t)v5;
    v124 = 2114;
    v125 = (unint64_t)v4;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Voice Profile pruning cookie from Asset %{public}@ lastCookie %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "isEqualToString:", v5);
      v8 = VTLogContextFacilityVoiceTrigger;
      if (v7)
      {
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Already pruned voice profile - Bailing out";
LABEL_10:
          _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
          goto LABEL_55;
        }
        goto LABEL_55;
      }
    }
    else
    {
      v8 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v123 = (uint64_t)v3;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Explicit utterances %{public}@", buf, 0xCu);
      v8 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Implicit sorted utterances:", buf, 2u);
    }
    objc_msgSend(v100, "enumerateObjectsUsingBlock:", &__block_literal_global_4251);
    if (v3)
    {
      if ((unint64_t)objc_msgSend(v3, "count") <= 3)
      {
        v10 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20D965000, v10, OS_LOG_TYPE_ERROR, "ERR: Low explicit utterances - Bailing out", buf, 2u);
        }
        +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logVoiceProfilePruningFailureWithReasonCode:", 2);

        if (-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
          goto LABEL_55;
        v12 = VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        *(_WORD *)buf = 0;
        goto LABEL_50;
      }
      if (v100 && objc_msgSend(v100, "count") > self->_numRetentionUtterances)
      {
        if (+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
        {
          +[VTSpeakerIdUtilities getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:](VTSpeakerIdUtilities, "getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:", 1, self->_languageCode, self->_configPath, 1);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[VTAnalyzerNDAPI initializeSAT:](self->_analyzer, "initializeSAT:", v85);
          v15 = -[VTTextDependentSpeakerRecognizer initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:]([VTTextDependentSpeakerRecognizer alloc], "initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:", self->_resourcePath, v87, v88, 1, self);
          satRetrainingTdSr = self->_satRetrainingTdSr;
          self->_satRetrainingTdSr = v15;

          -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
          v17 = -[VTTextDependentSpeakerRecognizer initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:]([VTTextDependentSpeakerRecognizer alloc], "initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:", self->_resourcePath, v87, v88, 1, self);
          v18 = self->_satRetrainingTdSr;
          self->_satRetrainingTdSr = v17;

          v19 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v20 = self->_satRetrainingTdSr;
            *(_DWORD *)buf = 138543362;
            v123 = (uint64_t)v20;
            _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "TDSR:: Created _tdSrForSatRetraining: %{public}@", buf, 0xCu);
            v19 = VTLogContextFacilityVoiceTrigger;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- 1st RUN on explicit---------------------------------------", buf, 2u);
          }
          -[VTVoiceProfileRetrainer _analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:](self, "_analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:", v3, 1, 0, 0, &v121, -INFINITY, -INFINITY, -INFINITY);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v121)
          {
            v23 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20D965000, v23, OS_LOG_TYPE_ERROR, "ERR: TDPSR timeout in voice profile pruning, Bailing out", buf, 2u);
            }
            +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "logVoiceProfilePruningFailureWithReasonCode:", 5);

            if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
            {
              v25 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_20D965000, v25, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
              }
            }
            -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
            if (!-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
            {
              v26 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_20D965000, v26, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
              }
            }
            v27 = 0;
            v28 = 0;
          }
          else
          {
            *((_DWORD *)v118 + 6) = 0;
            v116[0] = MEMORY[0x24BDAC760];
            v116[1] = 3221225472;
            v116[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_12;
            v116[3] = &unk_24C7F43B8;
            v116[4] = &v117;
            objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v116);

            v38 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D965000, v38, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- 2nd RUN on explicit---------------------------------------", buf, 2u);
            }
            retrainThresholdTrigger = self->_retrainThresholdTrigger;
            retrainExplicitUttThresholdSAT = self->_retrainExplicitUttThresholdSAT;
            retrainExplicitUttThresholdTDSR = self->_retrainExplicitUttThresholdTDSR;
            v115 = 0;
            -[VTVoiceProfileRetrainer _analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:](self, "_analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:", v3, 0, 0, &v115, &v121, retrainThresholdTrigger, retrainExplicitUttThresholdSAT, retrainExplicitUttThresholdTDSR);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v115;
            *((_DWORD *)v118 + 6) = 0;
            v112[0] = MEMORY[0x24BDAC760];
            v112[1] = 3221225472;
            v112[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_14;
            v112[3] = &unk_24C7F43E0;
            v114 = &v117;
            v22 = v42;
            v113 = v22;
            objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v112);
            if (v121)
            {
              v43 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_20D965000, v43, OS_LOG_TYPE_ERROR, "ERR: TDPSR timeout in voice profile pruning, Bailing out", buf, 2u);
              }
              +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "logVoiceProfilePruningFailureWithReasonCode:", 5);

              if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
              {
                v45 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20D965000, v45, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                }
              }
              -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
              if (!-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
              {
                v46 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20D965000, v46, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                }
              }
            }
            else
            {
              if (!v28 || !objc_msgSend(v28, "count"))
              {

                v51 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_20D965000, v51, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit selection ---------------------------------------", buf, 2u);
                }
                v52 = self->_retrainThresholdTrigger;
                retrainThresholdSAT = self->_retrainThresholdSAT;
                retrainThresholdTDSR = self->_retrainThresholdTDSR;
                v107 = 0;
                v108 = 0;
                -[VTVoiceProfileRetrainer _analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:](self, "_analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:", v100, 0, &v108, &v107, &v121, v52, retrainThresholdSAT, retrainThresholdTDSR);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v108;
                v27 = v107;
                *((_DWORD *)v118 + 6) = 0;
                v104[0] = MEMORY[0x24BDAC760];
                v104[1] = 3221225472;
                v104[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_19;
                v104[3] = &unk_24C7F43E0;
                v106 = &v117;
                v35 = v55;
                v105 = v35;
                objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v104);
                if (!v121)
                {
                  if (objc_msgSend(v33, "count"))
                  {
                    objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_21);
                    objc_msgSend(v33, "allKeys");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    -[VTVoiceProfileRetrainer _deleteUtterances:](self, "_deleteUtterances:", v60);

                  }
                  objc_msgSend(v35, "allKeys");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  loga = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_20D965000, loga, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit sampling ---------------------------------------", buf, 2u);
                  }
                  v61 = objc_msgSend(v34, "count");
                  numRetentionUtterances = self->_numRetentionUtterances;
                  v77 = numRetentionUtterances;
                  v72 = (v61 - 1 + numRetentionUtterances) / numRetentionUtterances;
                  if (!__CFADD__(v61 - 1, numRetentionUtterances))
                  {
                    v73 = objc_msgSend(v3, "count");
                    logb = 0;
                    v71 = v77 + 5;
                    for (i = -1; ; i = v78 - 1)
                    {
                      v78 = i;
                      if (objc_msgSend(v34, "count") <= (unint64_t)logb)
                        break;
                      if ((unint64_t)logb % v72)
                      {
                        objc_msgSend(v34, "objectAtIndexedSubscript:");
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v86, "addObject:", v74);

                      }
                      else
                      {
                        ++v73;
                      }
                      v64 = objc_msgSend(v34, "count");
                      if (v71 > v73 && v71 - v73 >= (int)v78 + v64)
                        break;
                      logb = (os_log_t)((char *)logb + 1);
                    }
                  }
                  logc = (id)VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled(logc, OS_LOG_TYPE_DEFAULT))
                  {
                    v79 = objc_msgSend(v34, "count");
                    v75 = self->_numRetentionUtterances;
                    v65 = objc_msgSend(v86, "count");
                    *(_DWORD *)buf = 134349824;
                    v123 = v79;
                    v124 = 2050;
                    v125 = v72;
                    v126 = 2050;
                    v127 = v75;
                    v128 = 2050;
                    v129 = v65;
                    _os_log_impl(&dword_20D965000, logc, OS_LOG_TYPE_DEFAULT, "Utterance selection totalImplicit: %{public}lu selectionIndex: %{public}lu retentionCount: %{public}lu deleteCount: %{public}lu ", buf, 0x2Au);
                  }

                  if (v86 && objc_msgSend(v86, "count"))
                  {
                    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v34);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v86);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v80, "minusSet:", v76);
                    objc_msgSend(v80, "allObjects");
                    log = (os_log_t)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    log = v34;

                  }
                  v90 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_20D965000, v90, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit adding ---------------------------------------", buf, 2u);
                  }
                  v66 = -[VTVoiceProfileRetrainer _analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:](self, "_analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:", log, 1, 0, 0, 0, -INFINITY, -INFINITY, -INFINITY);
                  -[VTVoiceProfileRetrainer _computeSamplingMSEForUtts:withBeforeScores:](self, "_computeSamplingMSEForUtts:withBeforeScores:", v86, v35);
                  v68 = v67;
                  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                  v91 = (os_log_t)objc_claimAutoreleasedReturnValue();
                  -[NSObject logProfileUpdateScoreMSE:](v91, "logProfileUpdateScoreMSE:", v68);

                  v92 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_20D965000, v92, OS_LOG_TYPE_DEFAULT, "Pruning::----------------------------- Implicit deletion ---------------------------------------", buf, 2u);
                  }
                  if (objc_msgSend(v27, "count"))
                  {
                    *((_DWORD *)v118 + 6) = 0;
                    v101[0] = MEMORY[0x24BDAC760];
                    v101[1] = 3221225472;
                    v101[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_24;
                    v101[3] = &unk_24C7F43E0;
                    v103 = &v117;
                    v102 = v27;
                    v93 = v102;
                    -[NSObject enumerateKeysAndObjectsUsingBlock:](v102, "enumerateKeysAndObjectsUsingBlock:", v101);
                    -[NSObject allKeys](v93, "allKeys");
                    v94 = (os_log_t)objc_claimAutoreleasedReturnValue();
                    -[VTVoiceProfileRetrainer _deleteUtterances:](self, "_deleteUtterances:", v94);

                  }
                  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                  v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
                  -[NSObject logProfileUpdateNumDiscardedUttsPHS:](v95, "logProfileUpdateNumDiscardedUttsPHS:", objc_msgSend(v27, "count"));

                  if (objc_msgSend(v86, "count"))
                  {
                    v96 = (id)VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      v69 = objc_msgSend(v86, "count");
                      *(_DWORD *)buf = 134218242;
                      v123 = v69;
                      v124 = 2114;
                      v125 = (unint64_t)v86;
                      _os_log_impl(&dword_20D965000, v96, OS_LOG_TYPE_DEFAULT, "Deleting implicit utterances(%lu) - %{public}@", buf, 0x16u);
                    }

                    -[VTVoiceProfileRetrainer _deleteUtterances:](self, "_deleteUtterances:", v86);
                  }
                  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                  v97 = (os_log_t)objc_claimAutoreleasedReturnValue();
                  -[NSObject logProfileUpdateNumPrunedUttsPHS:](v97, "logProfileUpdateNumPrunedUttsPHS:", objc_msgSend(v86, "count"));

                  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                  v98 = (os_log_t)objc_claimAutoreleasedReturnValue();
                  -[NSObject logProfileUpdateNumRetainedUttsPHS:](v98, "logProfileUpdateNumRetainedUttsPHS:", -[NSObject count](log, "count"));

                  if (!-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
                  {
                    v99 = VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_20D965000, v99, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                    }
                  }
                  if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
                  {
                    v70 = VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_20D965000, v70, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                    }
                  }
                  -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
                  goto LABEL_82;
                }
                v56 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20D965000, v56, OS_LOG_TYPE_ERROR, "ERR: TDPSR timeout in voice profile pruning, Bailing out", buf, 2u);
                }
                +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "logVoiceProfilePruningFailureWithReasonCode:", 6);

                if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
                {
                  v58 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_20D965000, v58, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                  }
                }
                -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
                if (!-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
                {
                  v59 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_20D965000, v59, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                  }
                }
                v22 = v105;
LABEL_81:

                v34 = 0;
                log = v89;
LABEL_82:

                v36 = 1;
                v89 = log;
                goto LABEL_56;
              }
              v47 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v123 = (uint64_t)v28;
                _os_log_error_impl(&dword_20D965000, v47, OS_LOG_TYPE_ERROR, "ERR: Detected explicit utterances with lower scores, bailing out - %{public}@", buf, 0xCu);
              }
              +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "logVoiceProfilePruningFailureWithReasonCode:", 4);

              *((_DWORD *)v118 + 6) = 0;
              v109[0] = MEMORY[0x24BDAC760];
              v109[1] = 3221225472;
              v109[2] = __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_18;
              v109[3] = &unk_24C7F43E0;
              v111 = &v117;
              v110 = v28;
              objc_msgSend(v110, "enumerateKeysAndObjectsUsingBlock:", v109);
              if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
              {
                v49 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20D965000, v49, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
                }
              }
              -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
              if (!-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
              {
                v50 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20D965000, v50, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
                }
              }

            }
            v27 = 0;
          }
          v33 = 0;
          v35 = 0;
          goto LABEL_81;
        }
        v31 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20D965000, v31, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
        }
        +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logVoiceProfilePruningFailureWithReasonCode:", 7);

        if (-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
          goto LABEL_55;
        v12 = VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        *(_WORD *)buf = 0;
      }
      else
      {
        v29 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v29, OS_LOG_TYPE_DEFAULT, "Low implicit utterances - Bailing out", buf, 2u);
        }
        +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logVoiceProfilePruningFailureWithReasonCode:", 3);

        if (-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
          goto LABEL_55;
        v12 = VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        *(_WORD *)buf = 0;
      }
    }
    else
    {
      v13 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20D965000, v13, OS_LOG_TYPE_ERROR, "ERR: No explicit utterances!!! - Bailing out", buf, 2u);
      }
      +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logVoiceProfilePruningFailureWithReasonCode:", 1);

      if (-[VTVoiceProfileRetrainer _updatePruningCookie:](self, "_updatePruningCookie:", v5))
        goto LABEL_55;
      v12 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      *(_WORD *)buf = 0;
    }
LABEL_50:
    _os_log_error_impl(&dword_20D965000, v12, OS_LOG_TYPE_ERROR, "ERR: Failed updating pruning cookie", buf, 2u);
    goto LABEL_55;
  }
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v9 = "Pruning cookie unavailable from asset - Bailing out";
    goto LABEL_10;
  }
LABEL_55:
  v27 = 0;
  v28 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
LABEL_56:
  _Block_object_dispose(&v117, 8);

  return v36;
}

- (id)_getLastPruningCookie
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  char v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:](VTSpeakerIdUtilities, "getProfileVersionFilePathForLanguageCode:", self->_languageCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v15))
    v5 = v15 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v6)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {

LABEL_14:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VoiceProfilePruningCookie"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("VoiceProfilePruningCookie"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  v10 = v8;
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v10;
    _os_log_error_impl(&dword_20D965000, v11, OS_LOG_TYPE_ERROR, "Could not read existing %@ file: err: %@", buf, 0x16u);
  }

  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)_updatePruningCookie:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  BOOL v9;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  id v23;
  int v24;
  id v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:](VTSpeakerIdUtilities, "getProfileVersionFilePathForLanguageCode:", self->_languageCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v33))
  {
    if (v33)
    {
      v7 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v6;
        v8 = "ERR: %{public}@ is a directory - Bailing out";
LABEL_24:
        _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
        goto LABEL_6;
      }
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v11, 0, &v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v32;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 0;
    if (!v14)
    {
      v15 = v13;
      v16 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v6;
        v36 = 2112;
        v37 = v15;
        _os_log_error_impl(&dword_20D965000, v16, OS_LOG_TYPE_ERROR, "ERR: Could not read existing %@ file: err: %@", buf, 0x16u);
      }

      goto LABEL_6;
    }

    v17 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v4, CFSTR("VoiceProfilePruningCookie"));
    v18 = (void *)MEMORY[0x24BDD1608];
    v19 = (void *)objc_msgSend(v17, "copy");
    v31 = 0;
    objc_msgSend(v18, "dataWithJSONObject:options:error:", v19, 1, &v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v31;

    if (!v20 || v21)
    {
      v26 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 138412546;
      v35 = v12;
      v36 = 2112;
      v37 = v21;
      v27 = "ERR: error updating updatedVoiceProfileJsonData from: %@, err: %@";
    }
    else
    {
      v30 = 0;
      v22 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v30);
      v23 = v30;
      v21 = v23;
      if ((v22 & 1) != 0)
      {
        v29 = v23;
        v24 = objc_msgSend(v20, "writeToFile:options:error:", v6, 0, &v29);
        v25 = v29;

        if (v24 && !v25)
        {
          v9 = 1;
LABEL_32:

          goto LABEL_7;
        }
        v28 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v6;
          v36 = 2112;
          v37 = v25;
          _os_log_error_impl(&dword_20D965000, v28, OS_LOG_TYPE_ERROR, "ERR: Error writing voice profile version file at: %@, err:%@", buf, 0x16u);
        }
        v21 = v25;
LABEL_31:

        v9 = 0;
        goto LABEL_32;
      }
      v26 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 138412546;
      v35 = v6;
      v36 = 2112;
      v37 = v21;
      v27 = "ERR: error removing voice profile version file at: %@, err: %@";
    }
    _os_log_error_impl(&dword_20D965000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
    goto LABEL_31;
  }
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v6;
    v8 = "ERR: %{public}@ doesn't exist - Bailing out";
    goto LABEL_24;
  }
LABEL_6:
  v9 = 0;
LABEL_7:

  return v9;
}

- (double)_computeSamplingMSEForUtts:(id)a3 withBeforeScores:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[VTVoiceProfileRetrainer _analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:](self, "_analyzeEnrollmentUtts:thresholdTrigger:thresholdSAT:thresholdTDSR:isUpdatingModel:extraUtts:discardUtts:psrTimeout:", v6, 0, 0, 0, 0, -INFINITY, -INFINITY, -INFINITY);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v38;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (v16)
        {
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;
          objc_msgSend(v8, "objectForKey:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v19 - v21;

          v23 = (void *)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            objc_msgSend(v7, "objectForKey:", v16);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = v26;
            objc_msgSend(v8, "objectForKey:", v16);
            v36 = v12;
            v28 = v11;
            v29 = v13;
            v30 = v8;
            v31 = v7;
            v32 = v9;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "doubleValue");
            *(_DWORD *)buf = 138544130;
            v42 = v16;
            v43 = 2050;
            v44 = v27;
            v45 = 2050;
            v46 = v34;
            v47 = 2050;
            v48 = v22;
            _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "Error for %{public}@: %{public}.3f - %{public}.3f = %{public}.3f", buf, 0x2Au);

            v9 = v32;
            v7 = v31;
            v8 = v30;
            v13 = v29;
            v11 = v28;
            v12 = v36;

          }
          v14 = v14 + v22 * v22;
          ++v12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v11);

    if (v12)
      v14 = v14 / (double)v12;
  }
  else
  {

    v14 = 0.0;
  }

  return v14;
}

- (unint64_t)_deleteUtterances:(id)a3
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  id obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v4 = 138543362;
    v26 = v4;
    v8 = 0x24BDD1000uLL;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "stringByDeletingPathExtension");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("json"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v35 = v10;
            _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "Deleting %{public}@", buf, 0xCu);
          }
          v14 = v8;
          objc_msgSend(*(id *)(v8 + 1408), "defaultManager", v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          objc_msgSend(v15, "removeItemAtPath:error:", v10, &v29);
          v16 = v29;

          if (v16)
          {
            v17 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              objc_msgSend(v16, "localizedDescription");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v35 = v10;
              v36 = 2114;
              v37 = v19;
              _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't delete training utterance at path %{public}@ %{public}@", buf, 0x16u);

            }
          }
          v8 = v14;
          objc_msgSend(*(id *)(v14 + 1408), "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          objc_msgSend(v20, "removeItemAtPath:error:", v12, &v28);
          v21 = v28;

          if (v21)
          {
            v22 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              v23 = v22;
              objc_msgSend(v21, "localizedDescription");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v35 = v12;
              v36 = 2114;
              v37 = v24;
              _os_log_impl(&dword_20D965000, v23, OS_LOG_TYPE_DEFAULT, "Couldn't delete training utterance at path %{public}@ %{public}@", buf, 0x16u);

            }
          }
          ++v6;

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_analyzeEnrollmentUtts:(id)a3 thresholdTrigger:(double)a4 thresholdSAT:(double)a5 thresholdTDSR:(double)a6 isUpdatingModel:(BOOL)a7 extraUtts:(id *)a8 discardUtts:(id *)a9 psrTimeout:(BOOL *)a10
{
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  double v21;
  NSObject *v22;
  void *v23;
  VTTextDependentSpeakerRecognizer *satRetrainingTdSr;
  OS_dispatch_semaphore *v25;
  OS_dispatch_semaphore *satRetrainingTdSrSemaphore;
  const _ndresult *v27;
  int j;
  const _ndresult *v29;
  OSStatus v30;
  void *mData;
  unint64_t v32;
  VTTextDependentSpeakerRecognizer *v33;
  OSStatus v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  uint64_t v39;
  dispatch_time_t v40;
  intptr_t v41;
  double v42;
  double v43;
  void *v44;
  VTTextDependentSpeakerRecognizer *v45;
  NSObject *v46;
  float v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  const _ndsupervec *v53;
  const _ndsvscore *v54;
  float *p_var0;
  float var0;
  VTTextDependentSpeakerRecognizer *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  double v62;
  double retrainTDSRScore;
  double v64;
  void *v65;
  VTTextDependentSpeakerRecognizer *v66;
  VTTextDependentSpeakerRecognizer *v67;
  NSObject *v68;
  _BOOL4 v69;
  double var4;
  double v71;
  double retrainThresholdTDSR;
  double v73;
  void *v74;
  NSObject *v75;
  double v76;
  double v77;
  int v78;
  VTTextDependentSpeakerRecognizer *v79;
  VTTextDependentSpeakerRecognizer *v80;
  NSObject *v81;
  void *v82;
  __int128 v84;
  _BOOL4 v85;
  id v88;
  id v89;
  id v91;
  intptr_t v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  UInt32 ioNumberFrames;
  AudioBufferList ioData;
  UInt32 ioPropertyDataSize;
  _OWORD outPropertyData[2];
  uint64_t v101;
  ExtAudioFileRef outExtAudioFile;
  AudioFileID inAudioFile;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t inPropertyData;
  __int128 v109;
  __int128 v110;
  uint8_t buf[4];
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  __int16 v119;
  double v120;
  __int16 v121;
  double v122;
  _BYTE v123[128];
  uint64_t v124;

  v85 = a7;
  v124 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  inPropertyData = 0x40CF400000000000;
  v109 = xmmword_20DA245E0;
  v110 = xmmword_20DA245F0;
  v89 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v88 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v91 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
  if (v15)
  {
    v17 = v15;
    v18 = 0x24BDBC000;
    v19 = *(_QWORD *)v105;
    *(_QWORD *)&v16 = 134349824;
    v84 = v16;
    v95 = v14;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v105 != v19)
          objc_enumerationMutation(v14);
        v21 = *(double *)(*((_QWORD *)&v104 + 1) + 8 * i);
        if (v21 != 0.0)
        {
          outExtAudioFile = 0;
          inAudioFile = 0;
          if (AudioFileOpenURL((CFURLRef)objc_msgSend(*(id *)(v18 + 3912), "URLWithString:", *(_QWORD *)&v21), kAudioFileReadPermission, 0, &inAudioFile))
          {
            goto LABEL_14;
          }
          if (ExtAudioFileWrapAudioFileID(inAudioFile, 0, &outExtAudioFile))
          {
            AudioFileClose(inAudioFile);
LABEL_14:
            inAudioFile = 0;
LABEL_15:
            v22 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v112 = v21;
              _os_log_impl(&dword_20D965000, v22, OS_LOG_TYPE_DEFAULT, "Audio file at %{public}@ cannot be open, skipping...", buf, 0xCu);
            }
            continue;
          }
          if (!inAudioFile)
            goto LABEL_15;
          v101 = 0;
          memset(outPropertyData, 0, sizeof(outPropertyData));
          ioPropertyDataSize = 40;
          ExtAudioFileGetProperty(outExtAudioFile, 0x66666D74u, &ioPropertyDataSize, outPropertyData);
          ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, &inPropertyData);
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2048);
          v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = (void *)objc_msgSend(v96, "mutableBytes");
          *(_QWORD *)&ioData.mNumberBuffers = 1;
          *(_QWORD *)&ioData.mBuffers[0].mNumberChannels = 0x80000000001;
          ioData.mBuffers[0].mData = v23;
          satRetrainingTdSr = self->_satRetrainingTdSr;
          if (satRetrainingTdSr)
          {
            -[VTTextDependentSpeakerRecognizer resetForNewRequest](satRetrainingTdSr, "resetForNewRequest");
            v25 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
            satRetrainingTdSrSemaphore = self->_satRetrainingTdSrSemaphore;
            self->_satRetrainingTdSrSemaphore = v25;

          }
          v27 = 0;
          for (j = 0; ; j += ioData.mBuffers[0].mDataByteSize)
          {
            ioNumberFrames = 1024;
            v30 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
            if (v30)
              break;
            if (!ioNumberFrames)
            {
              -[VTTextDependentSpeakerRecognizer endAudio](self->_satRetrainingTdSr, "endAudio");
              if (self->_satRetrainingTdSr)
              {
                objc_msgSend(MEMORY[0x24BDBCE60], "date");
                v39 = objc_claimAutoreleasedReturnValue();
                v40 = dispatch_time(0, 1000000000);
                *(double *)&v41 = COERCE_DOUBLE(dispatch_semaphore_wait((dispatch_semaphore_t)self->_satRetrainingTdSrSemaphore, v40));
                objc_msgSend(MEMORY[0x24BDBCE60], "date");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = (void *)v39;
                objc_msgSend(v93, "timeIntervalSinceDate:", v39);
                v43 = v42 * 1000.0;
                v44 = (void *)VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = self->_satRetrainingTdSr;
                  v46 = v44;
                  -[VTTextDependentSpeakerRecognizer lastRequestSatScore](v45, "lastRequestSatScore");
                  *(_DWORD *)buf = 134349568;
                  v112 = *(double *)&v41;
                  v113 = 2050;
                  v114 = v43;
                  v115 = 2050;
                  v116 = v47;
                  _os_log_impl(&dword_20D965000, v46, OS_LOG_TYPE_DEFAULT, "TDSR:: Retraining: Done Waiting with timedOut=%{public}ld, tdPsrSATRetrainingWaitTimeMs: %{public}fms, _lastTdSpeakerRecognizerSATScore=%{public}f", buf, 0x20u);

                }
                +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator", v84);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = v48;
                v92 = v41;
                if (*(double *)&v41 == 0.0)
                {
                  objc_msgSend(v48, "logTdPsrSATRetrainingWaitTimeMs:", v43);

                }
                else
                {
                  objc_msgSend(v48, "logTdPsrSATRetrainingTimedOut");

                  if (a10)
                    *a10 = 1;
                }

                if (v27)
                {
LABEL_41:
                  v53 = -[VTAnalyzerNDAPI getSuperVectorWithEndPoint:](self->_analyzer, "getSuperVectorWithEndPoint:", v27->var2, v84);
                  if (v53 && v53->var0 && v53->var1)
                  {
                    v54 = -[VTAnalyzerNDAPI analyzeSAT:size:](self->_analyzer, "analyzeSAT:size:");
                    if (v54)
                    {
                      p_var0 = &v54->var0;
                      var0 = v54->var0;
                      v57 = self->_satRetrainingTdSr;
                      if (v57)
                        -[VTTextDependentSpeakerRecognizer getCombinationWeight](v57, "getCombinationWeight");
                      else
                        v58 = 0.0;
                      v62 = var0;
                      retrainTDSRScore = self->_retrainTDSRScore;
                      v64 = v58 * retrainTDSRScore + (1.0 - v58) * var0;
                      if (v27->var4 < a4)
                      {
LABEL_60:
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v64);
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v91, "setObject:forKey:", v65, *(_QWORD *)&v21);

                        if (v92)
                        {
                          -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satRetrainingTdSr, "deleteExistingSATModel");
                          v66 = self->_satRetrainingTdSr;
                          self->_satRetrainingTdSr = 0;

                        }
                        v67 = self->_satRetrainingTdSr;
                        v68 = VTLogContextFacilityVoiceTrigger;
                        v69 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR);
                        if (v67)
                        {
                          if (v69)
                          {
                            var4 = v27->var4;
                            retrainThresholdTDSR = self->_retrainThresholdTDSR;
                            v71 = self->_retrainTDSRScore;
                            *(_DWORD *)buf = 134350336;
                            v112 = var4;
                            v113 = 2050;
                            v114 = a4;
                            v115 = 2050;
                            v116 = v71;
                            v117 = 2050;
                            v118 = retrainThresholdTDSR;
                            v119 = 2050;
                            v120 = v64;
                            v121 = 2050;
                            v122 = a5;
                            _os_log_error_impl(&dword_20D965000, v68, OS_LOG_TYPE_ERROR, "ERR: Utterance failed in retraining - triggerCondition:%{public}.3f(%{public}.3f) tdsr:%{public}.3f(%{public}.3f) combined:%{public}.3f(%{public}.3f)", buf, 0x3Eu);
                          }
                        }
                        else if (v69)
                        {
                          v73 = v27->var4;
                          *(_DWORD *)buf = v84;
                          v112 = v73;
                          v113 = 2050;
                          v114 = a4;
                          v115 = 2050;
                          v116 = v62;
                          v117 = 2050;
                          v118 = a5;
                          _os_log_error_impl(&dword_20D965000, v68, OS_LOG_TYPE_ERROR, "ERR: Utterance failed in retraining - triggerCondition:%{public}.3f(%{public}.3f) sat:%{public}.3f(%{public}.3f)", buf, 0x2Au);
                        }
                      }
                      else
                      {
                        if (self->_satRetrainingTdSr)
                        {
                          if (v92 || retrainTDSRScore < self->_retrainThresholdTDSR && v64 < a5)
                            goto LABEL_60;
                        }
                        else if (*p_var0 < a5)
                        {
                          goto LABEL_60;
                        }
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v64);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v89, "setObject:forKey:", v74, *(_QWORD *)&v21);

                        v75 = VTLogContextFacilityVoiceTrigger;
                        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                        {
                          v76 = *p_var0;
                          v77 = self->_retrainTDSRScore;
                          *(_DWORD *)buf = 138543874;
                          v112 = v21;
                          v113 = 2050;
                          v114 = v76;
                          v115 = 2050;
                          v116 = v77;
                          _os_log_impl(&dword_20D965000, v75, OS_LOG_TYPE_DEFAULT, "Analyze of %{public}@ is successful with SAT score of %{public}.3f, uttSATScore=%{public}.3f", buf, 0x20u);
                        }
                        if (v85)
                        {
                          v78 = -[VTAnalyzerNDAPI getSATVectorCount](self->_analyzer, "getSATVectorCount");
                          -[VTAnalyzerNDAPI updateSAT](self->_analyzer, "updateSAT");
                          v79 = self->_satRetrainingTdSr;
                          if (v92)
                          {
                            -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](v79, "deleteExistingSATModel");
                            v80 = self->_satRetrainingTdSr;
                            self->_satRetrainingTdSr = 0;

                          }
                          else
                          {
                            -[VTTextDependentSpeakerRecognizer updateSAT](v79, "updateSAT");
                          }
                          if (-[VTAnalyzerNDAPI getSATVectorCount](self->_analyzer, "getSATVectorCount") - v78 != 1)
                          {
                            v81 = VTLogContextFacilityVoiceTrigger;
                            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_error_impl(&dword_20D965000, v81, OS_LOG_TYPE_ERROR, "ERR: Reached maximum number of training utterances, skipping updating model", buf, 2u);
                            }
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v64);
                            v82 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v88, "setObject:forKey:", v82, *(_QWORD *)&v21);

                            objc_msgSend(v89, "removeObjectForKey:", *(_QWORD *)&v21);
                          }
                        }
                      }
                    }
                    else
                    {
                      objc_msgSend(v91, "setObject:forKey:", &unk_24C803160, *(_QWORD *)&v21);
                      v61 = VTLogContextFacilityVoiceTrigger;
                      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        v112 = v21;
                        _os_log_error_impl(&dword_20D965000, v61, OS_LOG_TYPE_ERROR, "ERR: Analyze of %{public}@ failed with SAT score as nil!!!", buf, 0xCu);
                      }
                    }
LABEL_50:
                    -[VTAnalyzerNDAPI reset](self->_analyzer, "reset");
                    v60 = VTLogContextFacilityVoiceTrigger;
                    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      v112 = v21;
                      v113 = 1026;
                      LODWORD(v114) = j;
                      v36 = v60;
                      v37 = "Processed file %{public}@... analyzed %{public}d bytes";
                      v38 = 18;
                      goto LABEL_5;
                    }
                    goto LABEL_6;
                  }
                  objc_msgSend(v91, "setObject:forKey:", &unk_24C803160, *(_QWORD *)&v21);
                  v59 = VTLogContextFacilityVoiceTrigger;
                  if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_50;
                  *(_WORD *)buf = 0;
                  v51 = v59;
                  v52 = "Failed to get supervector during retraining, skipping...";
LABEL_49:
                  _os_log_impl(&dword_20D965000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
                  goto LABEL_50;
                }
              }
              else
              {
                v92 = 0;
                if (v27)
                  goto LABEL_41;
              }
              objc_msgSend(v91, "setObject:forKey:", &unk_24C803160, *(_QWORD *)&v21, v84);
              v50 = VTLogContextFacilityVoiceTrigger;
              if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                goto LABEL_50;
              *(_WORD *)buf = 0;
              v51 = v50;
              v52 = "Utterance does not seem to contain trigger phrase - no triggerData";
              goto LABEL_49;
            }
            mData = ioData.mBuffers[0].mData;
            v32 = (unint64_t)ioData.mBuffers[0].mDataByteSize >> 1;
            -[VTAnalyzerNDAPI analyzeWavData:length:](self->_analyzer, "analyzeWavData:length:", ioData.mBuffers[0].mData, v32);
            v33 = self->_satRetrainingTdSr;
            if (v33)
              -[VTTextDependentSpeakerRecognizer processAudio:numSamples:](v33, "processAudio:numSamples:", mData, v32);
            v29 = -[VTAnalyzerNDAPI getAnalyzedResult:](self->_analyzer, "getAnalyzedResult:", 0, v84);
            if (v29)
              v27 = v29;
          }
          v34 = v30;
          v35 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            LODWORD(v112) = v34;
            v36 = v35;
            v37 = "Error reading audio file: %{public}d, skipping...";
            v38 = 8;
LABEL_5:
            _os_log_impl(&dword_20D965000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);
          }
LABEL_6:
          AudioFileClose(inAudioFile);

          v14 = v95;
          v18 = 0x24BDBC000uLL;
        }
      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v104, v123, 16);
    }
    while (v17);
  }

  if (a8)
    *a8 = objc_retainAutorelease(v88);
  if (a9)
    *a9 = objc_retainAutorelease(v91);

  return v89;
}

- (void)textDependentSpeakerRecognizer:(id)a3 hasSatScore:(float)a4
{
  VTTextDependentSpeakerRecognizer *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  VTTextDependentSpeakerRecognizer *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2050;
    v12 = a4;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "textDependentSpeakerRecognizer:hasSatScore: %{public}@: %{public}f, signalling now", (uint8_t *)&v9, 0x16u);
  }
  if (self->_satRetrainingTdSr == v6)
  {
    self->_retrainTDSRScore = a4;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_satRetrainingTdSrSemaphore);
  }
  else
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "ERR: textDependentSpeakerRecognizer called for unmanaged TD-SR instance: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)textDependentSpeakerRecognizer:(id)a3 failedWithError:(id)a4
{
  VTTextDependentSpeakerRecognizer *v6;
  id v7;
  NSObject *v8;
  VTTextDependentSpeakerRecognizer *satRetrainingTdSr;
  NSObject *v10;
  VTTextDependentSpeakerRecognizer *v11;
  NSObject *v12;
  void *v13;
  int v14;
  VTTextDependentSpeakerRecognizer *v15;
  __int16 v16;
  VTTextDependentSpeakerRecognizer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  v7 = a4;
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    satRetrainingTdSr = self->_satRetrainingTdSr;
    v14 = 138543874;
    v15 = v6;
    v16 = 2114;
    v17 = satRetrainingTdSr;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "tdSR: %{public}@, _tdSrForSatRetraining:%{public}@, ERROR: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  if (self->_satRetrainingTdSr == v6)
  {
    -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](v6, "deleteExistingSATModel");
    v11 = self->_satRetrainingTdSr;
    self->_satRetrainingTdSr = 0;

    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "VTTextDependentSpeakerRecognizer failed with Error during RETRAINING", (uint8_t *)&v14, 2u);
    }
    +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logTdPsrFailedDuringSATRetraining");

  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "ERR: VTTextDependentSpeakerRecognizer failed for unmanaged TD-SR instance!!!", (uint8_t *)&v14, 2u);
    }
  }

}

- (VTAnalyzerNDAPI)analyzer
{
  return self->_analyzer;
}

- (void)setAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_analyzer, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (unint64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(unint64_t)a3
{
  self->_modelType = a3;
}

- (NSString)configPath
{
  return self->_configPath;
}

- (void)setConfigPath:(id)a3
{
  objc_storeStrong((id *)&self->_configPath, a3);
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePath, a3);
}

- (VTTextDependentSpeakerRecognizer)satRetrainingTdSr
{
  return self->_satRetrainingTdSr;
}

- (void)setSatRetrainingTdSr:(id)a3
{
  objc_storeStrong((id *)&self->_satRetrainingTdSr, a3);
}

- (OS_dispatch_semaphore)satRetrainingTdSrSemaphore
{
  return self->_satRetrainingTdSrSemaphore;
}

- (void)setSatRetrainingTdSrSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_satRetrainingTdSrSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satRetrainingTdSrSemaphore, 0);
  objc_storeStrong((id *)&self->_satRetrainingTdSr, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  float v11;
  float v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = v6;
    v9 = a3;
    objc_msgSend(a2, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v12 = v11;

    v13[0] = 67240706;
    v13[1] = v7;
    v14 = 2114;
    v15 = v10;
    v16 = 2050;
    v17 = v12;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Created Model with explicit utterance(%{public}d): %{public}@ --> %{public}.3f", (uint8_t *)v13, 0x1Cu);

  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), CFSTR("profileUpdateExplicitUttScore"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = v8;
    objc_msgSend(v5, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    *(_DWORD *)buf = 67240706;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    v20 = 2050;
    v21 = v12;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Explicit utterance(%{public}d): %{public}@ --> %{public}.3f", buf, 0x1Cu);

  }
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v13, "logProfileUpdateUtt:withScore:", v7, v15);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  float v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), CFSTR("profileUpdateFailedExplicitUttScore"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v8, "logProfileUpdateUtt:withScore:", v7, v10);

  v11 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v13 = v11;
    objc_msgSend(v5, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    *(_DWORD *)buf = 67240706;
    v17 = v12;
    v18 = 2114;
    v19 = v14;
    v20 = 2050;
    v21 = v15;
    _os_log_error_impl(&dword_20D965000, v13, OS_LOG_TYPE_ERROR, "Low Score Explicit utterance(%{public}d): %{public}@ --> %{public}.3f", buf, 0x1Cu);

  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), CFSTR("profileUpdateImplicitUttScore"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = v8;
    objc_msgSend(v5, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    *(_DWORD *)buf = 67240706;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    v20 = 2050;
    v21 = v12;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Implicit utterance(%{public}d): %{public}@ --> %{public}.3f", buf, 0x1Cu);

  }
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v13, "logProfileUpdateUtt:withScore:", v7, v15);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = a3;
    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v11 = v10;

    *(_DWORD *)buf = 138543618;
    v17 = v9;
    v18 = 2050;
    v19 = v11;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Discarding low score implicit utterance %{public}@ --> %{public}.3f", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%d"), CFSTR("profileUpdateFailedExplicitUttScore"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  objc_msgSend(v13, "logProfileUpdateUtt:withScore:", v12, v15);

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  float v9;
  float v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = a3;
    objc_msgSend(a2, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v10 = v9;

    v11 = 138543618;
    v12 = v8;
    v13 = 2050;
    v14 = v10;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Discarding extra implicit utterance %{public}@ with score %{public}.3f", (uint8_t *)&v11, 0x16u);

  }
}

void __55__VTVoiceProfileRetrainer_pruneVoiceProfileIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v2, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUtteranceMetadataManager recordedTimeStampOfFile:](VTUtteranceMetadataManager, "recordedTimeStampOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ recorded on %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

@end
