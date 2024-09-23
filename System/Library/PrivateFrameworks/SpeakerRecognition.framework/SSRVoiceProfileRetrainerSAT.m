@implementation SSRVoiceProfileRetrainerSAT

- (SSRVoiceProfileRetrainerSAT)initWithVoiceRetrainingContext:(id)a3
{
  id v4;
  SSRVoiceProfileRetrainerSAT *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SSRSpeakerRecognitionScorer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SSRSpeakerRecognitionScorer *satScorer;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  uint64_t v23;
  NSURL *configFilePath;
  uint64_t v25;
  NSURL *resourceFilePath;
  uint64_t v27;
  NSURL *satModelFilePath;
  uint64_t v29;
  SSRVoiceProfile *voiceProfile;
  uint64_t v31;
  NSDictionary *comparativeModels;
  SSRVoiceProfileRetrainerSAT *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v37;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SSRVoiceProfileRetrainerSAT;
  v5 = -[SSRVoiceProfileRetrainerSAT init](&v39, sel_init);
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "modelsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v34 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v33 = 0;
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    v41 = "-[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]";
    v35 = "%s SATModel Retraining context is nil! - Skipping";
LABEL_16:
    _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "forceRetrain"))
  {
    v9 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v37 = v9;
      objc_msgSend(v8, "voiceProfileModelFilePath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v41 = "-[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]";
      v42 = 2114;
      v43 = v38;
      _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, "%s Deleting model file at %{public}@", buf, 0x16u);

    }
    objc_msgSend(v8, "voiceProfileModelFilePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v11);

  }
  v13 = [SSRSpeakerRecognitionScorer alloc];
  objc_msgSend(v4, "voiceProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceProfileModelFilePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configFilePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceFilePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](v13, "initWithProfileID:withModelFile:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", v15, v16, v17, v18, 0, 1);
  satScorer = v5->_satScorer;
  v5->_satScorer = (SSRSpeakerRecognitionScorer *)v19;

  if (!v5->_satScorer)
  {
    v34 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136315138;
    v41 = "-[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]";
    v35 = "%s ERR: Cannot create SAT Scorer";
    goto LABEL_16;
  }
  v21 = dispatch_queue_create("com.apple.corespeech.speakerretrain.satq", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v21;

  objc_msgSend(v8, "configFilePath");
  v23 = objc_claimAutoreleasedReturnValue();
  configFilePath = v5->_configFilePath;
  v5->_configFilePath = (NSURL *)v23;

  objc_msgSend(v4, "resourceFilePath");
  v25 = objc_claimAutoreleasedReturnValue();
  resourceFilePath = v5->_resourceFilePath;
  v5->_resourceFilePath = (NSURL *)v25;

  objc_msgSend(v8, "voiceProfileModelFilePath");
  v27 = objc_claimAutoreleasedReturnValue();
  satModelFilePath = v5->_satModelFilePath;
  v5->_satModelFilePath = (NSURL *)v27;

  objc_msgSend(v4, "voiceProfile");
  v29 = objc_claimAutoreleasedReturnValue();
  voiceProfile = v5->_voiceProfile;
  v5->_voiceProfile = (SSRVoiceProfile *)v29;

  objc_msgSend(v8, "compareModelFilePaths");
  v31 = objc_claimAutoreleasedReturnValue();
  comparativeModels = v5->_comparativeModels;
  v5->_comparativeModels = (NSDictionary *)v31;

  v5->_maximumSpeakerVectors = objc_msgSend(v4, "maxAllowedSpeakerVectors");
  v5->_spIdType = objc_msgSend(v4, "spIdType");

LABEL_9:
  v33 = v5;
LABEL_14:

  return v33;
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
    v9 = "-[SSRVoiceProfileRetrainerSAT resetModelForRetraining]";
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)needsRetrainingWithAudioFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  NSURL *satModelFilePath;
  unint64_t maximumSpeakerVectors;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  unint64_t spIdType;
  char v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfile voiceProfileBasePath](self->_voiceProfile, "voiceProfileBasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  if ((objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v33) & 1) == 0 && !v33)
  {
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
      v36 = 2114;
      v37 = (unint64_t)v6;
      v38 = 1026;
      LODWORD(v39) = 0;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Cannot find SAT Audio dir at %{public}@: isDir: %{public}d - Bailing out", buf, 0x1Cu);
    }
    goto LABEL_5;
  }
  if (!-[SSRSpeakerRecognitionScorer satModelAvailable](self->_satScorer, "satModelAvailable"))
  {
    v18 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
    v19 = "%s SATNeedsRetraining(YES): satModelAvailable is not available!!";
    v20 = v18;
    v21 = 12;
LABEL_15:
    _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_16;
  }
  -[NSURL path](self->_satModelFilePath, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v9, 0);

  if ((v10 & 1) == 0)
  {
    v22 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    satModelFilePath = self->_satModelFilePath;
    *(_DWORD *)buf = 136315394;
    v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
    v36 = 2114;
    v37 = (unint64_t)satModelFilePath;
    v19 = "%s SATNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    v20 = v22;
    v21 = 22;
    goto LABEL_15;
  }
  v11 = objc_msgSend(v4, "count");
  v12 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
  if ((CSIsCommunalDevice() & 1) == 0)
  {
    maximumSpeakerVectors = self->_maximumSpeakerVectors;
    if (v11 > maximumSpeakerVectors || v12 == v11)
    {
      if (v11 <= maximumSpeakerVectors || v12 == maximumSpeakerVectors)
        goto LABEL_9;
      v31 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        spIdType = self->_spIdType;
        v28 = v31;
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", spIdType);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
        v36 = 2050;
        v37 = v11;
        v38 = 2050;
        v39 = v12;
        v40 = 2050;
        v41 = maximumSpeakerVectors;
        v42 = 2114;
        v43 = v29;
        v30 = "%s SATNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
        goto LABEL_26;
      }
    }
    else
    {
      v26 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_spIdType;
        v28 = v26;
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
        v36 = 2050;
        v37 = v11;
        v38 = 2050;
        v39 = v12;
        v40 = 2050;
        v41 = maximumSpeakerVectors;
        v42 = 2114;
        v43 = v29;
        v30 = "%s SATNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)";
LABEL_26:
        _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x34u);

      }
    }
