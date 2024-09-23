@implementation SSRVoiceProfileRetrainerPSRExclave

- (SSRVoiceProfileRetrainerPSRExclave)initWithVoiceRetrainingContext:(id)a3 secureAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SSRVoiceProfileRetrainerPSRExclave *v10;
  id *p_asset;
  os_log_t *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SecureVoiceTriggerSpeakerRecognitionDecoder *v18;
  SecureSpeakerRecognitionConfigBridge *v19;
  SecureSpeakerRecognitionConfigBridge *configBridge;
  void *v21;
  void *v22;
  SSRVoiceProfileRetrainerPSRExclave *v23;
  id v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  SSRSpeakerRecognitionScorer *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SSRSpeakerRecognitionScorer *psrScorer;
  dispatch_queue_t v43;
  OS_dispatch_queue *queue;
  uint64_t v45;
  NSURL *configFilePath;
  uint64_t v47;
  NSURL *resourceFilePath;
  uint64_t v49;
  NSURL *psrModelFilePath;
  uint64_t v51;
  SSRVoiceProfile *voiceProfile;
  NSDictionary *comparativeModels;
  uint64_t v54;
  NSString *configVersion;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[4];
  SSRVoiceProfileRetrainerPSRExclave *v61;
  _BYTE *v62;
  objc_super v63;
  uint8_t v64[4];
  const char *v65;
  __int16 v66;
  uint64_t v67;
  _BYTE buf[24];
  char v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v63.receiver = self;
    v63.super_class = (Class)SSRVoiceProfileRetrainerPSRExclave;
    self = -[SSRVoiceProfileRetrainerPSRExclave init](&v63, sel_init);
    if (self)
    {
      SSRLogInitIfNeeded();
      p_asset = (id *)&self->_asset;
      objc_storeStrong((id *)&self->_asset, a4);
      objc_storeStrong((id *)&self->_ctx, a3);
      v12 = (os_log_t *)MEMORY[0x24BE284B8];
      v13 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *p_asset;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Asset Bridge: %@", buf, 0x16u);
      }
      objc_msgSend(v7, "modelsContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (*p_asset)
        {
          v18 = objc_alloc_init(SecureVoiceTriggerSpeakerRecognitionDecoder);
          -[SecureVoiceTriggerSpeakerRecognitionDecoder decodeSecureVoiceTriggerSpeakerRecognitionConfigForAsset:](v18, "decodeSecureVoiceTriggerSpeakerRecognitionConfigForAsset:", self->_asset);
          v19 = (SecureSpeakerRecognitionConfigBridge *)objc_claimAutoreleasedReturnValue();
          configBridge = self->_configBridge;
          self->_configBridge = v19;

          if (self->_configBridge)
          {
            v21 = (void *)nd_create();
            self->_novDetector = v21;
            if (v21)
            {
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v69 = 1;
              objc_msgSend(*p_asset, "memoryIndex");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v60[0] = MEMORY[0x24BDAC760];
              v60[1] = 3221225472;
              v60[2] = __81__SSRVoiceProfileRetrainerPSRExclave_initWithVoiceRetrainingContext_secureAsset___block_invoke;
              v60[3] = &unk_24CC85800;
              v62 = buf;
              v23 = self;
              v61 = v23;
              objc_msgSend(v22, "iterateMemoryIndexes:", v60);

              if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
              {
LABEL_15:

                _Block_object_dispose(buf, 8);
LABEL_25:

                v10 = 0;
                goto LABEL_35;
              }
              -[SecureAssetBridge configData](self->_asset, "configData");
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v24, "bytes");
              v25 = nd_initialize();

              v26 = *v12;
              if (v25)
              {
                v27 = v26;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v57 = nd_error();
                  *(_DWORD *)v64 = 136315394;
                  v65 = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
                  v66 = 2080;
                  v67 = v57;
                  _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s Failed to initialize nov detector with error %s", v64, 0x16u);
                }

                goto LABEL_15;
              }
              if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v64 = 136315138;
                v65 = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
                _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_INFO, "%s Successfully created nov detector", v64, 0xCu);
              }

              _Block_object_dispose(buf, 8);
              if ((objc_msgSend(v7, "forceRetrain") & 1) != 0)
              {
                v30 = (void *)*MEMORY[0x24BE28360];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
                {
                  v31 = v30;
                  objc_msgSend(v17, "secureProfileModelFilePath");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v32;
                  _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting model file at %{public}@", buf, 0x16u);

                }
                objc_msgSend(v17, "secureProfileModelFilePath");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "path");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v34);

              }
              v36 = [SSRSpeakerRecognitionScorer alloc];
              objc_msgSend(v7, "voiceProfile");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "profileID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "secureProfileModelFilePath");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*p_asset, "configData");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*p_asset, "memoryIndex");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v58) = 1;
              v41 = -[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:memoryIndex:withOffsetsType:forRetraining:](v36, "initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:memoryIndex:withOffsetsType:forRetraining:", v37, v38, 0, 0, v39, v40, 0, v58);
              psrScorer = v23->_psrScorer;
              v23->_psrScorer = (SSRSpeakerRecognitionScorer *)v41;

              if (v23->_psrScorer)
              {
                v43 = dispatch_queue_create("com.apple.corespeech.speakerretrain.secure.psrq", 0);
                queue = v23->_queue;
                v23->_queue = (OS_dispatch_queue *)v43;

                objc_msgSend(v17, "configFilePath");
                v45 = objc_claimAutoreleasedReturnValue();
                configFilePath = v23->_configFilePath;
                v23->_configFilePath = (NSURL *)v45;

                objc_msgSend(v7, "resourceFilePath");
                v47 = objc_claimAutoreleasedReturnValue();
                resourceFilePath = v23->_resourceFilePath;
                v23->_resourceFilePath = (NSURL *)v47;

                objc_msgSend(v17, "secureProfileModelFilePath");
                v49 = objc_claimAutoreleasedReturnValue();
                psrModelFilePath = v23->_psrModelFilePath;
                v23->_psrModelFilePath = (NSURL *)v49;

                objc_msgSend(v7, "voiceProfile");
                v51 = objc_claimAutoreleasedReturnValue();
                voiceProfile = v23->_voiceProfile;
                v23->_voiceProfile = (SSRVoiceProfile *)v51;

                comparativeModels = v23->_comparativeModels;
                v23->_comparativeModels = 0;

                v23->_maximumSpeakerVectors = -[SecureSpeakerRecognitionConfigBridge maxEnrollmentUtterances](self->_configBridge, "maxEnrollmentUtterances");
                objc_msgSend(v7, "configVersion");
                v54 = objc_claimAutoreleasedReturnValue();
                configVersion = v23->_configVersion;
                v23->_configVersion = (NSString *)v54;

                v23->_spIdType = objc_msgSend(v7, "spIdType");
                goto LABEL_34;
              }
              v28 = *MEMORY[0x24BE28360];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
                goto LABEL_25;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
              v29 = "%s ERR: Cannot create PSR Scorer";
            }
            else
            {
              v28 = *MEMORY[0x24BE28360];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
                goto LABEL_25;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
              v29 = "%s Secure Speaker detector failed to create nov detector.";
            }
          }
          else
          {
            v28 = *MEMORY[0x24BE28360];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
              goto LABEL_25;
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
            v29 = "%s Secure Speaker detector config is nil";
          }
        }
        else
        {
          v28 = *MEMORY[0x24BE28360];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
            goto LABEL_25;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
          v29 = "%s PSRModel Retraining asset is nil! - Skipping";
        }
      }
      else
      {
        v28 = *MEMORY[0x24BE28360];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]";
        v29 = "%s PSRModel Retraining context is nil! - Skipping";
      }
      _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
      goto LABEL_25;
    }
