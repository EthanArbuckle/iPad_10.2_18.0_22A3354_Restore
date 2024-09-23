@implementation SSRVoiceProfileRetrainerSATExclave

- (SSRVoiceProfileRetrainerSATExclave)initWithVoiceRetrainingContext:(id)a3 secureAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SSRVoiceProfileRetrainerSATExclave *v10;
  id *p_asset;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  SecureVoiceTriggerSpeakerRecognitionDecoder *v20;
  SecureSpeakerRecognitionConfigBridge *v21;
  SecureSpeakerRecognitionConfigBridge *configBridge;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  SSRSpeakerRecognitionScorer *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SSRSpeakerRecognitionScorer *v34;
  SSRSpeakerRecognitionScorer *satScorer;
  void *v36;
  void *v37;
  SSRVoiceProfileRetrainerSATExclave *v38;
  id v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  dispatch_queue_t v46;
  OS_dispatch_queue *queue;
  uint64_t v48;
  NSURL *configFilePath;
  uint64_t v50;
  NSURL *resourceFilePath;
  uint64_t v52;
  NSURL *satModelFilePath;
  uint64_t v54;
  SSRVoiceProfile *voiceProfile;
  NSDictionary *comparativeModels;
  uint64_t v57;
  NSString *configVersion;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _QWORD v63[4];
  SSRVoiceProfileRetrainerSATExclave *v64;
  _BYTE *v65;
  objc_super v66;
  uint8_t v67[4];
  const char *v68;
  __int16 v69;
  uint64_t v70;
  _BYTE buf[24];
  char v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v66.receiver = self;
    v66.super_class = (Class)SSRVoiceProfileRetrainerSATExclave;
    self = -[SSRVoiceProfileRetrainerSATExclave init](&v66, sel_init);
    if (!self)
      goto LABEL_40;
    SSRLogInitIfNeeded();
    p_asset = (id *)&self->_asset;
    objc_storeStrong((id *)&self->_asset, a4);
    objc_storeStrong((id *)&self->_ctx, a3);
    v12 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *p_asset;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Asset Bridge: %@", buf, 0x16u);
    }
    objc_msgSend(v7, "modelsContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (*p_asset)
      {
        objc_msgSend(*p_asset, "configDataSat");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(*p_asset, "satMemoryIndex");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (!v19)
          {
            v20 = objc_alloc_init(SecureVoiceTriggerSpeakerRecognitionDecoder);
            -[SecureVoiceTriggerSpeakerRecognitionDecoder decodeSecureVoiceTriggerSpeakerRecognitionConfigForAsset:](v20, "decodeSecureVoiceTriggerSpeakerRecognitionConfigForAsset:", self->_asset);
            v21 = (SecureSpeakerRecognitionConfigBridge *)objc_claimAutoreleasedReturnValue();
            configBridge = self->_configBridge;
            self->_configBridge = v21;

            if (!self->_configBridge)
            {
              v43 = *MEMORY[0x24BE28360];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
                goto LABEL_27;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
              v44 = "%s Secure Speaker detector config is nil";
              goto LABEL_26;
            }
            if (objc_msgSend(v7, "forceRetrain"))
            {
              v23 = (void *)*MEMORY[0x24BE28360];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
              {
                v24 = v23;
                objc_msgSend(v16, "secureProfileModelFilePath");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v25;
                _os_log_impl(&dword_2117D4000, v24, OS_LOG_TYPE_DEFAULT, "%s Deleting model file at %{public}@", buf, 0x16u);

              }
              objc_msgSend(v16, "secureProfileModelFilePath");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "path");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v27);

            }
            v29 = [SSRSpeakerRecognitionScorer alloc];
            objc_msgSend(v7, "voiceProfile");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "profileID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "secureProfileModelFilePath");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[SecureAssetBridge configDataSat](self->_asset, "configDataSat");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SecureAssetBridge satMemoryIndex](self->_asset, "satMemoryIndex");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v61) = 1;
            v34 = -[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:memoryIndex:withOffsetsType:forRetraining:](v29, "initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:memoryIndex:withOffsetsType:forRetraining:", v30, v31, 0, 0, v32, v33, 0, v61);
            satScorer = self->_satScorer;
            self->_satScorer = v34;

            if (!self->_satScorer)
            {
              v43 = *MEMORY[0x24BE28360];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
                goto LABEL_27;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
              v44 = "%s ERR: Cannot create SAT Scorer";
              goto LABEL_26;
            }
            v36 = (void *)nd_create();
            self->_novDetector = v36;
            if (v36)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v72 = 1;
              objc_msgSend(*p_asset, "satMemoryIndex");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v63[0] = MEMORY[0x24BDAC760];
              v63[1] = 3221225472;
              v63[2] = __81__SSRVoiceProfileRetrainerSATExclave_initWithVoiceRetrainingContext_secureAsset___block_invoke;
              v63[3] = &unk_24CC85800;
              v65 = buf;
              v38 = self;
              v64 = v38;
              objc_msgSend(v37, "iterateMemoryIndexes:", v63);

              if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
              {
                v45 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v67 = 136315138;
                  v68 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
                  _os_log_error_impl(&dword_2117D4000, v45, OS_LOG_TYPE_ERROR, "%s ERR: Cannot create SAT nd detector", v67, 0xCu);
                }
                goto LABEL_36;
              }
              -[SecureAssetBridge configDataSat](self->_asset, "configDataSat");
              v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v39, "bytes");
              v40 = nd_initialize();

              v41 = *MEMORY[0x24BE284B8];
              if (v40)
              {
                v42 = v41;
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  v60 = nd_error();
                  *(_DWORD *)v67 = 136315394;
                  v68 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
                  v69 = 2080;
                  v70 = v60;
                  _os_log_error_impl(&dword_2117D4000, v42, OS_LOG_TYPE_ERROR, "%s Failed to initialize nov detector with error %s", v67, 0x16u);
                }

