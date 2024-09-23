@implementation SSRSpeakerRecognitionScorer

- (SSRSpeakerRecognitionScorer)initWithProfileID:(id)a3 withModelFile:(id)a4 withConfigFile:(id)a5 withResourceFile:(id)a6 withOffsetsType:(unint64_t)a7 forRetraining:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:memoryIndex:withOffsetsType:forRetraining:](self, "initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:memoryIndex:withOffsetsType:forRetraining:", a3, a4, a5, a6, 0, 0, a7, v9);
}

- (SSRSpeakerRecognitionScorer)initWithProfileID:(id)a3 withModelFile:(id)a4 withConfigFile:(id)a5 withResourceFile:(id)a6 configData:(id)a7 memoryIndex:(id)a8 withOffsetsType:(unint64_t)a9 forRetraining:(BOOL)a10
{
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  SSRSpeakerRecognitionScorer *v21;
  SSRSpeakerRecognitionScorer *v22;
  id *p_configFilePath;
  void *v24;
  char v25;
  uint64_t v26;
  id v27;
  id v28;
  int v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  id v35;
  NSObject *v36;
  uint32_t v37;
  SSRSpeakerRecognitionScorer *v38;
  int v39;
  NSObject *v40;
  uint64_t v41;
  os_log_t v42;
  void *v43;
  void *v44;
  char v45;
  os_log_t *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  int v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  int v57;
  int v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  int v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  _QWORD v72[4];
  SSRSpeakerRecognitionScorer *v73;
  _BYTE *v74;
  objc_super v75;
  _BYTE buf[32];
  __int16 v77;
  int v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint8_t v85[4];
  const char *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v71 = a3;
  v17 = a4;
  v18 = a5;
  v70 = a6;
  v19 = (unint64_t)a7;
  v20 = (unint64_t)a8;
  v75.receiver = self;
  v75.super_class = (Class)SSRSpeakerRecognitionScorer;
  v21 = -[SSRSpeakerRecognitionScorer init](&v75, sel_init);
  v22 = v21;
  if (!v21)
    goto LABEL_46;
  p_configFilePath = (id *)&v21->_configFilePath;
  objc_storeStrong((id *)&v21->_configFilePath, a5);
  objc_storeStrong((id *)&v22->_resourceFilePath, a6);
  objc_storeStrong((id *)&v22->_modelFilePath, a4);
  objc_storeStrong((id *)&v22->_profileID, a3);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 | v20
    || (objc_msgSend(*p_configFilePath, "path"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v69, "fileExistsAtPath:", v24),
        v24,
        (v25 & 1) != 0))
  {
    v26 = nd_create();
    v22->_novDetect = (void *)v26;
    if (v26)
    {
      if (v18)
      {
        objc_msgSend(v18, "path");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v27, "UTF8String");
        -[NSURL path](v22->_resourceFilePath, "path");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v28, "UTF8String");
        v29 = nd_initialize();

        if (v29)
        {
          v30 = (void *)*MEMORY[0x24BE28360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          {
            v31 = v30;
            v32 = nd_error();
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResour"
                                 "ceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
            *(_WORD *)&buf[12] = 1026;
            *(_DWORD *)&buf[14] = v29;
            *(_WORD *)&buf[18] = 2082;
            *(_QWORD *)&buf[20] = v32;
            _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize _novDetect: err=[%{public}d]:%{public}s", buf, 0x1Cu);

          }
          goto LABEL_15;
        }
        goto LABEL_27;
      }
      if (!v19 || !v20)
      {
        v42 = (os_log_t)*MEMORY[0x24BE28360];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFi"
                             "le:configData:memoryIndex:withOffsetsType:forRetraining:]";
        v34 = "%s ERR: Failed to initialize _novDetect: config path or config data or memory index is nil";
LABEL_42:
        v36 = v42;
        v37 = 12;
        goto LABEL_14;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      buf[24] = 1;
      v72[0] = MEMORY[0x24BDAC760];
      v72[1] = 3221225472;
      v72[2] = __148__SSRSpeakerRecognitionScorer_initWithProfileID_withModelFile_withConfigFile_withResourceFile_configData_memoryIndex_withOffsetsType_forRetraining___block_invoke;
      v72[3] = &unk_24CC85800;
      v74 = buf;
      v73 = v22;
      objc_msgSend((id)v20, "iterateMemoryIndexes:", v72);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        objc_msgSend(objc_retainAutorelease((id)v19), "bytes");
        v39 = nd_initialize();
        if (!v39)
        {

          _Block_object_dispose(buf, 8);
LABEL_27:
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v43, "fileExistsAtPath:", v44);

          if ((v45 & 1) != 0)
          {
            v22->_satModelAvailable = 1;
LABEL_33:
            objc_msgSend(v17, "path");
            v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v52, "UTF8String");
            v53 = nd_sat_initialize();

            if (v53)
            {
              v54 = (void *)*MEMORY[0x24BE28360];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
              {
                v55 = v54;
                v56 = nd_error();
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withRe"
                                     "sourceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
                *(_WORD *)&buf[12] = 1026;
                *(_DWORD *)&buf[14] = v53;
                *(_WORD *)&buf[18] = 2082;
                *(_QWORD *)&buf[20] = v56;
                _os_log_impl(&dword_2117D4000, v55, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize: err=%{public}d:%{public}s", buf, 0x1Cu);

              }
              goto LABEL_15;
            }
            v57 = nd_sat_vectorcount();
            if (!a10)
            {
              v58 = v57;
              if (v57 <= 0)
              {
                v59 = *MEMORY[0x24BE28360];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
                  goto LABEL_15;
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withRe"
                                     "sourceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v58;
                v34 = "%s ERR: numVectors:%d for inference, abort";
                v36 = v59;
                v37 = 18;
                goto LABEL_14;
              }
            }
            v22->_offsetsType = a9;
            objc_msgSend(v17, "URLByDeletingLastPathComponent");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = (void *)*MEMORY[0x24BE28360];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
            {
              v62 = v61;
              v67 = -[SSRSpeakerRecognitionScorer getSATVectorCount](v22, "getSATVectorCount");
              objc_msgSend(v17, "lastPathComponent");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "lastPathComponent");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "URLByDeletingLastPathComponent");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "lastPathComponent");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withReso"
                                   "urceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v71;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)&buf[24] = v22;
              v77 = 1026;
              v78 = v67;
              v79 = 2114;
              v80 = v68;
              v81 = 2114;
              v82 = v63;
              v83 = 2114;
              v84 = v65;
              _os_log_impl(&dword_2117D4000, v62, OS_LOG_TYPE_DEFAULT, "%s Initialized Scorer for %{public}@ - (%{public}@, %{public}d, %{public}@, %{public}@, %{public}@)", buf, 0x44u);

            }