LABEL_34:
    self = self;
    v10 = self;
  }
LABEL_35:

  return v10;
}

- (SSRVoiceProfileRetrainerPSRExclave)initWithVoiceRetrainingContext:(id)a3
{
  return -[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:](self, "initWithVoiceRetrainingContext:secureAsset:", 0, 0);
}

- (NSURL)modelFilePath
{
  return self->_psrModelFilePath;
}

- (unint64_t)retrainerType
{
  return 2;
}

- (BOOL)resetModelForRetraining
{
  NSObject *v3;
  void *v4;
  id v5;
  NSURL *psrModelFilePath;
  int v8;
  const char *v9;
  __int16 v10;
  NSURL *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    psrModelFilePath = self->_psrModelFilePath;
    v8 = 136315394;
    v9 = "-[SSRVoiceProfileRetrainerPSRExclave resetModelForRetraining]";
    v10 = 2114;
    v11 = psrModelFilePath;
    _os_log_error_impl(&dword_2117D4000, v3, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", (uint8_t *)&v8, 0x16u);
  }
  -[NSURL path](self->_psrModelFilePath, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v4);

  return -[SSRSpeakerRecognitionScorer resetScorerWithModelFilePath:](self->_psrScorer, "resetScorerWithModelFilePath:", self->_psrModelFilePath);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SSRVoiceProfileRetrainerPSRExclave *v8;
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
    v6 = "-[SSRVoiceProfileRetrainerPSRExclave dealloc]";
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileRetrainerPSRExclave;
  -[SSRVoiceProfileRetrainerPSRExclave dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%@:%@:%@}"), v4, v5, self->_psrModelFilePath, self->_asset);
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
  unint64_t v10;
  unint64_t maximumSpeakerVectors;
  void *v12;
  unint64_t spIdType;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  NSURL *psrModelFilePath;
  BOOL v23;
  void *v25;
  _BOOL4 v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
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
  if (!-[SSRSpeakerRecognitionScorer satModelAvailable](self->_psrScorer, "satModelAvailable"))
  {
    v17 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v31 = 136315138;
    v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
    v18 = "%s PSRNeedsRetraining(YES): satModelAvailable is not available!";
    v19 = v17;
    v20 = 12;
LABEL_11:
    _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v31, v20);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_psrModelFilePath, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, 0);

  if ((v7 & 1) == 0)
  {
    v21 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    psrModelFilePath = self->_psrModelFilePath;
    v31 = 136315394;
    v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
    v33 = 2114;
    v34 = (unint64_t)psrModelFilePath;
    v18 = "%s PSRNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    v19 = v21;
    v20 = 22;
    goto LABEL_11;
  }
  v8 = objc_msgSend(v4, "count");
  v9 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
  v10 = v9;
  maximumSpeakerVectors = self->_maximumSpeakerVectors;
  if (v8 <= maximumSpeakerVectors && v9 != v8)
  {
    v12 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      spIdType = self->_spIdType;
      v14 = v12;
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", spIdType);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
      v33 = 2050;
      v34 = v8;
      v35 = 2050;
      v36 = v10;
      v37 = 2050;
      v38 = maximumSpeakerVectors;
      v39 = 2114;
      v40 = v15;
      v16 = "%s PSRNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
LABEL_18:
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v31, 0x34u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v25 = (void *)*MEMORY[0x24BE284B8];
  v26 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
  if (v8 > maximumSpeakerVectors && v10 != maximumSpeakerVectors)
  {
    if (v26)
    {
      v27 = self->_spIdType;
      v14 = v25;
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 136316162;
      v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
      v33 = 2050;
      v34 = v8;
      v35 = 2050;
      v36 = v10;
      v37 = 2050;
      v38 = maximumSpeakerVectors;
      v39 = 2114;
      v40 = v15;
      v16 = "%s PSRNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
      goto LABEL_18;
    }
LABEL_12:
    v23 = 1;
    goto LABEL_13;
  }
  if (v26)
  {
    v28 = self->_spIdType;
    v29 = v25;
    +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 136316162;
    v32 = "-[SSRVoiceProfileRetrainerPSRExclave needsRetrainingWithAudioFiles:]";
    v33 = 2050;
    v34 = v8;
    v35 = 2050;
    v36 = v10;
    v37 = 2050;
    v38 = maximumSpeakerVectors;
    v39 = 2114;
    v40 = v30;
    _os_log_impl(&dword_2117D4000, v29, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", (uint8_t *)&v31, 0x34u);

  }
  v23 = 0;
LABEL_13:

  return v23;
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
  v3 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    maximumSpeakerVectors = self->_maximumSpeakerVectors;
    v7 = 136315650;
    v8 = "-[SSRVoiceProfileRetrainerPSRExclave implicitTrainingRequired]";
    v9 = 2050;
    v10 = v3;
    v11 = 2050;
    v12 = maximumSpeakerVectors;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s satVectorCount %{public}ld maxCount %{public}ld", (uint8_t *)&v7, 0x20u);
  }
  return v3 < self->_maximumSpeakerVectors;
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
    objc_msgSend(v67, "addObject:", self->_psrScorer);
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
          -[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:](self, "_processAudioFile:", v17);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v17, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v21, v22);
            goto LABEL_16;
          }
          -[SSRVoiceProfileRetrainerPSRExclave _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", self->_speakerVector, self->_speakerVectorSize, v67, self->_processedAudioDurationMs);
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
              v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
              v78 = 2114;
              v79 = v28;
              _os_log_error_impl(&dword_2117D4000, v41, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
            }
            v42 = (void *)MEMORY[0x24BDD1540];
            v90 = CFSTR("reason");
            v91 = v28;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v43);
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
            -[NSURL URLByDeletingLastPathComponent](self->_psrModelFilePath, "URLByDeletingLastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              log = v30;
              objc_msgSend(v17, "lastPathComponent");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSURL lastPathComponent](self->_psrModelFilePath, "lastPathComponent");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "lastPathComponent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "URLByDeletingLastPathComponent");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "lastPathComponent");
              v63 = v28;
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
              *(_DWORD *)buf = 136316674;
              v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
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
            v36 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
            -[SSRSpeakerRecognitionScorer updateSAT](self->_psrScorer, "updateSAT");
            if (-[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount") - v36 == 1)
            {
              objc_msgSend(v17, "path");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKey:", v22, v37);
              v21 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Reached max (%lu) of training utterances, Skipped SAT model update"), -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
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
            v77 = "-[SSRVoiceProfileRetrainerPSRExclave addUtterances:withPolicy:withCompletion:]";
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
        -[NSURL absoluteString](self->_psrModelFilePath, "absoluteString");
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
  v3 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
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
      v13 = "-[SSRVoiceProfileRetrainerPSRExclave purgeLastSpeakerEmbedding]";
      v14 = 1026;
      *(_DWORD *)v15 = v5;
      v15[2] = 2114;
      *(_QWORD *)&v15[3] = v8;
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}d from profile %{public}@", (uint8_t *)&v12, 0x1Cu);

    }
    -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_psrScorer, "deleteVectorAtIndex:", v5);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v9 = self->_voiceProfile;
    v10 = v4;
    -[SSRVoiceProfile profileID](v9, "profileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SSRVoiceProfileRetrainerPSRExclave purgeLastSpeakerEmbedding]";
    v14 = 2114;
    *(_QWORD *)v15 = v11;
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSDictionary *comparativeModels;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id *v24;
  const __CFString **v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  SSRVoiceProfile *voiceProfile;
  NSObject *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  SSRVoiceProfile *v37;
  NSObject *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  char v44;
  void *v45;
  int v46;
  SSRVoiceProfile *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  SSRVoiceProfile *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  SSRVoiceProfile *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  id v64;
  SSRVoiceProfile *v65;
  NSObject *v66;
  void *v67;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t (**v74)(id, void *);
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  _BYTE v83[18];
  __int16 v84;
  unint64_t v85;
  const __CFString *v86;
  id v87;
  const __CFString *v88;
  id v89;
  const __CFString *v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, void *))a3;
  comparativeModels = self->_comparativeModels;
  if (comparativeModels)
  {
    +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", comparativeModels, self->_configFilePath, self->_resourceFilePath, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || !objc_msgSend(v6, "count"))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = self->_comparativeModels;
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Cannot create comparative scorers from %@ on profile %@"), v10, v11);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v12 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
        v82 = 2114;
        *(_QWORD *)v83 = v8;
        _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v13 = (void *)MEMORY[0x24BDD1540];
      v90 = CFSTR("reason");
      v91[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_56;
    }
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v8, "addObjectsFromArray:", v7);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = 0;
  }
  v16 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
  -[SSRVoiceProfile getExplicitEnrollmentUtterancesForType:](self->_voiceProfile, "getExplicitEnrollmentUtterancesForType:", self->_spIdType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 <= 2)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("ExpSatVectorCount is invalid (%lu) for profile %@ - Bailingout"), v18, v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v21 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      v82 = 2114;
      *(_QWORD *)v83 = v14;
      _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v88 = CFSTR("reason");
    v89 = v14;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = &v89;
    v25 = &v88;