LABEL_36:
                _Block_object_dispose(buf, 8);
                goto LABEL_27;
              }
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v67 = 136315138;
                v68 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
                _os_log_impl(&dword_2117D4000, v41, OS_LOG_TYPE_INFO, "%s Successfully created nov detector", v67, 0xCu);
              }

              _Block_object_dispose(buf, 8);
              v46 = dispatch_queue_create("com.apple.corespeech.speakerretrain.secure.satq", 0);
              queue = v38->_queue;
              v38->_queue = (OS_dispatch_queue *)v46;

              objc_msgSend(v16, "configFilePath");
              v48 = objc_claimAutoreleasedReturnValue();
              configFilePath = v38->_configFilePath;
              v38->_configFilePath = (NSURL *)v48;

              objc_msgSend(v7, "resourceFilePath");
              v50 = objc_claimAutoreleasedReturnValue();
              resourceFilePath = v38->_resourceFilePath;
              v38->_resourceFilePath = (NSURL *)v50;

              objc_msgSend(v16, "secureProfileModelFilePath");
              v52 = objc_claimAutoreleasedReturnValue();
              satModelFilePath = v38->_satModelFilePath;
              v38->_satModelFilePath = (NSURL *)v52;

              objc_msgSend(v7, "voiceProfile");
              v54 = objc_claimAutoreleasedReturnValue();
              voiceProfile = v38->_voiceProfile;
              v38->_voiceProfile = (SSRVoiceProfile *)v54;

              comparativeModels = v38->_comparativeModels;
              v38->_comparativeModels = 0;

              v38->_maximumSpeakerVectors = -[SecureSpeakerRecognitionConfigBridge maxEnrollmentUtterances](self->_configBridge, "maxEnrollmentUtterances");
              objc_msgSend(v7, "configVersion");
              v57 = objc_claimAutoreleasedReturnValue();
              configVersion = v38->_configVersion;
              v38->_configVersion = (NSString *)v57;

              v38->_spIdType = objc_msgSend(v7, "spIdType");
LABEL_40:
              self = self;
              v10 = self;
              goto LABEL_41;
            }
            v43 = *MEMORY[0x24BE28360];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
              v44 = "%s Secure Speaker detector failed to create nov detector.";
              goto LABEL_26;
            }