LABEL_46:
            v38 = v22;
            goto LABEL_47;
          }
          v46 = (os_log_t *)MEMORY[0x24BE28360];
          v47 = (void *)*MEMORY[0x24BE28360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          {
            v48 = v47;
            objc_msgSend(v17, "path");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResour"
                                 "ceFile:configData:memoryIndex:withOffsetsType:forRetraining:]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v49;
            _os_log_impl(&dword_2117D4000, v48, OS_LOG_TYPE_DEFAULT, "%s %@, satModel doesn't exist", buf, 0x16u);

          }
          v22->_satModelAvailable = 0;
          if (a10)
          {
            objc_msgSend(v17, "URLByDeletingLastPathComponent");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "path");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v51);

            goto LABEL_33;
          }
          v42 = *v46;
          if (!os_log_type_enabled(*v46, OS_LOG_TYPE_DEFAULT))
            goto LABEL_15;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResource"
                               "File:configData:memoryIndex:withOffsetsType:forRetraining:]";
          v34 = "%s Bailing out since we don't have modelPath for inference";
          goto LABEL_42;
        }
        v40 = (id)*MEMORY[0x24BE28360];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = nd_error();
          *(_DWORD *)v85 = 136315650;
          v86 = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData"
                ":memoryIndex:withOffsetsType:forRetraining:]";
          v87 = 1026;
          v88 = v39;
          v89 = 2082;
          v90 = v41;
          _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize secure _novDetect: err=[%{public}d]:%{public}s", v85, 0x1Cu);
        }

      }
      _Block_object_dispose(buf, 8);
      goto LABEL_15;
    }
    v33 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile"
                           ":configData:memoryIndex:withOffsetsType:forRetraining:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      v34 = "%s ERR: Failed to create NovDetect using %{public}@";