LABEL_17:
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  if (v16 < v18)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("satVectorCount %lu is < %luE for profile %@ - Bailingout"), v16, v18, v27);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v28 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      v82 = 2114;
      *(_QWORD *)v83 = v14;
      _os_log_error_impl(&dword_2117D4000, v28, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v86 = CFSTR("reason");
    v87 = v14;
    v23 = (void *)MEMORY[0x24BDBCE70];
    v24 = &v87;
    v25 = &v86;
    goto LABEL_17;
  }
  v71 = v8;
  v69 = v7;
  v30 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    voiceProfile = self->_voiceProfile;
    v32 = v30;
    -[SSRVoiceProfile profileID](voiceProfile, "profileID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
    v82 = 2114;
    *(_QWORD *)v83 = v33;
    *(_WORD *)&v83[8] = 2050;
    *(_QWORD *)&v83[10] = v16;
    v84 = 2050;
    v85 = v18;
    _os_log_impl(&dword_2117D4000, v32, OS_LOG_TYPE_DEFAULT, "%s Processing Voice Profile %{public}@ with vectorCount %{public}lu and expVectorCount %{public}lu", buf, 0x2Au);

  }
  v70 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v16 - v18);
  v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v18);
  do
  {
    v34 = v16 - 1;
    -[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:](self->_psrScorer, "getSpeakerVectorAtIndex:", v16 - 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)*MEMORY[0x24BE284B8];
    if (v35)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_voiceProfile;
        v38 = v36;
        -[SSRVoiceProfile profileID](v37, "profileID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v35, "length");
        *(_DWORD *)buf = 136315906;
        v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
        v82 = 2050;
        *(_QWORD *)v83 = v16 - 1;
        *(_WORD *)&v83[8] = 2114;
        *(_QWORD *)&v83[10] = v39;
        v84 = 2050;
        v85 = v40 >> 2;
        _os_log_impl(&dword_2117D4000, v38, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}lu vector from %{public}@ with size %{public}lu", buf, 0x2Au);

      }
      -[SSRVoiceProfileRetrainerPSRExclave _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", v35, (unint64_t)objc_msgSend(v35, "length") >> 2, v8, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v43 = objc_msgSend(v41, "mutableCopy");
        if (!v43)
        {
          v56 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
            v82 = 2114;
            *(_QWORD *)v83 = v42;
            _os_log_error_impl(&dword_2117D4000, v56, OS_LOG_TYPE_ERROR, "%s Failed to allocate mapped scores for %{public}@", buf, 0x16u);
          }
          goto LABEL_42;
        }
        if (v16 <= v18)
        {
          v57 = v73;
        }
        else
        {
          if (v4)
          {
            v44 = v4[2](v4, v42);
            objc_msgSend(v72, "addObject:", v43);
            if ((v44 & 1) != 0)
            {
LABEL_42:

              goto LABEL_43;
            }
            v45 = (void *)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              v46 = v16 - 1;
              v47 = self->_voiceProfile;
              v48 = v45;
              -[SSRVoiceProfile profileID](v47, "profileID");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
              v82 = 1026;
              *(_DWORD *)v83 = v46;
              v8 = v71;
              *(_WORD *)&v83[4] = 2114;
              *(_QWORD *)&v83[6] = v49;
              _os_log_impl(&dword_2117D4000, v48, OS_LOG_TYPE_DEFAULT, "%s Adding vector %{public}u for deletion from profile %{public}@", buf, 0x1Cu);

            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v34);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObject:", v50);
LABEL_36:

            goto LABEL_42;
          }
          v57 = v72;
        }
        objc_msgSend(v57, "addObject:", v43);
        goto LABEL_42;
      }
      v54 = (void *)*MEMORY[0x24BE284B8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
LABEL_43:

        goto LABEL_44;
      }
      v55 = self->_voiceProfile;
      v43 = v54;
      -[SSRVoiceProfile profileID](v55, "profileID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      v82 = 1026;
      *(_DWORD *)v83 = v16 - 1;
      v8 = v71;
      *(_WORD *)&v83[4] = 2114;
      *(_QWORD *)&v83[6] = v50;
      _os_log_error_impl(&dword_2117D4000, v43, OS_LOG_TYPE_ERROR, "%s Failed to get scores for vectorIdx %{public}u of profile %{public}@", buf, 0x1Cu);
      goto LABEL_36;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v51 = self->_voiceProfile;
      v52 = v36;
      -[SSRVoiceProfile profileID](v51, "profileID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
      v82 = 1024;
      *(_DWORD *)v83 = v16 - 1;
      v8 = v71;
      *(_WORD *)&v83[4] = 2114;
      *(_QWORD *)&v83[6] = v53;
      _os_log_error_impl(&dword_2117D4000, v52, OS_LOG_TYPE_ERROR, "%s Failed to %u vector from profile %{public}@", buf, 0x1Cu);

    }
LABEL_44:

    v16 = v34;
  }
  while ((unint64_t)(v34 + 1) > 1);
  v74 = v4;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v14 = v70;
  v58 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v76 != v60)
          objc_enumerationMutation(v14);
        v62 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v63 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v64 = v14;
          v65 = self->_voiceProfile;
          v66 = v63;
          -[SSRVoiceProfile profileID](v65, "profileID");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v81 = "-[SSRVoiceProfileRetrainerPSRExclave purgeConfusionInformationWithPolicy:]";
          v82 = 2114;
          *(_QWORD *)v83 = v62;
          *(_WORD *)&v83[8] = 2114;
          *(_QWORD *)&v83[10] = v67;
          _os_log_impl(&dword_2117D4000, v66, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}@ from profile %{public}@", buf, 0x20u);

          v14 = v64;
        }
        -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_psrScorer, "deleteVectorAtIndex:", objc_msgSend(v62, "intValue"));
      }
      v59 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    }
    while (v59);
  }

  v29 = v72;
  -[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:forProfile:forConfigVersion:](self, "_logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:forProfile:forConfigVersion:", v73, v72, objc_msgSend(v14, "count"), self->_voiceProfile, self->_configVersion);

  v15 = 0;
  v4 = v74;
  v7 = v69;
  v8 = v71;
