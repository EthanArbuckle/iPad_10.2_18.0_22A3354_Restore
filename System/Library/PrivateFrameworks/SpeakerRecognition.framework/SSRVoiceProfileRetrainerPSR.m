@implementation SSRVoiceProfileRetrainerPSR

- (SSRVoiceProfileRetrainerPSR)initWithVoiceRetrainingContext:(id)a3
{
  id v4;
  SSRVoiceProfileRetrainerPSR *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  SSRSpeakerRecognitionScorer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SSRSpeakerRecognitionScorer *psrScorer;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  NSURL *configFilePath;
  uint64_t v26;
  NSURL *resourceFilePath;
  uint64_t v28;
  NSURL *psrModelFilePath;
  uint64_t v30;
  SSRVoiceProfile *voiceProfile;
  uint64_t v32;
  NSDictionary *comparativeModels;
  uint64_t v34;
  NSString *configVersion;
  SSRVoiceProfileRetrainerPSR *v36;
  NSObject *v37;
  const char *v38;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SSRVoiceProfileRetrainerPSR;
  v5 = -[SSRVoiceProfileRetrainerPSR init](&v40, sel_init);
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "modelsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v37 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]";
      v38 = "%s PSRModel Retraining context is nil! - Skipping";
LABEL_14:
      _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 0xCu);
    }
LABEL_15:

    v36 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "forceRetrain"))
  {
    v9 = (id)*MEMORY[0x24BE28360];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "voiceProfileModelFilePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v42 = "-[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]";
      v43 = 2114;
      v44 = v10;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Deleting model file at %{public}@", buf, 0x16u);

    }
    objc_msgSend(v8, "voiceProfileModelFilePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v12);

  }
  v14 = [SSRSpeakerRecognitionScorer alloc];
  objc_msgSend(v4, "voiceProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "voiceProfileModelFilePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configFilePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceFilePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](v14, "initWithProfileID:withModelFile:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", v16, v17, v18, v19, 0, 1);
  psrScorer = v5->_psrScorer;
  v5->_psrScorer = (SSRSpeakerRecognitionScorer *)v20;

  if (!v5->_psrScorer)
  {
    v37 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]";
      v38 = "%s ERR: Cannot create PSR Scorer";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v22 = dispatch_queue_create("com.apple.corespeech.speakerretrain.psrq", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v22;

  objc_msgSend(v8, "configFilePath");
  v24 = objc_claimAutoreleasedReturnValue();
  configFilePath = v5->_configFilePath;
  v5->_configFilePath = (NSURL *)v24;

  objc_msgSend(v4, "resourceFilePath");
  v26 = objc_claimAutoreleasedReturnValue();
  resourceFilePath = v5->_resourceFilePath;
  v5->_resourceFilePath = (NSURL *)v26;

  objc_msgSend(v8, "voiceProfileModelFilePath");
  v28 = objc_claimAutoreleasedReturnValue();
  psrModelFilePath = v5->_psrModelFilePath;
  v5->_psrModelFilePath = (NSURL *)v28;

  objc_msgSend(v4, "voiceProfile");
  v30 = objc_claimAutoreleasedReturnValue();
  voiceProfile = v5->_voiceProfile;
  v5->_voiceProfile = (SSRVoiceProfile *)v30;

  objc_msgSend(v8, "compareModelFilePaths");
  v32 = objc_claimAutoreleasedReturnValue();
  comparativeModels = v5->_comparativeModels;
  v5->_comparativeModels = (NSDictionary *)v32;

  v5->_maximumSpeakerVectors = objc_msgSend(v4, "maxAllowedSpeakerVectors");
  objc_msgSend(v4, "configVersion");
  v34 = objc_claimAutoreleasedReturnValue();
  configVersion = v5->_configVersion;
  v5->_configVersion = (NSString *)v34;

  v5->_spIdType = objc_msgSend(v4, "spIdType");
LABEL_9:
  v36 = v5;
LABEL_16:

  return v36;
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
    v9 = "-[SSRVoiceProfileRetrainerPSR resetModelForRetraining]";
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
  SSRVoiceProfileRetrainerPSR *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SSRVoiceProfileRetrainerPSR dealloc]";
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileRetrainerPSR;
  -[SSRVoiceProfileRetrainerPSR dealloc](&v4, sel_dealloc);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@:%@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)needsRetrainingWithAudioFiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t maximumSpeakerVectors;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  NSURL *psrModelFilePath;
  _BOOL4 v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfile voiceProfileBasePath](self->_voiceProfile, "voiceProfileBasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v32);
  if (v32)
    v8 = 1;
  else
    v8 = v7;
  if ((v8 & 1) == 0)
  {
    v18 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
      v35 = 2114;
      v36 = (unint64_t)v6;
      v37 = 1026;
      LODWORD(v38) = 0;
      _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s ERR: Cannot find SAT Audio dir at %{public}@: isDir: %{public}d - Bailing out", buf, 0x1Cu);
    }
    goto LABEL_14;
  }
  if (!-[SSRSpeakerRecognitionScorer satModelAvailable](self->_psrScorer, "satModelAvailable"))
  {
    v20 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 136315138;
    v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
    v21 = "%s PSRNeedsRetraining(YES): satModelAvailable is not available!";
    v22 = v20;
    v23 = 12;
LABEL_19:
    _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_20;
  }
  -[NSURL path](self->_psrModelFilePath, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v9, 0);

  if ((v10 & 1) == 0)
  {
    v24 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    psrModelFilePath = self->_psrModelFilePath;
    *(_DWORD *)buf = 136315394;
    v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
    v35 = 2114;
    v36 = (unint64_t)psrModelFilePath;
    v21 = "%s PSRNeedsRetraining(YES): phsSATFile doesnt exist at: %{public}@.";
    v22 = v24;
    v23 = 22;
    goto LABEL_19;
  }
  v11 = objc_msgSend(v4, "count");
  v12 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
  v13 = v12;
  maximumSpeakerVectors = self->_maximumSpeakerVectors;
  if (v11 <= maximumSpeakerVectors && v12 != v11)
  {
    v15 = (id)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_maximumSpeakerVectors;
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", self->_spIdType);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
      v35 = 2050;
      v36 = v11;
      v37 = 2050;
      v38 = v13;
      v39 = 2050;
      v40 = v16;
      v41 = 2114;
      v42 = v17;
      _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(YES): SpeakerVectors MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)", buf, 0x34u);

    }