LABEL_27:

            v10 = 0;
            goto LABEL_41;
          }
        }
      }
      v43 = *MEMORY[0x24BE28360];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
      v44 = "%s SATModel Retraining asset is nil! - Skipping";
    }
    else
    {
      v43 = *MEMORY[0x24BE28360];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]";
      v44 = "%s SATModel Retraining context is nil! - Skipping";
    }
LABEL_26:
    _os_log_impl(&dword_2117D4000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, 0xCu);
    goto LABEL_27;
  }
LABEL_41:

  return v10;
}

- (SSRVoiceProfileRetrainerSATExclave)initWithVoiceRetrainingContext:(id)a3
{
  return -[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:](self, "initWithVoiceRetrainingContext:secureAsset:", 0, 0);
}

- (BOOL)resetModelForRetraining
{
  NSObject *v3;
  void *v4;
  id v5;
  NSURL *satModelFilePath;
  int v8;
  const char *v9;
  __int16 v10;
  NSURL *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    satModelFilePath = self->_satModelFilePath;
    v8 = 136315394;
    v9 = "-[SSRVoiceProfileRetrainerSATExclave resetModelForRetraining]";
    v10 = 2114;
    v11 = satModelFilePath;
    _os_log_error_impl(&dword_2117D4000, v3, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", (uint8_t *)&v8, 0x16u);
  }
  -[NSURL path](self->_satModelFilePath, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v4);

  return -[SSRSpeakerRecognitionScorer resetScorerWithModelFilePath:](self->_satScorer, "resetScorerWithModelFilePath:", self->_satModelFilePath);
}

- (NSURL)modelFilePath
{
  return self->_satModelFilePath;
}

- (unint64_t)retrainerType
{
  return 1;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SSRVoiceProfileRetrainerSATExclave *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_novDetector)
  {
    nd_close();
    self->_novDetector = 0;
  }
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SSRVoiceProfileRetrainerSATExclave dealloc]";
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileRetrainerSATExclave;
  -[SSRVoiceProfileRetrainerSATExclave dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%@:%@:%@}"), v4, v5, self->_satModelFilePath, self->_asset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)needsRetrainingWithAudioFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  NSURL *satModelFilePath;
  unint64_t maximumSpeakerVectors;
  void *v24;
  unint64_t spIdType;
  NSObject *v26;
  void *v27;
  const char *v28;
  void *v29;
  unint64_t v30;
  int v31;
  const char *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[SSRSpeakerRecognitionScorer satModelAvailable](self->_satScorer, "satModelAvailable"))
  {
    v16 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v31 = 136315138;
    v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
    v17 = "%s SATNeedsRetraining(YES): satModelAvailable is not available!!";
    v18 = v16;
    v19 = 12;
LABEL_10:
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v31, v19);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_satModelFilePath, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

  if ((v7 & 1) == 0)
  {
    v20 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    satModelFilePath = self->_satModelFilePath;
    v31 = 136315394;
    v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
    v33 = 2114;
    v34 = (unint64_t)satModelFilePath;
    v17 = "%s SATNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    v18 = v20;
    v19 = 22;
    goto LABEL_10;
  }
  v8 = objc_msgSend(v4, "count");
  v9 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
  if ((CSIsCommunalDevice() & 1) != 0)
    goto LABEL_4;
  maximumSpeakerVectors = self->_maximumSpeakerVectors;
  if (v8 <= maximumSpeakerVectors && v9 != v8)
  {
    v24 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      spIdType = self->_spIdType;
      v26 = v24;
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", spIdType);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
      v33 = 2050;
      v34 = v8;
      v35 = 2050;
      v36 = v9;
      v37 = 2050;
      v38 = maximumSpeakerVectors;
      v39 = 2114;
      v40 = v27;
      v28 = "%s SATNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
LABEL_21:
      _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v31, 0x34u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v8 > maximumSpeakerVectors && v9 != maximumSpeakerVectors)
  {
    v29 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_spIdType;
      v26 = v29;
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
      v33 = 2050;
      v34 = v8;
      v35 = 2050;
      v36 = v9;
      v37 = 2050;
      v38 = maximumSpeakerVectors;
      v39 = 2114;
      v40 = v27;
      v28 = "%s SATNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
      goto LABEL_21;
    }
