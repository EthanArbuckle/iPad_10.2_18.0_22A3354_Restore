@implementation SSRSpeakerRecognitionContext

- (SSRSpeakerRecognitionContext)initWithVoiceRecognitionContext:(id)a3 error:(id *)a4
{
  id v6;
  SSRSpeakerRecognitionContext *v7;
  SSRLoggingAggregator *v8;
  NSString *locale;
  void *v10;
  uint64_t v11;
  SSRLoggingAggregator *logAggregator;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  NSUUID *endpointUUID;
  void *v19;
  NSUUID *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  SSRLoggingAggregator *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSString *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  NSDictionary *vtEventInfo;
  void *v49;
  uint64_t v50;
  void *voiceProfileArray;
  uint64_t v52;
  NSArray *v53;
  void *v54;
  void *v55;
  float v56;
  float v57;
  float v58;
  float v59;
  void *v60;
  uint64_t v61;
  void *v62;
  CSAsset *v63;
  uint64_t v64;
  NSString *configVersion;
  float v66;
  uint64_t v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  char v72;
  CSAsset *v73;
  void *v74;
  uint64_t v75;
  CSAsset *asset;
  uint64_t v77;
  CSAsset *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  float v82;
  float v83;
  _BOOL4 v84;
  _BOOL4 v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  NSURL *vadResourcePath;
  void *v96;
  void *v97;
  uint64_t v98;
  NSURL *resourceFilePath;
  NSArray *v100;
  unint64_t spIdType;
  CSAsset *v102;
  SSRSpeakerRecognitionContext *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSString *sessionId;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  NSString *debugUtteranceAudioFile;
  void *v116;
  uint64_t v117;
  NSString *debugUtteranceMetaFile;
  void *v119;
  void *v120;
  SSRSpeakerRecognitionContext *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(uint64_t, void *, void *);
  void *v133;
  SSRSpeakerRecognitionContext *v134;
  objc_super v135;
  const __CFString *v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  const __CFString *v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  uint8_t buf[4];
  const char *v147;
  __int16 v148;
  void *v149;
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v135.receiver = self;
  v135.super_class = (Class)SSRSpeakerRecognitionContext;
  v7 = -[SSRSpeakerRecognitionContext init](&v135, sel_init);
  if (v7)
  {
    v8 = [SSRLoggingAggregator alloc];
    locale = v7->_locale;
    -[CSAsset configVersion](v7->_asset, "configVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SSRLoggingAggregator initWithEvent:locale:configVersion:](v8, "initWithEvent:locale:configVersion:", CFSTR("recognition"), locale, v10);
    logAggregator = v7->_logAggregator;
    v7->_logAggregator = (SSRLoggingAggregator *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionEndpointId"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionEndpointId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionEndpointId"));
        v17 = objc_claimAutoreleasedReturnValue();
        endpointUUID = v7->_endpointUUID;
        v7->_endpointUUID = (NSUUID *)v17;

        v19 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_INFO))
        {
          v20 = v7->_endpointUUID;
          v21 = v19;
          -[NSUUID UUIDString](v20, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
          v148 = 2114;
          v149 = v22;
          _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_INFO, "%s endpointUUID: %{public}@", buf, 0x16u);

        }
      }
    }
    objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isSpeakerRecognitionAvailable");

    if ((v24 & 1) != 0)
    {
      v7->_recognitionStyle = 0;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionStyle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionStyle"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v7->_recognitionStyle = (int)objc_msgSend(v26, "intValue");

        if (v7->_recognitionStyle >= 3)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Invalid Speaker Recognition style - Bailing out"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
            v148 = 2114;
            v149 = v27;
            _os_log_error_impl(&dword_2117D4000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            if (!a4)
              goto LABEL_12;
          }
          else if (!a4)
          {
LABEL_12:
            v31 = v7->_logAggregator;
            v32 = 109;
LABEL_79:
            -[SSRLoggingAggregator setSpeakerRecognitionProcessingStatus:](v31, "setSpeakerRecognitionProcessingStatus:", v32);

            goto LABEL_80;
          }
          v29 = (void *)MEMORY[0x24BDD1540];
          v142 = CFSTR("reason");
          v143 = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 109, v30);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionLocale"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        v38 = v36;
        v39 = v7->_locale;
        v7->_locale = v38;
      }
      else
      {
        v40 = (void *)MEMORY[0x24BE28488];
        -[NSUUID UUIDString](v7->_endpointUUID, "UUIDString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "getSiriLanguageWithEndpointId:fallbackLanguage:", v39, 0);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v7->_locale;
        v7->_locale = (NSString *)v41;

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionVTEventInfo"));
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43
        && (v44 = (void *)v43,
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionVTEventInfo")),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v46 = objc_opt_isKindOfClass(),
            v45,
            v44,
            (v46 & 1) != 0))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionVTEventInfo"));
        v47 = objc_claimAutoreleasedReturnValue();
        vtEventInfo = v7->_vtEventInfo;
        v7->_vtEventInfo = (NSDictionary *)v47;
      }
      else
      {
        vtEventInfo = v7->_vtEventInfo;
        v7->_vtEventInfo = 0;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionProfileArray"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionProfileArray"));
        v50 = objc_claimAutoreleasedReturnValue();
        voiceProfileArray = v7->_voiceProfileArray;
        v7->_voiceProfileArray = (NSArray *)v50;
      }
      else
      {
        +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
        voiceProfileArray = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(voiceProfileArray, "userVoiceProfilesForAppDomain:forLocale:", CFSTR("com.apple.siri"), v7->_locale);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v7->_voiceProfileArray;
        v7->_voiceProfileArray = (NSArray *)v52;

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionMaxAudioSecs"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionMaxAudioSecs"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "floatValue");
        v57 = v56;
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
        v7->_maxAllowedAudioSamples = (unint64_t)(float)(v57 * v58);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
        v7->_maxAllowedAudioSamples = (unint64_t)(v59 * 1000.0);
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionAsset"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionAsset"));
        v61 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionAssetArray"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (v74)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionAssetArray"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:withAssetArray:](v7, "pickAssetForProfiles:forSpIdType:withAssetArray:", v7->_voiceProfileArray, v7->_spIdType, v62);
          v75 = objc_claimAutoreleasedReturnValue();
          asset = v7->_asset;
          v7->_asset = (CSAsset *)v75;

          if (!v7->_asset)
          {
            -[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:](v7, "pickAssetForProfiles:forSpIdType:", v7->_voiceProfileArray, v7->_spIdType);
            v77 = objc_claimAutoreleasedReturnValue();
            v78 = v7->_asset;
            v7->_asset = (CSAsset *)v77;

          }