LABEL_11:

LABEL_20:
    v19 = 1;
    goto LABEL_21;
  }
  v15 = (id)*MEMORY[0x24BE284B8];
  v27 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v11 > maximumSpeakerVectors && v13 != maximumSpeakerVectors)
  {
    if (v27)
    {
      v28 = self->_maximumSpeakerVectors;
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", self->_spIdType);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
      v35 = 2050;
      v36 = v11;
      v37 = 2050;
      v38 = v13;
      v39 = 2050;
      v40 = v28;
      v41 = 2114;
      v42 = v29;
      _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(YES): SpeakerVectors Max MISMATCH! (%{public}ld, %{public}ld, %{public}ld, %{public}@)", buf, 0x34u);

    }
    goto LABEL_11;
  }
  if (v27)
  {
    v30 = self->_maximumSpeakerVectors;
    +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", self->_spIdType);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v34 = "-[SSRVoiceProfileRetrainerPSR needsRetrainingWithAudioFiles:]";
    v35 = 2050;
    v36 = v11;
    v37 = 2050;
    v38 = v13;
    v39 = 2050;
    v40 = v30;
    v41 = 2114;
    v42 = v31;
    _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s PSRNeedsRetraining(NO): audioFiles:%{public}ld, vectors:%{public}ld, max:%{public}ld, modelType: %{public}@", buf, 0x34u);

  }
LABEL_14:
  v19 = 0;