LABEL_16:
    v8 = 1;
    goto LABEL_17;
  }
LABEL_9:
  v13 = (void *)*MEMORY[0x24BE284B8];
  v8 = 0;
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    goto LABEL_17;
  v14 = self->_maximumSpeakerVectors;
  v15 = self->_spIdType;
  v16 = v13;
  +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136316162;
  v35 = "-[SSRVoiceProfileRetrainerSAT needsRetrainingWithAudioFiles:]";
  v36 = 2050;
  v37 = v11;
  v38 = 2050;
  v39 = v12;
  v40 = 2050;
  v41 = v14;
  v42 = 2114;
  v43 = v17;
  _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s SATNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", buf, 0x34u);

LABEL_5:
  v8 = 0;
LABEL_17:

  return v8;
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
    v8 = "-[SSRVoiceProfileRetrainerSAT implicitTrainingRequired]";
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
      v13 = "-[SSRVoiceProfileRetrainerSAT purgeLastSpeakerEmbedding]";
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
    v13 = "-[SSRVoiceProfileRetrainerSAT purgeLastSpeakerEmbedding]";
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
  id v11;
  NSDictionary *comparativeModels;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  SSRTriggerPhraseDetectorNDAPI *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  SSRTriggerPhraseDetectorNDAPI *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  SSRTriggerPhraseDetectorNDAPI *v43;
  uint64_t v44;
  void *v45;
  SSRTriggerPhraseDetectorNDAPI *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  SSRTriggerPhraseDetectorNDAPI *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  SSRTriggerPhraseDetectorNDAPI *v70;
  void *v71;
  void *v72;
  NSObject *log;
  void (**v74)(id, void *, void *);
  void *v75;
  id v76;
  SSRTriggerPhraseDetectorNDAPI *v77;
  id obj;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  SSRTriggerPhraseDetectorNDAPI *v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  SSRTriggerPhraseDetectorNDAPI *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  unint64_t v98;
  __int16 v99;
  SSRTriggerPhraseDetectorNDAPI *v100;
  const __CFString *v101;
  SSRTriggerPhraseDetectorNDAPI *v102;
  uint64_t v103;
  SSRTriggerPhraseDetectorNDAPI *v104;
  _BYTE v105[128];
  const __CFString *v106;
  SSRTriggerPhraseDetectorNDAPI *v107;
  uint64_t v108;
  _QWORD v109[3];

  v109[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, void *))a4;
  v10 = a5;
  v68 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File Array is nil"));
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v16;
    if (v10)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v108 = *MEMORY[0x24BDD0FC8];
      v109[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, &v108, 1);
      v77 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 701);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v18, 0, 0);
      goto LABEL_47;
    }
    goto LABEL_49;
  }
  comparativeModels = self->_comparativeModels;
  if (comparativeModels)
  {
    +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", comparativeModels, self->_configFilePath, self->_resourceFilePath, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || !objc_msgSend(v13, "count"))
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = self->_comparativeModels;
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Cannot create comparative scorers from %@ on profile %@"), v20, v21);
      v77 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();

      v22 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
        v89 = 2114;
        v90 = v77;
        _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        if (!v10)
          goto LABEL_48;
      }
      else if (!v10)
      {
        goto LABEL_48;
      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v106 = CFSTR("reason");
      v107 = v77;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 755, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v24, 0, 0);

      goto LABEL_47;
    }
    v66 = v10;
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v65 = v14;
    objc_msgSend(v15, "addObjectsFromArray:", v14);
  }
  else
  {
    v66 = v10;
    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v65 = 0;
  }
  v76 = v15;
  objc_msgSend(v15, "addObject:", self->_satScorer);
  v25 = [SSRTriggerPhraseDetectorNDAPI alloc];
  -[NSURL path](self->_configFilePath, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_resourceFilePath, "path");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = -[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:](v25, "initWithConfigPath:resourcePath:phId:", v26, v27, 0);

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v67 = v8;
  obj = v8;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v105, 16);
  if (!v28)
    goto LABEL_44;
  v29 = v28;
  v79 = *MEMORY[0x24BDD0FC8];
  v80 = *(_QWORD *)v82;
  v74 = v9;
  v75 = v11;
  do
  {
    v30 = 0;
    v69 = v29;
    do
    {
      if (*(_QWORD *)v82 != v80)
        objc_enumerationMutation(obj);
      v31 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v30);
      v32 = (void *)MEMORY[0x212BE17E4]();
      objc_msgSend(v31, "pathExtension");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("wav"));

      if ((v34 & 1) != 0)
      {
        -[SSRTriggerPhraseDetectorNDAPI reset](v77, "reset");
        -[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:](self, "_processAudioFile:withSATProcessor:", v31, v77);
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          objc_msgSend(v31, "path");
          v37 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v36, v37);
          goto LABEL_26;
        }
        -[SSRVoiceProfileRetrainerSAT _processSuperVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSuperVector:withSize:withScorers:processedAudioDurationMs:", self->_superVector, self->_superVectorSize, v76, self->_processedAudioDurationMs);
        v37 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
        if (!v37)
        {
          v53 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v31, "lastPathComponent");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", CFSTR("Failed to get scorecard for utterance %@ on profile %@"), v54, v55);
          v43 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();

          v56 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
            v89 = 2114;
            v90 = v43;
            _os_log_error_impl(&dword_2117D4000, v56, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
          }
          v57 = (void *)MEMORY[0x24BDD1540];
          v101 = CFSTR("reason");
          v102 = v43;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v58);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "path");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v75;
          objc_msgSend(v75, "setObject:forKey:", v36, v59);

          v9 = v74;
          goto LABEL_25;
        }
        if (!v9 || (v9[2](v9, v31, v37), (v44 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          -[NSURL URLByDeletingLastPathComponent](self->_satModelFilePath, "URLByDeletingLastPathComponent");
          v43 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)*MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            log = v45;
            objc_msgSend(v31, "lastPathComponent");
            v70 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
            -[NSURL lastPathComponent](self->_satModelFilePath, "lastPathComponent");
            v46 = v43;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSRTriggerPhraseDetectorNDAPI lastPathComponent](v46, "lastPathComponent");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[SSRTriggerPhraseDetectorNDAPI URLByDeletingLastPathComponent](v46, "URLByDeletingLastPathComponent");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "lastPathComponent");
            v48 = objc_claimAutoreleasedReturnValue();
            v49 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
            *(_DWORD *)buf = 136316674;
            v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
            v89 = 2114;
            v90 = v70;
            v91 = 2114;
            v92 = v47;
            v93 = 2114;
            v94 = v71;
            v95 = 2114;
            v96 = v48;
            v50 = (void *)v48;
            v97 = 2048;
            v98 = v49;
            v99 = 2114;
            v100 = v37;
            _os_log_impl(&dword_2117D4000, log, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %lu vector with scoreCard %{public}@", buf, 0x48u);

            v9 = v74;
            v43 = v46;
            v29 = v69;

          }
          v51 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount");
          -[SSRSpeakerRecognitionScorer updateSAT](self->_satScorer, "updateSAT");
          if (-[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount") - v51 == 1)
          {
            objc_msgSend(v31, "path");
            v52 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKey:", v37, v52);
            v36 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Reached max (%lu) of training utterances, Skipped SAT model update"), -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_satScorer, "getSATVectorCount"));
            v52 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
            v60 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
              v89 = 2114;
              v90 = v52;
              _os_log_error_impl(&dword_2117D4000, v60, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            }
            v61 = (void *)MEMORY[0x24BDD1540];
            v85 = v79;
            v86 = v52;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 739, v62);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "path");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setObject:forKey:", v36, v63);

            v9 = v74;
          }

          v11 = v75;
          goto LABEL_25;
        }
        v36 = (void *)v44;
      }
      else
      {
        v38 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v31, "path");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("Invalid file format %@ "), v39);
        v37 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();

        v40 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v88 = "-[SSRVoiceProfileRetrainerSAT addUtterances:withPolicy:withCompletion:]";
          v89 = 2114;
          v90 = v37;
          _os_log_error_impl(&dword_2117D4000, v40, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        }
        v41 = (void *)MEMORY[0x24BDD1540];
        v103 = v79;
        v104 = v37;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 729, v42);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v31, "path");
      v43 = (SSRTriggerPhraseDetectorNDAPI *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v36, v43);