LABEL_33:

          v63 = v7->_asset;
          if (v63)
          {
            -[CSAsset configVersion](v63, "configVersion");
            v64 = objc_claimAutoreleasedReturnValue();
            configVersion = v7->_configVersion;
            v7->_configVersion = (NSString *)v64;

            -[CSAsset psrCombinationWeight](v7->_asset, "psrCombinationWeight");
            v7->_combinationWeight = v66;
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionUsePayloadProfile"));
            v67 = objc_claimAutoreleasedReturnValue();
            if (v67
              && (v68 = (void *)v67,
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionUsePayloadProfile")),
                  v69 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_opt_class(),
                  v70 = objc_opt_isKindOfClass(),
                  v69,
                  v68,
                  (v70 & 1) != 0))
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionUsePayloadProfile"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "BOOLValue");

              if ((v72 & 1) == 0)
                goto LABEL_58;
            }
            else
            {
              v73 = v7->_asset;
              if (CSIsCommunalDevice())
              {

              }
              else
              {
                if ((CSIsIOS() & 1) == 0 && (CSIsAppleSiliconMac() & 1) == 0)
                {

LABEL_58:
                  v86 = 1;
LABEL_59:
                  v7->_spIdType = v86;
                  if (v7->_recognitionStyle != 2)
                    goto LABEL_66;
                  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionVADAssetPath"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v87)
                  {
                    v88 = (void *)MEMORY[0x24BE28388];
                    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionVADAssetPath"));
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v88, "assetForAssetType:resourcePath:configVersion:", 1, v89, CFSTR("SSR"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v90, "path");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "allInstalledAssetsOfType:forLanguage:", 1, v7->_locale);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!objc_msgSend(v90, "count"))
                    {

                      goto LABEL_75;
                    }
                    objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "path");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  if (v91)
                  {
                    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v91);
                    v94 = objc_claimAutoreleasedReturnValue();
                    vadResourcePath = v7->_vadResourcePath;
                    v7->_vadResourcePath = (NSURL *)v94;

LABEL_66:
                    v96 = (void *)MEMORY[0x24BDBCF48];
                    -[CSAsset resourcePath](v7->_asset, "resourcePath");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "URLWithString:", v97);
                    v98 = objc_claimAutoreleasedReturnValue();
                    resourceFilePath = v7->_resourceFilePath;
                    v7->_resourceFilePath = (NSURL *)v98;

                    v100 = v7->_voiceProfileArray;
                    spIdType = v7->_spIdType;
                    v102 = v7->_asset;
                    v130 = MEMORY[0x24BDAC760];
                    v131 = 3221225472;
                    v132 = __70__SSRSpeakerRecognitionContext_initWithVoiceRecognitionContext_error___block_invoke;
                    v133 = &unk_24CC86618;
                    v103 = v7;
                    v134 = v103;
                    -[SSRSpeakerRecognitionContext composeModelContextsForProfiles:forSpIdType:forAsset:completion:](v103, "composeModelContextsForProfiles:forSpIdType:forAsset:completion:", v100, spIdType, v102, &v130);
                    if (v103->_modelsContext)
                    {

                      objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                      v103->_scoreType = objc_msgSend(v104, "speakerIdScoreReportingType");

                      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v105, "UUIDString");
                      v106 = objc_claimAutoreleasedReturnValue();
                      sessionId = v103->_sessionId;
                      v103->_sessionId = (NSString *)v106;

                      +[SSRUtils ssrAudioLogsDir](SSRUtils, "ssrAudioLogsDir");
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      v109 = (void *)MEMORY[0x24BDD17C8];
                      +[SSRUtils stringForInvocationStyle:](SSRUtils, "stringForInvocationStyle:", v7->_recognitionStyle);
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v7->_spIdType);
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v109, "stringWithFormat:", CFSTR("%@_%@_%@"), v110, v111, v103->_sessionId, v130, v131, v132, v133);
                      v112 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v112, "stringByAppendingPathExtension:", CFSTR("wav"));
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v108, "stringByAppendingPathComponent:", v113);
                      v114 = objc_claimAutoreleasedReturnValue();
                      debugUtteranceAudioFile = v103->_debugUtteranceAudioFile;
                      v103->_debugUtteranceAudioFile = (NSString *)v114;

                      objc_msgSend(v112, "stringByAppendingPathExtension:", CFSTR("json"));
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v108, "stringByAppendingPathComponent:", v116);
                      v117 = objc_claimAutoreleasedReturnValue();
                      debugUtteranceMetaFile = v103->_debugUtteranceMetaFile;
                      v103->_debugUtteranceMetaFile = (NSString *)v117;

                      v103->_osTransactionReqd = 1;
                      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionOSTransactionReqd"));
                      v119 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v119)
                      {
                        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SSRSpeakerRecognitionOSTransactionReqd"));
                        v120 = (void *)objc_claimAutoreleasedReturnValue();
                        v103->_osTransactionReqd = objc_msgSend(v120, "BOOLValue");

                      }
                      goto LABEL_69;
                    }
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: ModelsContext is nil for locale %@ - Bailing out"), v7->_locale);
                    v122 = (void *)objc_claimAutoreleasedReturnValue();
                    v123 = *MEMORY[0x24BE284B8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
                      v148 = 2114;
                      v149 = v122;
                      _os_log_error_impl(&dword_2117D4000, v123, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                      if (!a4)
                        goto LABEL_73;
                    }
                    else if (!a4)
                    {
LABEL_73:
                      -[SSRLoggingAggregator setSpeakerRecognitionProcessingStatus:](v7->_logAggregator, "setSpeakerRecognitionProcessingStatus:", 713);

LABEL_80:
                      v121 = 0;
                      goto LABEL_81;
                    }
                    v124 = (void *)MEMORY[0x24BDD1540];
                    v136 = CFSTR("reason");
                    v137 = v122;
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v124, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 713, v125);
                    *a4 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_73;
                  }