LABEL_21:

  return v19;
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
    v8 = "-[SSRVoiceProfileRetrainerPSR implicitTrainingRequired]";
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
  void *v9;
  void *v10;
  float v11;
  NSDictionary *comparativeModels;
  void *v13;
  NSDictionary *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *context;
  void *v53;
  id v54;
  id v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void (**v60)(id, void *, void *);
  void *v61;
  id obj;
  uint64_t v63;
  id v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  void *v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  unint64_t v83;
  __int16 v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _BYTE v90[128];
  const __CFString *v91;
  id v92[5];
  uint64_t v93;
  _QWORD v94[3];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  v60 = (void (**)(id, void *, void *))a4;
  v54 = a5;
  context = (void *)MEMORY[0x212BE17E4]();
  v56 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v64 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v55 && objc_msgSend(v55, "count"))
  {
    v8 = objc_alloc(MEMORY[0x24BE2E6E8]);
    -[SSRSpeakerRecognitionScorer psrConfigFilePath](self->_psrScorer, "psrConfigFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRSpeakerRecognitionScorer psrConfigRoot](self->_psrScorer, "psrConfigRoot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v61 = (void *)objc_msgSend(v8, "initWithConfigFile:configRoot:sampleRate:delegate:queue:", v9, v10, (unint64_t)v11, self, self->_queue);

    comparativeModels = self->_comparativeModels;
    if (comparativeModels)
    {
      +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", comparativeModels, self->_configFilePath, self->_resourceFilePath, 0, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v53 || !objc_msgSend(v53, "count"))
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        v14 = self->_comparativeModels;
        -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Cannot create comparative scorers from %@ on profile %@"), v14, v15, context);
        v59 = (id)objc_claimAutoreleasedReturnValue();

        v16 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
          v74 = 2114;
          v75 = v59;
          _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        }
        if (v54)
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          v91 = CFSTR("reason");
          v92[0] = v59;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD, _QWORD))v54 + 2))(v54, v19, 0, 0);

        }
        goto LABEL_46;
      }
    }
    else
    {
      v53 = 0;
    }
    v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v53)
      objc_msgSend(v59, "addObjectsFromArray:", v53);
    objc_msgSend(v59, "addObject:", self->_psrScorer);
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v55;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
    if (!v21)
    {
LABEL_44:

      if (v54)
        (*((void (**)(void))v54 + 2))();
      goto LABEL_46;
    }
    v65 = *(_QWORD *)v67;
    v63 = *MEMORY[0x24BDD0FC8];
LABEL_17:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v65)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v22);
      objc_msgSend(v23, "pathExtension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("wav"));

      if ((v25 & 1) == 0)
      {
        v28 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v23, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("Invalid file format %@ "), v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
          v74 = 2114;
          v75 = v27;
          _os_log_error_impl(&dword_2117D4000, v30, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
        }
        v31 = (void *)MEMORY[0x24BDD1540];
        v88 = v63;
        v89 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 729, v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "path");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKey:", v26, v33);
        goto LABEL_41;
      }
      -[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:](self, "_processAudioFile:withPSRProcessor:", v23, v61);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
        break;
      objc_msgSend(v23, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setObject:forKey:", v26, v27);
LABEL_42:

      if (v21 == ++v22)
      {
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
        if (!v21)
          goto LABEL_44;
        goto LABEL_17;
      }
    }
    -[SSRVoiceProfileRetrainerPSR _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", self->_speakerVector, self->_speakerVectorSize, v59, self->_processedAudioDurationMs);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      if (v60)
      {
        v60[2](v60, v23, v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(v23, "path");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKey:", v26, v33);
LABEL_41:

          goto LABEL_42;
        }
      }
      -[NSURL URLByDeletingLastPathComponent](self->_psrModelFilePath, "URLByDeletingLastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v34;
        objc_msgSend(v23, "lastPathComponent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL lastPathComponent](self->_psrModelFilePath, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "URLByDeletingLastPathComponent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
        *(_DWORD *)buf = 136316674;
        v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
        v74 = 2114;
        v75 = v58;
        v76 = 2114;
        v77 = v35;
        v78 = 2114;
        v79 = v36;
        v80 = 2114;
        v81 = v38;
        v82 = 2050;
        v83 = v39;
        v84 = 2114;
        v85 = v27;
        _os_log_impl(&dword_2117D4000, v57, OS_LOG_TYPE_DEFAULT, "%s Adding %{public}@ to {%{public}@, %{public}@, %{public}@} as %{public}lu vector with scoreCard %{public}@", buf, 0x48u);

        v34 = v57;
      }

      v40 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
      -[SSRSpeakerRecognitionScorer updateSAT](self->_psrScorer, "updateSAT");
      if (-[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount") - v40 == 1)
      {
        objc_msgSend(v23, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKey:", v27, v41);
        v26 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Reached max (%lu) of training utterances, Skipped SAT model update"), -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
          v74 = 2114;
          v75 = v41;
          _os_log_error_impl(&dword_2117D4000, v48, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        v49 = (void *)MEMORY[0x24BDD1540];
        v70 = v63;
        v71 = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 739, v50);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "path");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKey:", v26, v51);

      }
    }
    else
    {
      v42 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v23, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("Failed to get scorecard for utterance %@ on profile %@"), v43, v44, context);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[SSRVoiceProfileRetrainerPSR addUtterances:withPolicy:withCompletion:]";
        v74 = 2114;
        v75 = v33;
        _os_log_error_impl(&dword_2117D4000, v45, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v46 = (void *)MEMORY[0x24BDD1540];
      v86 = CFSTR("reason");
      v87 = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v47);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setObject:forKey:", v26, v41);
    }

    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("File Array is nil"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v93 = *MEMORY[0x24BDD0FC8];
    v94[0] = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 701);
    v59 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))v54 + 2))();