LABEL_13:
      v36 = v33;
      v37 = 22;
LABEL_14:
      _os_log_impl(&dword_2117D4000, v36, OS_LOG_TYPE_DEFAULT, v34, buf, v37);
    }
  }
  else
  {
    v33 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v35 = *p_configFilePath;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile"
                           ":configData:memoryIndex:withOffsetsType:forRetraining:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v35;
      v34 = "%s ERR: Config file not found at %{public}@";
      goto LABEL_13;
    }
  }
LABEL_15:

  v38 = 0;
LABEL_47:

  return v38;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SSRSpeakerRecognitionScorer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SSRSpeakerRecognitionScorer dealloc]";
    v7 = 2114;
    v8 = self;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s dealloc %{public}@", buf, 0x16u);
  }
  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognitionScorer;
  -[SSRSpeakerRecognitionScorer dealloc](&v4, sel_dealloc);
}

- (BOOL)resetScorerWithModelFilePath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_novDetect)
    goto LABEL_5;
  objc_msgSend(v4, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "UTF8String");
  v7 = nd_sat_initialize();

  if (!v7)
  {
    v9 = 1;
    goto LABEL_7;
  }
  v8 = (void *)*MEMORY[0x24BE28360];
  v9 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    v12 = 136315906;
    v13 = "-[SSRSpeakerRecognitionScorer resetScorerWithModelFilePath:]";
    v14 = 2114;
    v15 = v5;
    v16 = 1026;
    v17 = v7;
    v18 = 2082;
    v19 = nd_error();
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize at %{public}@, err=%{public}d:%{public}s", (uint8_t *)&v12, 0x26u);

LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)resetForNewRequest
{
  nd_reset();
}

- (float)analyzeSpeakerVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  float *v11;
  double v12;
  float v13;
  NSObject *v14;
  float v15;
  void *v16;
  void *v17;
  NSObject *v18;
  float v19;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "speakerIdScoreReportingType");

  if (v8 && a4)
  {
    objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (self->_novDetect)
    {
      v11 = (float *)nd_sat_analyze();
      if (v11)
      {
        v13 = *v11;
      }
      else
      {
        v17 = (void *)*MEMORY[0x24BE28360];
        v13 = -1.0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v21 = 136315394;
          v22 = "-[SSRSpeakerRecognitionScorer analyzeSpeakerVector:withDimensions:withThresholdType:]";
          v23 = 2080;
          v24 = nd_error();
          _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to compute SAT score: err: %s", (uint8_t *)&v21, 0x16u);

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSRSpeakerRecognitionScorer.m"), 259, CFSTR("Unexpected _novDetect is nil"));

      v13 = -1.0;
    }
    *(float *)&v12 = v13;
    -[SSRSpeakerRecognitionScorer normalizedScoreFromRawScore:forScoreType:](self, "normalizedScoreFromRawScore:forScoreType:", v10, v12);
    v15 = v19;
  }
  else
  {
    v14 = *MEMORY[0x24BE28360];
    v15 = -1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[SSRSpeakerRecognitionScorer analyzeSpeakerVector:withDimensions:withThresholdType:]";
      v23 = 2112;
      v24 = (uint64_t)v8;
      v25 = 2048;
      v26 = a4;
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s ERR: speakerVec invalid: %@:%lu", (uint8_t *)&v21, 0x20u);
    }
  }

  return v15;
}