LABEL_55:

LABEL_56:
  return v15;
}

- (void)_logSpeakerConfusionWithExplicitScores:(id)a3 withImplicitScores:(id)a4 withPurgeUtterances:(unint64_t)a5 forProfile:(id)a6 forConfigVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  os_log_t *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[5];
  _QWORD v61[5];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (__CFString *)a7;
  if (v12 && objc_msgSend(v12, "count"))
  {
    objc_msgSend(v14, "profileID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("spIdKnownUserPSRScores"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v18;
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    if ((objc_msgSend(v20, "containsObject:", v16) & 1) != 0)
    {
      objc_msgSend(v20, "removeObject:", v16);
      v53 = v16;
      objc_msgSend(v20, "insertObject:atIndex:", v16, 0);
      -[SSRVoiceProfileRetrainerPSRExclave _composeSpeakerConfusionWithScores:forProfiles:](self, "_composeSpeakerConfusionWithScores:forProfiles:", v12, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      -[SSRVoiceProfileRetrainerPSRExclave _composeSpeakerConfusionWithScores:forProfiles:](self, "_composeSpeakerConfusionWithScores:forProfiles:", v13, v20);
      v22 = objc_claimAutoreleasedReturnValue();
      v60[0] = CFSTR("locale");
      objc_msgSend(v14, "locale");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = CFSTR("unknown");
      if (v15)
        v25 = v15;
      v61[0] = v23;
      v61[1] = v25;
      v60[1] = CFSTR("asset");
      v60[2] = CFSTR("explicitUtteranceConfusion");
      v54 = (void *)v22;
      v55 = (void *)v21;
      v61[2] = v21;
      v61[3] = v22;
      v60[3] = CFSTR("implicitUtteranceConfusion");
      v60[4] = CFSTR("purgedUtteranceCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v61[4] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 5);
      v27 = objc_claimAutoreleasedReturnValue();

      v28 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUt"
              "terances:forProfile:forConfigVersion:]";
        v64 = 2112;
        v65 = v27;
        _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, "%s Log %@", buf, 0x16u);
      }
      v52 = (void *)v27;
      objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "fileLoggingIsEnabled");

      v16 = v53;
      if (v30)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Explicit Utterance Confusion Matrix for User - %@ is"), v53);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusion:forProfileArray:withPrependString:](self, "_logSpeakerConfusion:forProfileArray:withPrependString:", v55, v20, v31);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Implicit Utterance Confusion Matrix for User - %@ is"), v53);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusion:forProfileArray:withPrependString:](self, "_logSpeakerConfusion:forProfileArray:withPrependString:", v54, v20, v32);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v58[0] = CFSTR("explicitUtteranceConfusion");
        v58[1] = CFSTR("implicitUtteranceConfusion");
        v59[0] = v12;
        v59[1] = v13;
        v58[2] = CFSTR("purgedUtteranceCount");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
        v34 = objc_claimAutoreleasedReturnValue();

        v57 = 0;
        v47 = (void *)v34;
        objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v34, 3, &v57);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v57;
        if (v50)
        {
          v35 = (os_log_t *)MEMORY[0x24BE284B8];
          v36 = (void *)*MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            v37 = v36;
            objc_msgSend(v50, "localizedDescription");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPur"
                  "geUtterances:forProfile:forConfigVersion:]";
            v64 = 2114;
            v65 = (uint64_t)v38;
            _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get json object with error %{public}@", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CS-VoiceId-UserConfusion-%@.json"), v53);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "voiceTriggerAudioLogDirectory");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringByAppendingPathComponent:", v41);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v44);
          objc_msgSend(v51, "writeToFile:atomically:", v44, 0);

          v35 = (os_log_t *)MEMORY[0x24BE284B8];
        }
        v46 = *v35;
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurge"
                "Utterances:forProfile:forConfigVersion:]";
          v64 = 2114;
          v65 = (uint64_t)v49;
          _os_log_impl(&dword_2117D4000, v46, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
          v46 = *v35;
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurge"
                "Utterances:forProfile:forConfigVersion:]";
          v64 = 2114;
          v65 = (uint64_t)v48;
          _os_log_impl(&dword_2117D4000, v46, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }

      }
    }
    else
    {
      v40 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUt"
              "terances:forProfile:forConfigVersion:]";
        v64 = 2114;
        v65 = (uint64_t)v16;
        v66 = 2114;
        v67 = v20;
        _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s profile %{public}@ is not present in %{public}@ - Bailing out", buf, 0x20u);
      }
    }

  }
  else
  {
    v39 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "-[SSRVoiceProfileRetrainerPSRExclave _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtte"
            "rances:forProfile:forConfigVersion:]";
      _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s explicit scores are nil - Bailing out", buf, 0xCu);
    }
  }

}