LABEL_46:

  }
  objc_autoreleasePoolPop(context);

}

- (void)purgeLastSpeakerEmbedding
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _WORD v12[17];

  *(_QWORD *)&v12[13] = *MEMORY[0x24BDAC8D0];
  v3 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
  v4 = (id)*MEMORY[0x24BE284B8];
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (v3 - 1);
      v9 = 136315650;
      v10 = "-[SSRVoiceProfileRetrainerPSR purgeLastSpeakerEmbedding]";
      v11 = 1026;
      *(_DWORD *)v12 = v7;
      v12[2] = 2114;
      *(_QWORD *)&v12[3] = v6;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}d from profile %{public}@", (uint8_t *)&v9, 0x1Cu);

    }
    else
    {
      v7 = (v3 - 1);
    }

    -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_psrScorer, "deleteVectorAtIndex:", v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[SSRVoiceProfileRetrainerPSR purgeLastSpeakerEmbedding]";
      v11 = 2114;
      *(_QWORD *)v12 = v8;
      _os_log_error_impl(&dword_2117D4000, v5, OS_LOG_TYPE_ERROR, "%s ERR: Vector count of zero for profile %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (id)purgeConfusionInformationWithPolicy:(id)a3
{
  NSDictionary *comparativeModels;
  void *v5;
  NSDictionary *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  char v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  NSObject *v47;
  void *v48;
  id v50;
  void *v51;
  void *v52;
  uint64_t (**v53)(void);
  void *v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  _BYTE v65[18];
  __int16 v66;
  unint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v53 = (uint64_t (**)(void))a3;
  comparativeModels = self->_comparativeModels;
  if (!comparativeModels)
  {
    v54 = 0;
    goto LABEL_8;
  }
  +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", comparativeModels, self->_configFilePath, self->_resourceFilePath, 0, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54 && objc_msgSend(v54, "count"))
  {
LABEL_8:
    v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v54)
      objc_msgSend(v55, "addObjectsFromArray:");
    v12 = -[SSRSpeakerRecognitionScorer getSATVectorCount](self->_psrScorer, "getSATVectorCount");
    -[SSRVoiceProfile getExplicitEnrollmentUtterancesForType:](self->_voiceProfile, "getExplicitEnrollmentUtterancesForType:", self->_spIdType);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 > 2)
    {
      if (v12 >= v14)
      {
        v26 = (id)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
          v64 = 2114;
          *(_QWORD *)v65 = v27;
          *(_WORD *)&v65[8] = 2050;
          *(_QWORD *)&v65[10] = v12;
          v66 = 2050;
          v67 = v14;
          _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Processing Voice Profile %{public}@ with vectorCount %{public}lu and expVectorCount %{public}lu", buf, 0x2Au);

        }
        v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v12 - v14);
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v14);
        do
        {
          v28 = v12 - 1;
          -[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:](self->_psrScorer, "getSpeakerVectorAtIndex:", v12 - 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (id)*MEMORY[0x24BE284B8];
          v31 = v30;
          if (v29)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v29, "length");
              *(_DWORD *)buf = 136315906;
              v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
              v64 = 2050;
              *(_QWORD *)v65 = v12 - 1;
              *(_WORD *)&v65[8] = 2114;
              *(_QWORD *)&v65[10] = v32;
              v66 = 2050;
              v67 = v33 >> 2;
              _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}lu vector from %{public}@ with size %{public}lu", buf, 0x2Au);

            }
            -[SSRVoiceProfileRetrainerPSR _processSpeakerVector:withSize:withScorers:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:withScorers:processedAudioDurationMs:", v29, (unint64_t)objc_msgSend(v29, "length") >> 2, v55, 0);
            v34 = objc_claimAutoreleasedReturnValue();
            v31 = v34;
            if (v34)
            {
              v35 = -[NSObject mutableCopy](v34, "mutableCopy");
              if (v35)
              {
                if (v12 <= v14)
                {
                  objc_msgSend(v51, "addObject:", v35);
                }
                else
                {
                  if (v53)
                    v36 = v53[2]();
                  else
                    v36 = 1;
                  objc_msgSend(v52, "addObject:", v35);
                  if ((v36 & 1) == 0)
                  {
                    v40 = (id)*MEMORY[0x24BE284B8];
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315650;
                      v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                      v64 = 1026;
                      *(_DWORD *)v65 = v12 - 1;
                      *(_WORD *)&v65[4] = 2114;
                      *(_QWORD *)&v65[6] = v41;
                      _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s Adding vector %{public}u for deletion from profile %{public}@", buf, 0x1Cu);

                    }
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12 - 1);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "addObject:", v42);

                  }
                }
              }
              else
              {
                v39 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                  v64 = 2114;
                  *(_QWORD *)v65 = v31;
                  _os_log_error_impl(&dword_2117D4000, v39, OS_LOG_TYPE_ERROR, "%s Failed to allocate mapped scores for %{public}@", buf, 0x16u);
                }
                v35 = 0;
              }
            }
            else
            {
              v35 = (id)*MEMORY[0x24BE284B8];
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                v64 = 1026;
                *(_DWORD *)v65 = v12 - 1;
                *(_WORD *)&v65[4] = 2114;
                *(_QWORD *)&v65[6] = v38;
                _os_log_error_impl(&dword_2117D4000, v35, OS_LOG_TYPE_ERROR, "%s Failed to get scores for vectorIdx %{public}u of profile %{public}@", buf, 0x1Cu);

              }
            }

          }
          else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
            v64 = 1024;
            *(_DWORD *)v65 = v12 - 1;
            *(_WORD *)&v65[4] = 2114;
            *(_QWORD *)&v65[6] = v37;
            _os_log_error_impl(&dword_2117D4000, v31, OS_LOG_TYPE_ERROR, "%s Failed to %u vector from profile %{public}@", buf, 0x1Cu);

          }
          v12 = v28;
        }
        while ((unint64_t)(v28 + 1) > 1);
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        obj = v50;
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        if (v43)
        {
          v44 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v58 != v44)
                objc_enumerationMutation(obj);
              v46 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              v47 = (id)*MEMORY[0x24BE284B8];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
                v64 = 2114;
                *(_QWORD *)v65 = v46;
                *(_WORD *)&v65[8] = 2114;
                *(_QWORD *)&v65[10] = v48;
                _os_log_impl(&dword_2117D4000, v47, OS_LOG_TYPE_DEFAULT, "%s Deleting vector %{public}@ from profile %{public}@", buf, 0x20u);

              }
              -[SSRSpeakerRecognitionScorer deleteVectorAtIndex:](self->_psrScorer, "deleteVectorAtIndex:", objc_msgSend(v46, "intValue"));
            }
            v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          }
          while (v43);
        }

        -[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:forProfile:forConfigVersion:](self, "_logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:forProfile:forConfigVersion:", v51, v52, objc_msgSend(obj, "count"), self->_voiceProfile, self->_configVersion);
        v11 = 0;
        goto LABEL_55;
      }
      v21 = (void *)MEMORY[0x24BDD17C8];
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("satVectorCount %lu is < %luE for profile %@ - Bailingout"), v12, v14, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v24 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
        v64 = 2114;
        *(_QWORD *)v65 = v23;
        _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v68 = CFSTR("reason");
      v69 = v23;
      obj = (id)v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("ExpSatVectorCount is invalid (%lu) for profile %@ - Bailingout"), v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
        v64 = 2114;
        *(_QWORD *)v65 = v17;
        _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v19 = (void *)MEMORY[0x24BDD1540];
      v70 = CFSTR("reason");
      v71 = v17;
      obj = (id)v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v20;