- (float)analyzeSuperVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  float *v11;
  double v12;
  float v13;
  NSObject *v14;
  float v15;
  void *v16;
  void *v17;
  NSObject *v18;
  float v19;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "speakerIdScoreReportingType");

  if (v8 && a4)
  {
    objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (self->_novDetect)
    {
      v11 = (float *)nd_sat_analyze();
      if (v11)
      {
        v13 = *v11;
      }
      else
      {
        v17 = (void *)*MEMORY[0x24BE28360];
        v13 = -1.0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v21 = 136315394;
          v22 = "-[SSRSpeakerRecognitionScorer analyzeSuperVector:withDimensions:withThresholdType:]";
          v23 = 2080;
          v24 = nd_error();
          _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to compute SAT score: err: %s", (uint8_t *)&v21, 0x16u);

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSRSpeakerRecognitionScorer.m"), 290, CFSTR("Unexpected _novDetect is nil"));

      v13 = -1.0;
    }
    *(float *)&v12 = v13;
    -[SSRSpeakerRecognitionScorer normalizedScoreFromRawScore:forScoreType:](self, "normalizedScoreFromRawScore:forScoreType:", v10, v12);
    v15 = v19;
  }
  else
  {
    v14 = *MEMORY[0x24BE28360];
    v15 = -1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[SSRSpeakerRecognitionScorer analyzeSuperVector:withDimensions:withThresholdType:]";
      v23 = 2112;
      v24 = (uint64_t)v8;
      v25 = 2048;
      v26 = a4;
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s ERR: superVec invalid: %@:%lu", (uint8_t *)&v21, 0x20u);
    }
  }

  return v15;
}

- (float)scoreSpeakerVector:(id)a3 withDimensions:(unint64_t)a4 withThresholdType:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  float *v11;
  double v12;
  float v13;
  NSObject *v14;
  float v15;
  void *v16;
  void *v17;
  NSObject *v18;
  float v19;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "speakerIdScoreReportingType");

  if (v8 && a4)
  {
    objc_msgSend(objc_retainAutorelease(v8), "bytes");
    if (self->_novDetect)
    {
      v11 = (float *)nd_sat_analyze();
      if (v11)
      {
        v13 = *v11;
      }
      else
      {
        v17 = (void *)*MEMORY[0x24BE28360];
        v13 = -1.0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v21 = 136315394;
          v22 = "-[SSRSpeakerRecognitionScorer scoreSpeakerVector:withDimensions:withThresholdType:]";
          v23 = 2080;
          v24 = nd_error();
          _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to compute SAT score: err: %s", (uint8_t *)&v21, 0x16u);

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSRSpeakerRecognitionScorer.m"), 331, CFSTR("Unexpected _novDetect is nil"));

      v13 = -1.0;
    }
    *(float *)&v12 = v13;
    -[SSRSpeakerRecognitionScorer normalizedScoreFromRawScore:forScoreType:](self, "normalizedScoreFromRawScore:forScoreType:", v10, v12);
    v15 = v19;
  }
  else
  {
    v14 = *MEMORY[0x24BE28360];
    v15 = -1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[SSRSpeakerRecognitionScorer scoreSpeakerVector:withDimensions:withThresholdType:]";
      v23 = 2112;
      v24 = (uint64_t)v8;
      v25 = 2048;
      v26 = a4;
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s ERR: speakerVec invalid: %@:%lu", (uint8_t *)&v21, 0x20u);
    }
  }

  return v15;
}