LABEL_25:

LABEL_26:
      objc_autoreleasePoolPop(v32);
      ++v30;
    }
    while (v29 != v30);
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v105, 16);
    v29 = v64;
  }
  while (v64);
LABEL_44:

  v10 = v66;
  if (v66)
    (*((void (**)(id, _QWORD, id, id))v66 + 2))(v66, 0, v68, v11);
  v8 = v67;
  v14 = v65;
  v18 = v76;
LABEL_47:

LABEL_48:
LABEL_49:

}

- (id)_processAudioFile:(id)a3 withSATProcessor:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  double v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSData *v31;
  NSData *superVector;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, int, void *);
  void *v41;
  id v42;
  double v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD *v47;
  _BYTE *v48;
  char v49[40];
  _QWORD v50[4];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  double v66;
  uint8_t v67[4];
  const char *v68;
  __int16 v69;
  double v70;
  __int16 v71;
  void *v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE284B8];
  v9 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v74 = __Block_byref_object_copy__1177;
  v75 = __Block_byref_object_dispose__1178;
  v76 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  self->_bestTriggerScore = -1.0;
  v60 = 0xFFFFFFFFLL;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1177;
  v55 = __Block_byref_object_dispose__1178;
  v56 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __66__SSRVoiceProfileRetrainerSAT__processAudioFile_withSATProcessor___block_invoke;
  v41 = &unk_24CC84B48;
  v42 = 0;
  v10 = COERCE_DOUBLE(v6);
  v43 = v10;
  v45 = &v51;
  v46 = &v57;
  v47 = v50;
  v11 = v7;
  v44 = v11;
  v48 = buf;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", *(_QWORD *)&v10, v49, 640, &v38);
  v12 = (void *)v52[5];
  if (v12)
  {
    v13 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v67 = 136315650;
      v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
      v69 = 2114;
      v70 = v10;
      v71 = 2114;
      v72 = v12;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v67, 0x20u);
      v12 = (void *)v52[5];
    }
    v14 = v12;
  }
  else if ((unint64_t)v58[3] > 0xC7)
  {
    v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v19)
    {
      objc_msgSend(v19, "bestScore");
      v21 = v20;
      self->_bestTriggerScore = v20;
      v22 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
        v69 = 2050;
        v70 = v21;
        _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, "%s Found last detection results, trigger score = %{public}f", v67, 0x16u);
      }
      objc_msgSend(v11, "getSuperVectorWithEndPoint:", objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "bestEnd"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 && objc_msgSend(v23, "length"))
      {
        v25 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get valid supervector for %@ - Skipping..."), *(_QWORD *)&v10);
        v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v27 = *v8;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v67 = 136315394;
          v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
          v69 = 2114;
          v70 = v26;
          _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s %{public}@", v67, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "submitVoiceIdIssueReport:", *MEMORY[0x24BE284F0]);

        v29 = (void *)MEMORY[0x24BDD1540];
        v61 = *MEMORY[0x24BDD0FC8];
        v62 = v26;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 743, v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v31 = (NSData *)objc_msgSend(v24, "copy");
      superVector = self->_superVector;
      self->_superVector = v31;

      self->_superVectorSize = objc_msgSend(v24, "length") >> 2;
      self->_processedAudioDurationMs = v58[3];
      v14 = v25;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ does not seem to contain trigger phrase - no triggerData"), *(_QWORD *)&v10);
      v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v34 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v67 = 136315394;
        v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
        v69 = 2114;
        v70 = v33;
        _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s %{public}@", v67, 0x16u);
      }
      v35 = (void *)MEMORY[0x24BDD1540];
      v63 = *MEMORY[0x24BDD0FC8];
      v64 = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 742, v36);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Too little audio %dms in %@ - Bailing out"), v58[3], *(_QWORD *)&v10, v38, v39, v40, v41, v42, *(_QWORD *)&v43);
    v15 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v67 = 136315394;
      v68 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]";
      v69 = 2114;
      v70 = v15;
      _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", v67, 0x16u);
    }
    v17 = (void *)MEMORY[0x24BDD1540];
    v65 = *MEMORY[0x24BDD0FC8];
    v66 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 751, v18);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)_processSuperVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6
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
        objc_msgSend(v16, "analyzeSuperVector:withDimensions:withThresholdType:", v8, a4, 0, v24);
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