LABEL_75:
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Endpointer Asset not picked - Bailing out"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v126 = *MEMORY[0x24BE284B8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
                    v148 = 2114;
                    v149 = v27;
                    _os_log_error_impl(&dword_2117D4000, v126, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                    if (!a4)
                      goto LABEL_78;
                  }
                  else if (!a4)
                  {
LABEL_78:
                    v31 = v7->_logAggregator;
                    v32 = 108;
                    goto LABEL_79;
                  }
                  v127 = (void *)MEMORY[0x24BDD1540];
                  v138 = CFSTR("reason");
                  v139 = v27;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v127, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 107, v128);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                  goto LABEL_78;
                }
                -[CSAsset psrCombinationWeight](v73, "psrCombinationWeight");
                v83 = v82;
                v84 = -[CSAsset useTDTIEnrollment](v73, "useTDTIEnrollment");
                v85 = v83 == 1.0 && v84;

                if (!v85)
                  goto LABEL_58;
              }
            }
            v86 = 3;
            goto LABEL_59;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Asset not picked - Bailing out"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
            v148 = 2114;
            v149 = v27;
            _os_log_error_impl(&dword_2117D4000, v79, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            if (!a4)
              goto LABEL_46;
          }
          else if (!a4)
          {
LABEL_46:
            v31 = v7->_logAggregator;
            v32 = 107;
            goto LABEL_79;
          }
          v80 = (void *)MEMORY[0x24BDD1540];
          v140 = CFSTR("reason");
          v141 = v27;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 107, v81);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_46;
        }
        -[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:](v7, "pickAssetForProfiles:forSpIdType:", v7->_voiceProfileArray, v7->_spIdType);
        v61 = objc_claimAutoreleasedReturnValue();
      }
      v62 = v7->_asset;
      v7->_asset = (CSAsset *)v61;
      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: SpeakerRecognition not enabled - Bailing out"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v147 = "-[SSRSpeakerRecognitionContext initWithVoiceRecognitionContext:error:]";
      v148 = 2114;
      v149 = v27;
      _os_log_error_impl(&dword_2117D4000, v33, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      if (!a4)
        goto LABEL_16;
    }
    else if (!a4)
    {
LABEL_16:
      v31 = v7->_logAggregator;
      v32 = 752;
      goto LABEL_79;
    }
    v34 = (void *)MEMORY[0x24BDD1540];
    v144 = CFSTR("reason");
    v145 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 752, v35);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