LABEL_11:
    v11 = 1;
    goto LABEL_12;
  }
LABEL_4:
  v10 = (void *)*MEMORY[0x24BE284B8];
  v11 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_maximumSpeakerVectors;
    v13 = self->_spIdType;
    v14 = v10;
    +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 136316162;
    v32 = "-[SSRVoiceProfileRetrainerSATExclave needsRetrainingWithAudioFiles:]";
    v33 = 2050;
    v34 = v8;
    v35 = 2050;
    v36 = v9;
    v37 = 2050;
    v38 = v12;
    v39 = 2114;
    v40 = v15;
    _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s SATNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", (uint8_t *)&v31, 0x34u);

    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (BOOL)implicitTrainingRequired
{
  unint64_t v3;
  NSObject *v4;
  unint64_t maximumSpeakerVectors;
  int v7;
  const char *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    maximumSpeakerVectors = self->_maximumSpeakerVectors;
    v7 = 136315650;
    v8 = "-[SSRVoiceProfileRetrainerSATExclave implicitTrainingRequired]";
    v9 = 2050;
    v10 = v3;
    v11 = 2050;
    v12 = maximumSpeakerVectors;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s satVectorCount %{public}ld maxCount %{public}ld", (uint8_t *)&v7, 0x20u);
  }
  return v3 < self->_maximumSpeakerVectors;
}

- (void)purgeLastSpeakerEmbedding
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  SSRVoiceProfile *voiceProfile;
  NSObject *v7;
  void *v8;
  SSRVoiceProfile *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  _WORD v15[17];

  *(_QWORD *)&v15[13] = *MEMORY[0x24BDAC8D0];
  v3 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
  v4 = (void *)*MEMORY[0x24BE284B8];
  if (v3)
  {
    v5 = (v3 - 1);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      voiceProfile = self->_voiceProfile;
      v7 = v4;
      -[SSRVoiceProfile profileID](voiceProfile, "profileID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[SSRVoiceProfileRetrainerSATExclave purgeLastSpeakerEmbedding]";
      v14 = 1026;
      *(_DWORD *)v15 = v5;
      v15[2] = 2114;
      *(_QWORD *)&v15[3] = v8;
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}d from profile %{public}@", (uint8_t *)&v12, 0x1Cu);

    }
    -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_satScorer, "deleteVectorAtIndex:", v5);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v9 = self->_voiceProfile;
    v10 = v4;
    -[SSRVoiceProfile profileID](v9, "profileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SSRVoiceProfileRetrainerSATExclave purgeLastSpeakerEmbedding]";
    v14 = 2114;
    *(_QWORD *)v15 = v11;
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  return 0;
}