- (NSURL)satModelFilePath
{
  return self->_satModelFilePath;
}

- (void)setSatModelFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_satModelFilePath, a3);
}

- (unint64_t)spIdType
{
  return self->_spIdType;
}

- (void)setSpIdType:(unint64_t)a3
{
  self->_spIdType = a3;
}

- (NSDictionary)comparativeModels
{
  return self->_comparativeModels;
}

- (void)setComparativeModels:(id)a3
{
  objc_storeStrong((id *)&self->_comparativeModels, a3);
}

- (NSData)superVector
{
  return self->_superVector;
}

- (void)setSuperVector:(id)a3
{
  objc_storeStrong((id *)&self->_superVector, a3);
}

- (unint64_t)superVectorSize
{
  return self->_superVectorSize;
}

- (void)setSuperVectorSize:(unint64_t)a3
{
  self->_superVectorSize = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_superVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_satModelFilePath, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_satScorer, 0);
}

void __66__SSRVoiceProfileRetrainerSAT__processAudioFile_withSATProcessor___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
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
  void *v18;
  unsigned int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (*(_QWORD *)(a1 + 32))
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v21 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]_block_invoke";
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  }
  else if (a3)
  {
    v11 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (unint64_t)(float)((float)(v11 / v12) * 1000.0);
    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v21 = "-[SSRVoiceProfileRetrainerSAT _processAudioFile:withSATProcessor:]_block_invoke";
      v22 = 2048;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %lu, calling endAudio: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v17 / v19;
    objc_msgSend(*(id *)(a1 + 48), "analyzeWavData:numSamples:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v18);

  }
}

@end