- (float)normalizedScoreFromRawScore:(float)a3 forScoreType:(unint64_t)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float result;
  NSObject *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  int v24;
  const char *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[SSRSpeakerRecognitionScorer _satScoreVTScale](self, "_satScoreVTScale");
  v8 = v7;
  -[SSRSpeakerRecognitionScorer _satScoreVTOffset](self, "_satScoreVTOffset");
  v10 = v9;
  -[SSRSpeakerRecognitionScorer _satLogitCeilScore](self, "_satLogitCeilScore");
  v12 = v11;
  -[SSRSpeakerRecognitionScorer _satLogitFloorScore](self, "_satLogitFloorScore");
  v14 = v13;
  if (self->_offsetsType == 1)
  {
    -[SSRSpeakerRecognitionScorer _satScoreNonVTScale](self, "_satScoreNonVTScale");
    v8 = v15;
    -[SSRSpeakerRecognitionScorer _satScoreNonVTOffset](self, "_satScoreNonVTOffset");
    v10 = v16;
  }
  v17 = v10 + (float)(v8 * a3);
  if (a4 - 1 <= 1)
    return 1.0 / (exp((float)(v17 * -2.0)) + 1.0);
  if ((float)(v12 - v14) >= 0.1)
  {
    v21 = v14;
    v20 = v12;
  }
  else
  {
    v19 = *MEMORY[0x24BE284B8];
    v20 = 7.0;
    v21 = -7.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v24 = 136316162;
      v25 = "-[SSRSpeakerRecognitionScorer normalizedScoreFromRawScore:forScoreType:]";
      v26 = 2048;
      v27 = v12;
      v28 = 2048;
      v29 = v14;
      v30 = 2048;
      v31 = 0x401C000000000000;
      v32 = 2048;
      v33 = 0xC01C000000000000;
      _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Incorrect logitCeil %f and logitFloor %f - defaulting them to %f and %f", (uint8_t *)&v24, 0x34u);
    }
  }
  v22 = 1.0 / (float)(v20 - v21);
  v23 = -(v21 * v22);
  result = v23 + (float)(v22 * (float)(v17 + v17));
  if (result < 0.0)
    return 0.0;
  return result;
}

- (void)updateSAT
{
  int v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_novDetect)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSRSpeakerRecognitionScorer.m"), 390, CFSTR("updateSAT called with _novDetect = nullptr"));

  }
  v3 = nd_sat_update();
  if (v3)
  {
    v4 = v3;
    v5 = (void *)*MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v9 = 136315650;
      v10 = "-[SSRSpeakerRecognitionScorer updateSAT]";
      v11 = 1024;
      v12 = v4;
      v13 = 2080;
      v14 = nd_error();
      _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to persist via sat_update: %d, %s", (uint8_t *)&v9, 0x1Cu);

    }
  }
}

- (void)deleteVectorAtIndex:(int)a3
{
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_novDetect)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", *(_QWORD *)&a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSRSpeakerRecognitionScorer.m"), 400, CFSTR("deleteVectorAtIndex called with _novDetect = nullptr"));

  }
  v4 = nd_sat_deletevector();
  if (v4)
  {
    v5 = v4;
    v6 = (void *)*MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v10 = 136315650;
      v11 = "-[SSRSpeakerRecognitionScorer deleteVectorAtIndex:]";
      v12 = 1024;
      v13 = v5;
      v14 = 2080;
      v15 = nd_error();
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to nd_sat_delete: %d, %s", (uint8_t *)&v10, 0x1Cu);

    }
  }
}

- (unint64_t)getSATVectorCount
{
  unint64_t result;
  int v3;

  result = (unint64_t)self->_novDetect;
  if (result)
  {
    v3 = nd_sat_vectorcount();
    return v3 & ~(v3 >> 31);
  }
  return result;
}