- (void)addUtterances:(id)a3 withPolicy:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *);
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  SSRVoiceProfile *voiceProfile;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *log;
  void (**v65)(id, void *, void *);
  id v66;
  id v67;
  id obj;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  unint64_t v87;
  __int16 v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  _BYTE v94[128];
  uint64_t v95;
  _QWORD v96[3];

  v96[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, void *))a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x212BE17E4]();
  v61 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v66 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v8 && objc_msgSend(v8, "count"))
  {
    v57 = v11;
    v58 = v10;
    v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v67, "addObject:", self->_satScorer);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v59 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
    v13 = v66;
    if (!v12)
      goto LABEL_34;
    v14 = v12;
    v15 = *(_QWORD *)v71;
    v69 = *MEMORY[0x24BDD0FC8];
    v65 = v9;
    v60 = *(_QWORD *)v71;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v71 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v16);
        objc_msgSend(v17, "pathExtension");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("wav"));

        if ((v19 & 1) != 0)
        {
          -[SSRVoiceProfileRetrainerSATExclave _processAudioFile:](self, "_processAudioFile:", v17);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v17, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v21, v22);
            goto LABEL_16;
          }
          -[SSRVoiceProfileRetrainerSATExclave _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", self->_speakerVector, self->_speakerVectorSize, v67, self->_processedAudioDurationMs);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v38 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v17, "lastPathComponent");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("Failed to get scorecard for utterance %@ on profile %@"), v39, v40);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
              v78 = 2114;
              v79 = v28;
              _os_log_error_impl(&dword_2117D4000, v41, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
            }
            v42 = (void *)MEMORY[0x24BDD1540];
            v90 = CFSTR("reason");
            v91 = v28;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 755, v43);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "path");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v66;
            objc_msgSend(v66, "setObject:forKey:", v21, v44);

            v9 = v65;
            goto LABEL_15;
          }
          if (!v9 || (v9[2](v9, v17, v22), (v29 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[NSURL URLByDeletingLastPathComponent](self->_satModelFilePath, "URLByDeletingLastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              log = v30;
              objc_msgSend(v17, "lastPathComponent");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSURL lastPathComponent](self->_satModelFilePath, "lastPathComponent");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "lastPathComponent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "URLByDeletingLastPathComponent");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "lastPathComponent");
              v63 = v28;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
              *(_DWORD *)buf = 136316674;
              v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
              v78 = 2114;
              v79 = v62;
              v80 = 2114;
              v81 = v31;
              v82 = 2114;
              v83 = v32;
              v84 = 2114;
              v85 = v34;
              v86 = 2050;
              v87 = v35;
              v88 = 2114;
              v89 = v22;
              _os_log_impl(&dword_2117D4000, log, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %{public}lu vector with scoreCard %{public}@", buf, 0x48u);

              v15 = v60;
              v28 = v63;

              v9 = v65;
            }
            v36 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
            -[SSRSpeakerRecognitionScorer updateSAT](self->_satScorer, "updateSAT");
            if (-[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount") - v36 == 1)
            {
              objc_msgSend(v17, "path");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKey:", v22, v37);
              v21 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Reached max (%lu) of training utterances, Skipped SAT model update"), -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
                v78 = 2114;
                v79 = v37;
                _os_log_error_impl(&dword_2117D4000, v45, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
              }
              v46 = (void *)MEMORY[0x24BDD1540];
              v74 = v69;
              v75 = v37;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 739, v47);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "path");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKey:", v21, v48);

              v9 = v65;
            }

            v13 = v66;
            goto LABEL_15;
          }
          v21 = (void *)v29;
        }
        else
        {
          v23 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v17, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("Invalid file format %@ "), v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v77 = "-[SSRVoiceProfileRetrainerSATExclave addUtterances:withPolicy:withCompletion:]";
            v78 = 2114;
            v79 = v22;
            _os_log_error_impl(&dword_2117D4000, v25, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
          }
          v26 = (void *)MEMORY[0x24BDD1540];
          v92 = v69;
          v93 = v22;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 729, v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v17, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v21, v28);
LABEL_15:

LABEL_16:
        ++v16;
      }
      while (v14 != v16);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
      v14 = v49;
      if (!v49)
      {
LABEL_34:

        voiceProfile = self->_voiceProfile;
        -[NSURL absoluteString](self->_satModelFilePath, "absoluteString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfile updateVoiceProfilePathExclave:](voiceProfile, "updateVoiceProfilePathExclave:", v51);

        v10 = v58;
        if (v58)
          (*((void (**)(id, _QWORD, id, id))v58 + 2))(v58, 0, v61, v66);
        v8 = v59;
        v11 = v57;
        v52 = v67;
        goto LABEL_39;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File Array is nil"));
  v53 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v53;
  if (v10)
  {
    v54 = (void *)MEMORY[0x24BDD1540];
    v95 = *MEMORY[0x24BDD0FC8];
    v96[0] = v53;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, &v95, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 701, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v56, 0, 0);

  }
LABEL_39:

  objc_autoreleasePoolPop(v11);
}