LABEL_55:

    v10 = obj;
    goto LABEL_56;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = self->_comparativeModels;
  -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Cannot create comparative scorers from %@ on profile %@"), v6, v7);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "-[SSRVoiceProfileRetrainerPSR purgeConfusionInformationWithPolicy:]";
    v64 = 2114;
    *(_QWORD *)v65 = v55;
    _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
  }
  v9 = (void *)MEMORY[0x24BDD1540];
  v72 = CFSTR("reason");
  v73[0] = v55;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 754, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_56:

  return v11;
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
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject **v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *log;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[5];
  _QWORD v56[5];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
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

    v51 = v18;
    objc_msgSend(v18, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    if ((objc_msgSend(v20, "containsObject:", v16) & 1) != 0)
    {
      objc_msgSend(v20, "removeObject:", v16);
      objc_msgSend(v20, "insertObject:atIndex:", v16, 0);
      -[SSRVoiceProfileRetrainerPSR _composeSpeakerConfusionWithScores:forProfiles:](self, "_composeSpeakerConfusionWithScores:forProfiles:", v12, v20);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVoiceProfileRetrainerPSR _composeSpeakerConfusionWithScores:forProfiles:](self, "_composeSpeakerConfusionWithScores:forProfiles:", v13, v20);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = CFSTR("locale");
      objc_msgSend(v14, "locale");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = CFSTR("unknown");
      if (v15)
        v23 = v15;
      v56[0] = v21;
      v56[1] = v23;
      v55[1] = CFSTR("asset");
      v55[2] = CFSTR("explicitUtteranceConfusion");
      v56[2] = v50;
      v56[3] = v49;
      v55[3] = CFSTR("implicitUtteranceConfusion");
      v55[4] = CFSTR("purgedUtteranceCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v56[4] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 5);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logEventWithType:context:contextNoCopy:", 6113, v48, 0);

      v26 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterance"
              "s:forProfile:forConfigVersion:]";
        v59 = 2112;
        v60 = v48;
        _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Log %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "fileLoggingIsEnabled");

      if (v28)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Explicit Utterance Confusion Matrix for User - %@ is"), v16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfileRetrainerPSR _logSpeakerConfusion:forProfileArray:withPrependString:](self, "_logSpeakerConfusion:forProfileArray:withPrependString:", v50, v20, v29);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Implicit Utterance Confusion Matrix for User - %@ is"), v16);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfileRetrainerPSR _logSpeakerConfusion:forProfileArray:withPrependString:](self, "_logSpeakerConfusion:forProfileArray:withPrependString:", v49, v20, v30);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v53[0] = CFSTR("explicitUtteranceConfusion");
        v53[1] = CFSTR("implicitUtteranceConfusion");
        v54[0] = v12;
        v54[1] = v13;
        v53[2] = CFSTR("purgedUtteranceCount");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v54[2] = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 3);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = 0;
        objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v47, 3, &v52);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v52;
        if (v42)
        {
          log = (id)*MEMORY[0x24BE284B8];
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v42, "localizedDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtter"
                  "ances:forProfile:forConfigVersion:]";
            v59 = 2114;
            v60 = v32;
            _os_log_error_impl(&dword_2117D4000, log, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get json object with error %{public}@", buf, 0x16u);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CS-VoiceId-UserConfusion-%@.json"), v16);
          log = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "voiceTriggerAudioLogDirectory");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringByAppendingPathComponent:", log);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v37);
          objc_msgSend(v43, "writeToFile:atomically:", v37, 0);

        }
        v39 = (NSObject **)MEMORY[0x24BE284B8];
        v40 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtteran"
                "ces:forProfile:forConfigVersion:]";
          v59 = 2114;
          v60 = v46;
          _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
          v40 = *v39;
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtteran"
                "ces:forProfile:forConfigVersion:]";
          v59 = 2114;
          v60 = v45;
          _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }

      }
      objc_msgSend(v14, "profilePitch");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      -[SSRVoiceProfileRetrainerPSR _emitVoiceProfileOnboardedSelfLogWithExplicitScores:withProfilePitch:](self, "_emitVoiceProfileOnboardedSelfLogWithExplicitScores:withProfilePitch:", v12);

    }
    else
    {
      v34 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterance"
              "s:forProfile:forConfigVersion:]";
        v59 = 2114;
        v60 = v16;
        v61 = 2114;
        v62 = v20;
        _os_log_impl(&dword_2117D4000, v34, OS_LOG_TYPE_DEFAULT, "%s profile %{public}@ is not present in %{public}@ - Bailing out", buf, 0x20u);
      }
    }

  }
  else
  {
    v33 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[SSRVoiceProfileRetrainerPSR _logSpeakerConfusionWithExplicitScores:withImplicitScores:withPurgeUtterances:"
            "forProfile:forConfigVersion:]";
      _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s explicit scores are nil - Bailing out", buf, 0xCu);
    }
  }

}