- (NSString)sysConfigRoot
{
  return (NSString *)-[SSRSpeakerRecognitionScorer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", CFSTR("spid_frontend_sys_conf_root_node"));
}

- (NSString)psrConfigFilePath
{
  void *v3;
  NSObject *v4;
  NSURL *configFilePath;
  int v7;
  const char *v8;
  __int16 v9;
  NSURL *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[SSRSpeakerRecognitionScorer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", CFSTR("spid_frontend_config_file"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SSRSpeakerRecognitionScorer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", CFSTR("td_sr_frontend_config_file"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        configFilePath = self->_configFilePath;
        v7 = 136315394;
        v8 = "-[SSRSpeakerRecognitionScorer psrConfigFilePath]";
        v9 = 2114;
        v10 = configFilePath;
        _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s ERR: FrontEnd Config option missing in %{public}@", (uint8_t *)&v7, 0x16u);
      }
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)psrConfigRoot
{
  void *v3;
  NSObject *v4;
  NSURL *configFilePath;
  int v7;
  const char *v8;
  __int16 v9;
  NSURL *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[SSRSpeakerRecognitionScorer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", CFSTR("spid_frontend_sys_conf_root_node"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SSRSpeakerRecognitionScorer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", CFSTR("td_sr_frontend_sys_conf_root_node"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        configFilePath = self->_configFilePath;
        v7 = 136315394;
        v8 = "-[SSRSpeakerRecognitionScorer psrConfigRoot]";
        v9 = 2114;
        v10 = configFilePath;
        _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s ERR: td_sr_frontend_sys_conf_root_node option missing in %{public}@", (uint8_t *)&v7, 0x16u);
      }
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (id)getSpeakerVectorAtIndex:(unint64_t)a3
{
  int v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->_novDetect || (v4 = nd_sat_getspeakervector()) == 0)
  {
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:]";
      v11 = 1024;
      v12 = v3;
      v8 = "%s ERR: ndspeakervector is nil for index %u";
      goto LABEL_11;
    }
LABEL_6:
    v5 = 0;
    return v5;
  }
  if (!*(_QWORD *)v4)
  {
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:]";
      v11 = 1024;
      v12 = v3;
      v8 = "%s ERR: vector data is nil for index %u";
LABEL_11:
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v9, 0x12u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)v4, 4 * *(unsigned int *)(v4 + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (float)_satScoreVTScale
{
  double v2;

  -[SSRSpeakerRecognitionScorer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("score_scale"), 1.352725);
  return v2;
}

- (float)_satScoreNonVTScale
{
  double v2;

  -[SSRSpeakerRecognitionScorer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("score_nonvt_scale"), 1.041342);
  return v2;
}

- (float)_satScoreVTOffset
{
  double v2;

  -[SSRSpeakerRecognitionScorer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("score_offset"), -2.421951);
  return v2;
}

- (float)_satScoreNonVTOffset
{
  double v2;

  -[SSRSpeakerRecognitionScorer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("score_nonvt_offset"), -1.158097);
  return v2;
}

- (float)_satLogitCeilScore
{
  double v2;

  -[SSRSpeakerRecognitionScorer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("logit_ceil_score"), 7.0);
  return v2;
}

- (float)_satLogitFloorScore
{
  double v2;

  -[SSRSpeakerRecognitionScorer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("logit_floor_score"), -7.0);
  return v2;
}

- (id)_getOptionValueFromConfigurationName:(id)a3
{
  void *v4;

  v4 = 0;
  if (a3)
  {
    if (self->_novDetect)
    {
      objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
      v4 = (void *)nd_getoption();
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

- (double)_getFloatValueFromConfigurationName:(id)a3 defaultTo:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  float v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SSRSpeakerRecognitionScorer _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    a4 = v9;
  }
  else
  {
    v10 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = "-[SSRSpeakerRecognitionScorer _getFloatValueFromConfigurationName:defaultTo:]";
      v14 = 2114;
      v15 = v6;
      v16 = 2050;
      v17 = a4;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s ::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}f", (uint8_t *)&v12, 0x20u);
    }
  }

  return a4;
}

- (int)_getIntValueFromConfigurationName:(id)a3 defaultTo:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SSRSpeakerRecognitionScorer _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    a4 = objc_msgSend(v7, "intValue");
  }
  else
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[SSRSpeakerRecognitionScorer _getIntValueFromConfigurationName:defaultTo:]";
      v13 = 2114;
      v14 = v6;
      v15 = 1026;
      v16 = a4;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s ::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}d", (uint8_t *)&v11, 0x1Cu);
    }
  }

  return a4;
}