- (id)_processAudioFile:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  double v7;
  void *v8;
  NSObject *v9;
  id v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  float v15;
  NSObject *v16;
  uint64_t v17;
  NSData *v18;
  NSData *speakerVector;
  unint64_t v20;
  NSObject *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSData *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD *, uint64_t, int, void *);
  void *v33;
  double v34;
  SSRVoiceProfileRetrainerSATExclave *v35;
  uint64_t *v36;
  _QWORD *v37;
  _BYTE *v38;
  char v39[40];
  _QWORD v40[4];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double v50;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  double v54;
  __int16 v55;
  unint64_t v56;
  _BYTE buf[24];
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  self->_bestTriggerScore = -1.0;
  nd_reset();
  self->_currUttLengthInMs = 0xFFFFFFFFLL;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5041;
  v45 = __Block_byref_object_dispose__5042;
  v46 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3810000000;
  v58 = &unk_2118676B3;
  v59 = 0;
  v60 = 0;
  v61 = 0;
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __56__SSRVoiceProfileRetrainerSATExclave__processAudioFile___block_invoke;
  v33 = &unk_24CC85828;
  v7 = COERCE_DOUBLE(v4);
  v34 = v7;
  v35 = self;
  v36 = &v41;
  v37 = v40;
  v38 = buf;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", *(_QWORD *)&v7, v39, 640, &v30);
  v8 = (void *)v42[5];
  if (v8)
  {
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315650;
      v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
      v53 = 2114;
      v54 = v7;
      v55 = 2114;
      v56 = (unint64_t)v8;
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v51, 0x20u);
      v8 = (void *)v42[5];
    }
    v10 = v8;
  }
  else if (self->_currUttLengthInMs > 0xC7)
  {
    v15 = *(float *)(*(_QWORD *)&buf[8] + 48);
    self->_bestTriggerScore = v15;
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v51 = 136315394;
      v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
      v53 = 2050;
      v54 = v15;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Found last detection results, trigger score = %{public}f", v51, 0x16u);
    }
    v17 = nd_getsupervector();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)v17, 4 * *(unsigned int *)(v17 + 8));
      v18 = (NSData *)objc_claimAutoreleasedReturnValue();
      speakerVector = self->_speakerVector;
      self->_speakerVector = v18;

      v20 = -[NSData length](self->_speakerVector, "length") >> 2;
      self->_speakerVectorSize = v20;
      v21 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        v29 = self->_speakerVector;
        *(_DWORD *)v51 = 136315651;
        v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
        v53 = 2113;
        v54 = *(double *)&v29;
        v55 = 2048;
        v56 = v20;
        _os_log_debug_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEBUG, "%s SpeakerVector: %{private}@ [dimension=%ld]", v51, 0x20u);
      }
      v10 = 0;
      self->_processedAudioDurationMs = self->_currUttLengthInMs;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get valid supervector for %@ - Skipping..."), *(_QWORD *)&v7);
      v22 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v23 = (void *)MEMORY[0x24BDD1540];
      v47 = *MEMORY[0x24BDD0FC8];
      v48 = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 743, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v51 = 136315394;
        v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
        v53 = 2114;
        v54 = v22;
        _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@", v51, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "submitVoiceIdIssueReport:", *MEMORY[0x24BE284F0]);

      v10 = v25;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Too little audio %dms in %@ - Bailing out"), self->_currUttLengthInMs, *(_QWORD *)&v7, v30, v31, v32, v33);
    v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v51 = 136315394;
      v52 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]";
      v53 = 2114;
      v54 = v11;
      _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@", v51, 0x16u);
    }
    v13 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    v50 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 751, v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);

  return v10;
}

- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  unint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v24 = a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "scoreSpeakerVector:withDimensions:withThresholdType:", v8, a4, 0, v24);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "profileID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v13);
  }

  v31[0] = v10;
  v30[0] = CFSTR("spIdKnownUserSATScores");
  v30[1] = CFSTR("spIdAudioProcessedDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v19;
  v30[2] = CFSTR("bestVoiceTriggerScore");
  *(float *)&v20 = self->_bestTriggerScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (SSRVoiceProfileRetrainingContext)ctx
{
  return (SSRVoiceProfileRetrainingContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCtx:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SecureAssetBridge)asset
{
  return (SecureAssetBridge *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SSRSpeakerRecognitionScorer)satScorer
{
  return self->_satScorer;
}

- (void)setSatScorer:(id)a3
{
  objc_storeStrong((id *)&self->_satScorer, a3);
}

- (SSRVoiceProfile)voiceProfile
{
  return self->_voiceProfile;
}

- (void)setVoiceProfile:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfile, a3);
}

- (unint64_t)spIdType
{
  return self->_spIdType;
}

- (void)setSpIdType:(unint64_t)a3
{
  self->_spIdType = a3;
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (void)setConfigFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_configFilePath, a3);
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (void)setResourceFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_resourceFilePath, a3);
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configVersion, a3);
}