- (void)_emitVoiceProfileOnboardedSelfLogWithExplicitScores:(id)a3 withProfilePitch:(float)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  float v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  if ((objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v25;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v29)
    {
      v30 = 0;
      v27 = *(_QWORD *)v38;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v32);
          v31 = objc_alloc_init(MEMORY[0x24BE951C8]);
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spIdKnownUserPSRScores"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v8 = v6;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v9)
          {
            v10 = 0;
            v11 = *(_QWORD *)v34;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v34 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12);
                v14 = objc_alloc_init(MEMORY[0x24BE951C0]);
                objc_msgSend(CFSTR("HomeMember"), "stringByAppendingFormat:", CFSTR("%d"), v10 + v12 + 1);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setHomeMemberUserId:", v15);

                objc_msgSend(v8, "objectForKeyedSubscript:", v13);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "floatValue");
                objc_msgSend(v14, "setSimilarityScore:", (float)(v17 * 100.0));

                objc_msgSend(v7, "addObject:", v14);
                ++v12;
              }
              while (v9 != v12);
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              v10 = (v10 + v12);
            }
            while (v9);
          }

          objc_msgSend(v31, "setVoiceProfileConfusionScores:", v7);
          ++v30;
          objc_msgSend(v31, "setEnrollmentUtteranceNumber:");
          objc_msgSend(v28, "addObject:", v31);

          ++v32;
        }
        while (v32 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v29);
    }

    v18 = objc_alloc_init(MEMORY[0x24BE951D0]);
    objc_msgSend(v18, "setVoiceProfilePitchInHz:", 5 * (a4 / 5));
    objc_msgSend(v18, "setConfusionScoresForEnrollmentUtterances:", v28);
    v19 = objc_alloc_init(MEMORY[0x24BE95190]);
    v20 = objc_alloc_init(MEMORY[0x24BE951A0]);
    v21 = objc_alloc(MEMORY[0x24BE95C70]);
    v22 = objc_alloc_init(MEMORY[0x24BDD1880]);
    v23 = (void *)objc_msgSend(v21, "initWithNSUUID:", v22);
    objc_msgSend(v20, "setMhId:", v23);

    objc_msgSend(v19, "setEventMetadata:", v20);
    objc_msgSend(v19, "setVoiceProfileOnboarded:", v18);
    objc_msgSend(MEMORY[0x24BE909A8], "sharedStream");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "emitMessage:", v19);

  }
}