- (id)_composeSpeakerConfusionWithScores:(id)a3 forProfiles:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21 = a4;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("spIdKnownUserPSRScores"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v13 = v21;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v18);

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v15);
        }

        objc_msgSend(v22, "addObject:", v11);
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  return v22;
}

- (id)_logSpeakerConfusion:(id)a3 forProfileArray:(id)a4 withPrependString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1341;
  v23 = __Block_byref_object_dispose__1342;
  v24 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v10 = (void *)MEMORY[0x212BE17E4]();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__SSRVoiceProfileRetrainerPSRExclave__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke;
  v15[3] = &unk_24CC84F90;
  v18 = &v19;
  v11 = v9;
  v16 = v11;
  v12 = v8;
  v17 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);
  if (objc_msgSend((id)v20[5], "length"))
    objc_msgSend((id)v20[5], "appendFormat:", CFSTR("----------------------------------------------------------------------------------------------\n\n"));

  objc_autoreleasePoolPop(v10);
  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
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
  NSUInteger v20;
  unint64_t currUttLengthInMs;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, uint64_t, int, void *);
  void *v30;
  double v31;
  SSRVoiceProfileRetrainerPSRExclave *v32;
  uint64_t *v33;
  _QWORD *v34;
  _BYTE *v35;
  char v36[40];
  _QWORD v37[4];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  double v47;
  uint8_t v48[4];
  const char *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  void *v53;
  _BYTE buf[24];
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  self->_bestTriggerScore = -1.0;
  nd_reset();
  self->_currUttLengthInMs = 0xFFFFFFFFLL;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__1341;
  v42 = __Block_byref_object_dispose__1342;
  v43 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3810000000;
  v55 = &unk_2118676B3;
  v56 = 0;
  v57 = 0;
  v58 = 0;
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __56__SSRVoiceProfileRetrainerPSRExclave__processAudioFile___block_invoke;
  v30 = &unk_24CC85828;
  v7 = COERCE_DOUBLE(v4);
  v31 = v7;
  v32 = self;
  v33 = &v38;
  v34 = v37;
  v35 = buf;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", *(_QWORD *)&v7, v36, 640, &v27);
  v8 = (void *)v39[5];
  if (v8)
  {
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315650;
      v49 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
      v50 = 2114;
      v51 = v7;
      v52 = 2114;
      v53 = v8;
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v48, 0x20u);
      v8 = (void *)v39[5];
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
      *(_DWORD *)v48 = 136315394;
      v49 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
      v50 = 2050;
      v51 = v15;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Found last detection results, trigger score = %{public}f", v48, 0x16u);
    }
    v17 = nd_getsupervector();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)v17, 4 * *(unsigned int *)(v17 + 8));
      v18 = (NSData *)objc_claimAutoreleasedReturnValue();
      speakerVector = self->_speakerVector;
      self->_speakerVector = v18;

      v20 = -[NSData length](self->_speakerVector, "length");
      v10 = 0;
      currUttLengthInMs = self->_currUttLengthInMs;
      self->_speakerVectorSize = v20 >> 2;
      self->_processedAudioDurationMs = currUttLengthInMs;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("speakerVector is nil! for processedAUdioDurationMs: %lu , _currUttLengthInMs: %lu"), self->_processedAudioDurationMs, self->_currUttLengthInMs, v27, v28, v29, v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BDD0FC8];
      v45 = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 743, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v25;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Too little audio %dms in %@ - Bailing out"), self->_currUttLengthInMs, *(_QWORD *)&v7, v27, v28, v29, v30);
    v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315394;
      v49 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]";
      v50 = 2114;
      v51 = v11;
      _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s %{public}@", v48, 0x16u);
    }
    v13 = (void *)MEMORY[0x24BDD1540];
    v46 = *MEMORY[0x24BDD0FC8];
    v47 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 751, v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v38, 8);

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
  v30[0] = CFSTR("spIdKnownUserPSRScores");
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