- (NSURL)satModelFilePath
{
  return self->_satModelFilePath;
}

- (void)setSatModelFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_satModelFilePath, a3);
}

- (NSDictionary)comparativeModels
{
  return self->_comparativeModels;
}

- (void)setComparativeModels:(id)a3
{
  objc_storeStrong((id *)&self->_comparativeModels, a3);
}

- (unint64_t)currUttLengthInMs
{
  return self->_currUttLengthInMs;
}

- (void)setCurrUttLengthInMs:(unint64_t)a3
{
  self->_currUttLengthInMs = a3;
}

- (NSData)speakerVector
{
  return self->_speakerVector;
}

- (void)setSpeakerVector:(id)a3
{
  objc_storeStrong((id *)&self->_speakerVector, a3);
}

- (unint64_t)speakerVectorSize
{
  return self->_speakerVectorSize;
}

- (void)setSpeakerVectorSize:(unint64_t)a3
{
  self->_speakerVectorSize = a3;
}

- (unint64_t)processedAudioDurationMs
{
  return self->_processedAudioDurationMs;
}

- (void)setProcessedAudioDurationMs:(unint64_t)a3
{
  self->_processedAudioDurationMs = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)maximumSpeakerVectors
{
  return self->_maximumSpeakerVectors;
}

- (void)setMaximumSpeakerVectors:(unint64_t)a3
{
  self->_maximumSpeakerVectors = a3;
}

- (float)bestTriggerScore
{
  return self->_bestTriggerScore;
}

- (void)setBestTriggerScore:(float)a3
{
  self->_bestTriggerScore = a3;
}

- (SecureSpeakerRecognitionConfigBridge)configBridge
{
  return self->_configBridge;
}

- (void)setConfigBridge:(id)a3
{
  objc_storeStrong((id *)&self->_configBridge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configBridge, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_satModelFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_satScorer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

void __56__SSRVoiceProfileRetrainerSATExclave__processAudioFile___block_invoke(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  float v11;
  float v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  unsigned int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (v8)
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 136315394;
      v24 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]_block_invoke";
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  }
  else if (a3)
  {
    v11 = (float)*(unint64_t *)(*(_QWORD *)(a1[7] + 8) + 24);
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    *(_QWORD *)(a1[5] + 104) = (unint64_t)(float)((float)(v11 / v12) * 1000.0);
    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[4];
      v15 = *(_QWORD *)(a1[5] + 104);
      *(_DWORD *)buf = 136315650;
      v24 = "-[SSRVoiceProfileRetrainerSATExclave _processAudioFile:]_block_invoke";
      v25 = 2050;
      v26 = v15;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %{public}lu, calling endAudio: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += v17 / v22;
    v18 = objc_retainAutorelease(v16);
    objc_msgSend(v18, "bytes");
    nd_wavedata();
    v19 = nd_getresults();
    if (v19)
    {
      v20 = *(_QWORD *)(a1[8] + 8);
      v21 = *(_OWORD *)v19;
      *(_QWORD *)(v20 + 48) = *(_QWORD *)(v19 + 16);
      *(_OWORD *)(v20 + 32) = v21;
    }

  }
}

void __81__SSRVoiceProfileRetrainerSATExclave_initWithVoiceRetrainingContext_secureAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v3, "nameString");
    objc_msgSend(v4, "dataInBytes");
    objc_msgSend(v4, "dataLength");
    if (nd_addresource())
    {
      v5 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEBUG))
      {
        v6 = v5;
        v7 = 136315395;
        v8 = "-[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]_block_invoke";
        v9 = 2081;
        v10 = objc_msgSend(v4, "nameString");
        _os_log_debug_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEBUG, "%s Failed to add resource %{private}s", (uint8_t *)&v7, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

@end