- (id)_getStringValueFromConfigurationName:(id)a3 defaultTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SSRSpeakerRecognitionScorer _getOptionValueFromConfigurationName:](self, "_getOptionValueFromConfigurationName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v10 = *MEMORY[0x24BE284B8];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
    v9 = v7;
    if (v11)
    {
      v14 = 136315650;
      v15 = "-[SSRSpeakerRecognitionScorer _getStringValueFromConfigurationName:defaultTo:]";
      v16 = 2114;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s ::: ndetect config does not define external parameter %{public}@, defaulting to provided value: %{public}@", (uint8_t *)&v14, 0x20u);
      v9 = v7;
    }
  }
  v12 = v9;

  return v12;
}

- (double)_getFloatValueForNDAPIConfigOption:(id)a3 defaultValue:(double)a4
{
  void *v5;
  void *v6;
  float v7;

  -[SSRSpeakerRecognitionScorer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    a4 = v7;
  }

  return a4;
}

- (id)_getValueForNDAPIConfigOption:(id)a3
{
  id v4;
  void *v5;
  void *novDetect;
  uint64_t v7;

  v4 = a3;
  v5 = v4;
  novDetect = self->_novDetect;
  if (novDetect)
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v7 = nd_getoption();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      novDetect = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      novDetect = 0;
    }
  }

  return novDetect;
}

- (NSString)profileID
{
  return self->_profileID;
}

- (BOOL)satModelAvailable
{
  return self->_satModelAvailable;
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

- (NSURL)modelFilePath
{
  return self->_modelFilePath;
}

- (void)setModelFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_modelFilePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_profileID, 0);
}

void __148__SSRSpeakerRecognitionScorer_initWithProfileID_withModelFile_withConfigFile_withResourceFile_configData_memoryIndex_withOffsetsType_forRetraining___block_invoke(uint64_t a1, void *a2)
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
        v8 = "-[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:configData:me"
             "moryIndex:withOffsetsType:forRetraining:]_block_invoke";
        v9 = 2081;
        v10 = objc_msgSend(v4, "nameString");
        _os_log_debug_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEBUG, "%s Failed to add resource %{private}s", (uint8_t *)&v7, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }

}

+ (id)createVoiceScorersWithVoiceProfiles:(id)a3 withConfigFile:(id)a4 withResourceFile:(id)a5 withOffsetsType:(unint64_t)a6 forRetraining:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SSRSpeakerRecognitionScorer *v19;
  void *v20;
  SSRSpeakerRecognitionScorer *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v7 = a7;
  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v27 = a4;
  v12 = a5;
  if (v11 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v17);
          v19 = [SSRSpeakerRecognitionScorer alloc];
          objc_msgSend(v13, "objectForKeyedSubscript:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[SSRSpeakerRecognitionScorer initWithProfileID:withModelFile:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](v19, "initWithProfileID:withModelFile:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", v18, v20, v27, v12, a6, v7);

          if (v21 && -[SSRSpeakerRecognitionScorer satModelAvailable](v21, "satModelAvailable"))
          {
            objc_msgSend(v26, "addObject:", v21);
          }
          else
          {
            v22 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v33 = "+[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:wi"
                    "thOffsetsType:forRetraining:]";
              v34 = 2114;
              v35 = v18;
              v36 = 2114;
              v37 = v12;
              _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s ERR: Failed to initialize satAnalyzer for profile %{public}@ with asset %{public}@", buf, 0x20u);
            }
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v15);
    }

    v11 = v25;
  }
  else
  {
    v23 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffset"
            "sType:forRetraining:]";
      _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Voice Recognition models not provided - Bailing out", buf, 0xCu);
    }
    v26 = 0;
  }

  return v26;
}

@end