- (SSRSpeakerRecognitionScorer)psrScorer
{
  return self->_psrScorer;
}

- (void)setPsrScorer:(id)a3
{
  objc_storeStrong((id *)&self->_psrScorer, a3);
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

- (NSURL)psrModelFilePath
{
  return self->_psrModelFilePath;
}

- (void)setPsrModelFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_psrModelFilePath, a3);
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
  objc_storeStrong((id *)&self->_psrModelFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_psrScorer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

void __56__SSRVoiceProfileRetrainerPSRExclave__processAudioFile___block_invoke(_QWORD *a1, uint64_t a2, int a3, void *a4)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  float v11;
  float v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  unint64_t v20;
  id v21;
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
      v24 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]_block_invoke";
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
      v24 = "-[SSRVoiceProfileRetrainerPSRExclave _processAudioFile:]_block_invoke";
      v25 = 2050;
      v26 = v15;
      v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %{public}lu, calling endAudio: %@", buf, 0x20u);
    }
    nd_endwavedata();
    v16 = nd_getresults();
    if (v16)
    {
      v17 = *(_QWORD *)(a1[8] + 8);
      v18 = *(_OWORD *)v16;
      *(_QWORD *)(v17 + 48) = *(_QWORD *)(v16 + 16);
      *(_OWORD *)(v17 + 32) = v18;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += v20 / v22;
    v21 = objc_retainAutorelease(v19);
    objc_msgSend(v21, "bytes");
    nd_wavedata();

  }
}

void __93__SSRVoiceProfileRetrainerPSRExclave__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  float v12;
  id v13;

  v13 = a2;
  if (!a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("\n\n%@\n----------------------------------------------------------------------------------------------\n"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("              "));
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v5 = 0;
      do
      {
        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@  "), v7);

        ++v5;
      }
      while (v5 < objc_msgSend(*(id *)(a1 + 40), "count"));
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("\n"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Utterance%02d   "), a3);
  if (objc_msgSend(v13, "count"))
  {
    v8 = 0;
    do
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v8)
        v10 = CFSTR("%39.2f");
      else
        v10 = CFSTR("%16.2f");
      objc_msgSend(v13, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      objc_msgSend(v9, "appendFormat:", v10, v12);

      ++v8;
    }
    while (v8 < objc_msgSend(v13, "count"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("\n"));

}

void __81__SSRVoiceProfileRetrainerPSRExclave_initWithVoiceRetrainingContext_secureAsset___block_invoke(uint64_t a1, void *a2)
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
        v8 = "-[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]_block_invoke";
        v9 = 2081;
        v10 = objc_msgSend(v4, "nameString");
        _os_log_debug_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEBUG, "%s Failed to add resource %{private}s", (uint8_t *)&v7, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

@end