LABEL_69:
  v121 = v7;
LABEL_81:

  return v121;
}

- (id)description
{
  void *v3;
  NSString *sessionId;
  unint64_t recognitionStyle;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  sessionId = self->_sessionId;
  recognitionStyle = self->_recognitionStyle;
  +[SSRUtils stringForInvocationStyle:](SSRUtils, "stringForInvocationStyle:", recognitionStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[SessionId: %@, RecognitionStyle:(%lu)%@, Asset: %@, vtEventInfo: %@]"), sessionId, recognitionStyle, v6, self->_asset, self->_vtEventInfo);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)composeModelContextsForProfiles:(id)a3 forSpIdType:(unint64_t)a4 forAsset:(id)a5 completion:(id)a6
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  SSRSpeakerRecognitionModelContext *v37;
  id v38;
  id v39;
  SSRSpeakerRecognitionModelContext *v40;
  void *v41;
  SSRSpeakerRecognitionModelContext *v42;
  id v43;
  id v44;
  SSRSpeakerRecognitionModelContext *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  unint64_t spIdType;
  NSObject *v51;
  void *v52;
  void *v53;
  NSString *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSString *locale;
  id v60;
  id v61;
  void (**v62)(id, id, id);
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  char v69;
  id obj;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t v81[128];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  NSString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  v62 = (void (**)(id, id, id))a6;
  v64 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v63 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 1;
  while ((v9 & 1) == 0 || self->_spIdType != 3)
  {
    v69 = v9;
    +[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:](SSRUtils, "satConfigFileNameForCSSpIdType:forModelType:forAssetType:", a4, v10, -[CSAsset assetProvider](self->_asset, "assetProvider"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCF48];
    -[CSAsset resourcePath](self->_asset, "resourcePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)v11;
    objc_msgSend(v13, "stringByAppendingPathComponent:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v14);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v72 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v74 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v71 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v66;
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    if (v76)
    {
      v73 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v76; ++i)
        {
          if (*(_QWORD *)v78 != v73)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v16, "voiceProfileModelFilePathForRecognizerType:spIdType:", v10, a4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSAsset hashFromResourcePath](self->_asset, "hashFromResourcePath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByAppendingPathComponent:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "profileID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setValue:forKey:", v19, v20);

          objc_msgSend(v16, "exclaveVoiceProfileModelFilePathForRecognizerType:spIdType:", v10, a4);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            -[CSAsset hashFromResourcePath](self->_asset, "hashFromResourcePath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "URLByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "profileID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setValue:forKey:", v24, v25);

          }
          objc_msgSend(v16, "voiceProfileModelFilePathForRecognizerType:spIdType:", v10, +[SSRUtils explicitSpIdTypeForSpId:](SSRUtils, "explicitSpIdTypeForSpId:", a4));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSAsset hashFromResourcePath](self->_asset, "hashFromResourcePath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "URLByAppendingPathComponent:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "profileID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setValue:forKey:", v28, v29);

          objc_msgSend(v16, "exclaveVoiceProfileModelFilePathForRecognizerType:spIdType:", v10, +[SSRUtils explicitSpIdTypeForSpId:](SSRUtils, "explicitSpIdTypeForSpId:", a4));
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = (void *)v30;
            -[CSAsset hashFromResourcePath](self->_asset, "hashFromResourcePath");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "URLByAppendingPathComponent:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "profileID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setValue:forKey:", v33, v34);

          }
        }
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
      }
      while (v76);
    }

    objc_msgSend(v67, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v65, "fileExistsAtPath:", v35);

    if ((v36 & 1) != 0)
    {
      v37 = [SSRSpeakerRecognitionModelContext alloc];
      v38 = v75;
      if (!objc_msgSend(v75, "count"))
        v38 = 0;
      if (objc_msgSend(v72, "count"))
        v39 = v72;
      else
        v39 = 0;
      v40 = -[SSRSpeakerRecognitionModelContext initWithConfigFilePath:withModelFilePaths:withModelFilePathsExclave:](v37, "initWithConfigFilePath:withModelFilePaths:withModelFilePathsExclave:", v67, v38, v39);
      +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v10);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setValue:forKey:", v40, v41);

      v42 = [SSRSpeakerRecognitionModelContext alloc];
      v43 = v74;
      if (!objc_msgSend(v74, "count"))
        v43 = 0;
      if (objc_msgSend(v71, "count"))
        v44 = v71;
      else
        v44 = 0;
      v45 = -[SSRSpeakerRecognitionModelContext initWithConfigFilePath:withModelFilePaths:withModelFilePathsExclave:](v42, "initWithConfigFilePath:withModelFilePaths:withModelFilePathsExclave:", v67, v43, v44);
      +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v10);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setValue:forKey:", v45, v46);

      v47 = v69;
      v48 = v68;
    }
    else
    {
      v49 = (void *)*MEMORY[0x24BE284B8];
      v47 = v69;
      v48 = v68;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        spIdType = self->_spIdType;
        v51 = v49;
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", spIdType);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v10);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "path");
        v54 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v83 = "-[SSRSpeakerRecognitionContext composeModelContextsForProfiles:forSpIdType:forAsset:completion:]";
        v84 = 2114;
        v85 = v52;
        v86 = 2114;
        v87 = v53;
        v88 = 2114;
        v89 = v54;
        _os_log_impl(&dword_2117D4000, v51, OS_LOG_TYPE_DEFAULT, "%s Skipping Model {%{public}@, %{public}@} as file doesnt exist at %{public}@", buf, 0x2Au);

      }
    }

    v9 = 1;
    v10 = 2;
    if ((v47 & 1) != 0)
      goto LABEL_33;
  }
  v55 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v56 = v55;
    +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    *(_DWORD *)buf = 136315906;
    v83 = "-[SSRSpeakerRecognitionContext composeModelContextsForProfiles:forSpIdType:forAsset:completion:]";
    v84 = 2114;
    v85 = v57;
    v86 = 2114;
    v87 = v58;
    v88 = 2114;
    v89 = locale;
    _os_log_impl(&dword_2117D4000, v56, OS_LOG_TYPE_DEFAULT, "%s Skipping Model {%{public}@, %{public}@} for %{public}@", buf, 0x2Au);

  }