- (id)_composeSpeakerConfusionWithScores:(id)a3 forProfiles:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = a4;
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16, v5);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("spIdKnownUserPSRScores"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = v20;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v22;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v12);
              objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v13);
        }

        objc_msgSend(v19, "addObject:", v10);
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  return v19;
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
  v22 = __Block_byref_object_copy__2858;
  v23 = __Block_byref_object_dispose__2859;
  v24 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v10 = (void *)MEMORY[0x212BE17E4]();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__SSRVoiceProfileRetrainerPSR__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke;
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

- (id)_processAudioFile:(id)a3 withPSRProcessor:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSData *v19;
  NSData *speakerVector;
  NSUInteger v21;
  unint64_t currUttLengthInMs;
  NSData *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, int, void *);
  void *v32;
  id v33;
  SSRVoiceProfileRetrainerPSR *v34;
  id v35;
  _BYTE *v36;
  _QWORD *v37;
  _BYTE v38[40];
  _QWORD v39[4];
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint8_t v44[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE284B8];
  v9 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing %{public}@", buf, 0x16u);
  }
  self->_psrScore = -1.0;
  objc_msgSend(v7, "resetForNewRequest");
  self->_currUttLengthInMs = 0xFFFFFFFFLL;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__2858;
  v52 = __Block_byref_object_dispose__2859;
  v53 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __66__SSRVoiceProfileRetrainerPSR__processAudioFile_withPSRProcessor___block_invoke;
  v32 = &unk_24CC84FB8;
  v10 = v6;
  v33 = v10;
  v34 = self;
  v36 = buf;
  v37 = v39;
  v11 = v7;
  v35 = v11;
  +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", v10, v38, 640, &v29);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v12)
  {
    v13 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315650;
      v45 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]";
      v46 = 2114;
      v47 = v10;
      v48 = 2114;
      v49 = v12;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed processing %{public}@ with error %{public}@", v44, 0x20u);
      v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v14 = v12;
  }
  else if (self->_currUttLengthInMs > 0xC7)
  {
    objc_msgSend(v11, "getLatestSuperVector");
    v19 = (NSData *)objc_claimAutoreleasedReturnValue();
    speakerVector = self->_speakerVector;
    self->_speakerVector = v19;

    v21 = -[NSData length](self->_speakerVector, "length");
    currUttLengthInMs = self->_currUttLengthInMs;
    v23 = self->_speakerVector;
    self->_speakerVectorSize = v21 >> 2;
    self->_processedAudioDurationMs = currUttLengthInMs;
    if (v23)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("speakerVector is nil! for processedAUdioDurationMs: %lu , _currUttLengthInMs: %lu"), currUttLengthInMs, currUttLengthInMs, v29, v30, v31, v32, v33, v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BDD0FC8];
      v41 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 743, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Too little audio %dms in %@ - Bailing out"), self->_currUttLengthInMs, v10, v29, v30, v31, v32, v33, v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 136315394;
      v45 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]";
      v46 = 2114;
      v47 = v15;
      _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", v44, 0x16u);
    }
    v17 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0FC8];
    v43 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 751, v18);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 withScorers:(id)a5 processedAudioDurationMs:(unint64_t)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v24;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "scoreSpeakerVector:withDimensions:withThresholdType:", v8, a4, 0);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "profileID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v11);
  }

  v30[0] = v9;
  v29[0] = CFSTR("spIdKnownUserPSRScores");
  v29[1] = CFSTR("spIdAudioProcessedDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  v29[2] = CFSTR("bestVoiceTriggerScore");
  *(float *)&v18 = self->_bestTriggerScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_comparativeModels, 0);
  objc_storeStrong((id *)&self->_psrModelFilePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_psrScorer, 0);
}