LABEL_33:
  if (v62)
  {
    if (objc_msgSend(v64, "count"))
      v60 = v64;
    else
      v60 = 0;
    if (objc_msgSend(v63, "count"))
      v61 = v63;
    else
      v61 = 0;
    v62[2](v62, v60, v61);
  }

}

- (BOOL)_checkIfModelsPresentForProfiles:(id)a3 forSpIdType:(unint64_t)a4 forAsset:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "voiceProfileModelFilePathForRecognizerType:spIdType:", 1, a4, (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hashFromResourcePath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

        if (!v19)
        {
          v20 = 0;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_11:

  return v20;
}

- (id)pickAssetForProfiles:(id)a3 forSpIdType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allInstalledAssetsOfType:forLanguage:", 3, self->_locale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:withAssetArray:](self, "pickAssetForProfiles:forSpIdType:withAssetArray:", v6, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pickAssetForProfiles:(id)a3 forSpIdType:(unint64_t)a4 withAssetArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (-[SSRSpeakerRecognitionContext _checkIfModelsPresentForProfiles:forSpIdType:forAsset:](self, "_checkIfModelsPresentForProfiles:forSpIdType:forAsset:", v8, a4, v16, (_QWORD)v22))
          {
            v19 = v16;

            goto LABEL_19;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
          continue;
        break;
      }
    }

    if (CSIsCommunalDevice())
    {
      v17 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:withAssetArray:]";
        v29 = 2112;
        v30 = v10;
        _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s ERR: triggering profile retrain for asset %{publiic}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter", (_QWORD)v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.retrainRequired"), 0);

    }
    v10 = v10;
    v19 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Last known assets are nil - Bailing out"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SSRSpeakerRecognitionContext pickAssetForProfiles:forSpIdType:withAssetArray:]";
      v29 = 2114;
      v30 = v10;
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v19 = 0;
  }
LABEL_19:

  return v19;
}

- (NSDictionary)numEnrollmentUtterances
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((CSIsCommunalDevice() & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = self->_voiceProfileArray;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v8, "voiceProfileAudioDirPathForSpidType:", self->_spIdType);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = +[SSRUtils getNumberOfAudioFilesInDirectory:](SSRUtils, "getNumberOfAudioFilesInDirectory:", v9);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "profileID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setValue:forKey:", v11, v12);

        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);
    }

  }
  return (NSDictionary *)v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SSRSpeakerRecognitionContext dealloc]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognitionContext;
  -[SSRSpeakerRecognitionContext dealloc](&v4, sel_dealloc);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSArray)voiceProfileArray
{
  return self->_voiceProfileArray;
}

- (void)setVoiceProfileArray:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfileArray, a3);
}

- (unint64_t)spIdType
{
  return self->_spIdType;
}

- (void)setSpIdType:(unint64_t)a3
{
  self->_spIdType = a3;
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUUID, a3);
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (unint64_t)scoreType
{
  return self->_scoreType;
}

- (unint64_t)recognitionStyle
{
  return self->_recognitionStyle;
}

- (float)combinationWeight
{
  return self->_combinationWeight;
}

- (NSDictionary)vtEventInfo
{
  return self->_vtEventInfo;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (NSURL)vadResourcePath
{
  return self->_vadResourcePath;
}

- (NSDictionary)modelsContext
{
  return self->_modelsContext;
}

- (NSDictionary)expModelsContext
{
  return self->_expModelsContext;
}

- (unint64_t)maxAllowedAudioSamples
{
  return self->_maxAllowedAudioSamples;
}

- (BOOL)osTransactionReqd
{
  return self->_osTransactionReqd;
}

- (NSString)debugUtteranceAudioFile
{
  return self->_debugUtteranceAudioFile;
}

- (NSString)debugUtteranceMetaFile
{
  return self->_debugUtteranceMetaFile;
}

- (SSRLoggingAggregator)logAggregator
{
  return self->_logAggregator;
}

- (void)setLogAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_logAggregator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logAggregator, 0);
  objc_storeStrong((id *)&self->_debugUtteranceMetaFile, 0);
  objc_storeStrong((id *)&self->_debugUtteranceAudioFile, 0);
  objc_storeStrong((id *)&self->_expModelsContext, 0);
  objc_storeStrong((id *)&self->_modelsContext, 0);
  objc_storeStrong((id *)&self->_vadResourcePath, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_vtEventInfo, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_voiceProfileArray, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

void __70__SSRSpeakerRecognitionContext_initWithVoiceRecognitionContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 120);
  *(_QWORD *)(v7 + 120) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 128);
  *(_QWORD *)(v9 + 128) = v6;

}

@end