void __66__SSRVoiceProfileRetrainerPSR__processAudioFile_withPSRProcessor___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  float v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (v7)
  {
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v19 = 136315394;
      v20 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]_block_invoke";
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", (uint8_t *)&v19, 0x16u);
    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = v7;
    v12 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v11;
    goto LABEL_10;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "length");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v18 / v24;
    objc_msgSend(*(id *)(a1 + 48), "addAudio:", v12);
LABEL_10:

    goto LABEL_11;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = (unint64_t)(float)((float)((float)v13 / v14) * 1000.0);
  v15 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    v19 = 136315650;
    v20 = "-[SSRVoiceProfileRetrainerPSR _processAudioFile:withPSRProcessor:]_block_invoke";
    v21 = 2050;
    v22 = v17;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s Reached end of file. _currUttLengthInMs: %{public}lu, calling endAudio: %@", (uint8_t *)&v19, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 48), "endAudio");
LABEL_11:

}

void __86__SSRVoiceProfileRetrainerPSR__logSpeakerConfusion_forProfileArray_withPrependString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t i;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t j;
  void *v11;
  void *v12;
  float v13;
  float v14;
  id v15;

  v15 = a2;
  if (!a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("\n\n%@\n----------------------------------------------------------------------------------------------\n"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("              "));
    for (i = 0; ; ++i)
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "count");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      if (i >= v6)
        break;
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("%@  "), v9);

    }
    objc_msgSend(*(id *)(v7 + 40), "appendFormat:", CFSTR("\n"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Utterance%02d   "), a3);
  for (j = 0; j < objc_msgSend(v15, "count"); ++j)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (j)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", j);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      objc_msgSend(v11, "appendFormat:", CFSTR("%39.2f"), v13);
    }
    else
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      objc_msgSend(v11, "appendFormat:", CFSTR("%16.2f"), v14);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("\n"));

}

@end
