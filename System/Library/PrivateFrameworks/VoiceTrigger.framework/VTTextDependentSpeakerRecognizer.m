@implementation VTTextDependentSpeakerRecognizer

- (VTTextDependentSpeakerRecognizer)initWithResourcePath:(id)a3 satDirectory:(id)a4 assetHash:(id)a5 shouldCreateModelDir:(BOOL)a6 delegate:(id)a7
{
  _BOOL4 v8;
  id v13;
  VTTextDependentSpeakerRecognizer *v14;
  VTTextDependentSpeakerRecognizer *v15;
  id *p_resourcePath;
  NSString **p_satDirectory;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  NSString *v24;
  NSString *assetHash;
  IntNovDetect *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  const __CFString *v32;
  NSObject *v33;
  NSString *v34;
  __CFString *v35;
  uint64_t v36;
  NSString *tdSATModelDirPath;
  uint64_t v38;
  NSString *tdSATModelFilePath;
  NSObject *v40;
  NSString *v41;
  NSString *v42;
  void *v43;
  char v44;
  char v45;
  NSObject *v46;
  NSString *v47;
  const char *v48;
  NSObject *v49;
  VTTextDependentSpeakerRecognizer *v50;
  NSObject *v51;
  int v52;
  void *v53;
  char v54;
  NSObject *v55;
  void *novDetect;
  const char *v57;
  NSString *v58;
  uint64_t v59;
  EARPSRAudioProcessor *speakerVectorGenerator;
  dispatch_queue_t v61;
  OS_dispatch_queue *queue;
  dispatch_queue_t v63;
  OS_dispatch_queue *stateSerialQueue;
  void *v66;
  id v67;
  id v68;
  id v69;
  char v70;
  objc_super v71;
  uint8_t buf[4];
  _DWORD v73[7];

  v8 = a6;
  *(_QWORD *)&v73[5] = *MEMORY[0x24BDAC8D0];
  v67 = a3;
  v68 = a4;
  v69 = a5;
  v13 = a7;
  v71.receiver = self;
  v71.super_class = (Class)VTTextDependentSpeakerRecognizer;
  v14 = -[VTTextDependentSpeakerRecognizer init](&v71, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_73;
  objc_storeWeak((id *)&v14->_delegate, v13);
  p_resourcePath = (id *)&v15->_resourcePath;
  objc_storeStrong((id *)&v15->_resourcePath, a3);
  p_satDirectory = &v15->_satDirectory;
  objc_storeStrong((id *)&v15->_satDirectory, a4);
  objc_storeStrong((id *)&v15->_assetHash, a5);
  -[NSString stringByAppendingPathComponent:](v15->_resourcePath, "stringByAppendingPathComponent:", CFSTR("config_sr_sat.txt"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v18, 0);

  v21 = VTLogContextFacilityVoiceTrigger;
  v22 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if ((v20 & 1) == 0)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: No TDSR config file; Not initializing VTTextDependentSpeakerRecognizer",
        buf,
        2u);
    }
    goto LABEL_49;
  }
  if (v22)
  {
    v23 = *p_resourcePath;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v73 = v23;
    _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: resourcePath: %{public}@", buf, 0xCu);
    v21 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v73 = v18;
    _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: tdSrConfigFilePath: %{public}@", buf, 0xCu);
    v21 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *p_satDirectory;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v73 = v24;
    _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: _satDirectory: %{public}@", buf, 0xCu);
    v21 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    assetHash = v15->_assetHash;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v73 = assetHash;
    _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: _assetHash: %{public}@", buf, 0xCu);
  }
  if ((initndlib(void)::bNDLibInitialized & 1) == 0)
    initndlib(void)::bNDLibInitialized = 1;
  v26 = (IntNovDetect *)operator new();
  IntNovDetect::IntNovDetect(v26);
  v15->_novDetect = v26;
  v27 = objc_retainAutorelease(v18);
  if (!nd_initialize(v26, (const char *)objc_msgSend(v27, "UTF8String"), (const char *)objc_msgSend(*p_resourcePath, "UTF8String")))
  {
    -[VTTextDependentSpeakerRecognizer _getValueForNDAPIConfigOption:](v15, "_getValueForNDAPIConfigOption:", CFSTR("td_sr_frontend_config_file"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      v49 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v49, OS_LOG_TYPE_DEFAULT, "TDSR:: \"td_sr_frontend_config_file\" option missing in config_sr_sat.txt; Not Initializing VTTextDependentSpeakerRecognizer",
          buf,
          2u);
      }

      goto LABEL_50;
    }
    -[VTTextDependentSpeakerRecognizer _getValueForNDAPIConfigOption:](v15, "_getValueForNDAPIConfigOption:", CFSTR("td_sr_frontend_sys_conf_root_node"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v66)
    {
      v51 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v51, OS_LOG_TYPE_DEFAULT, "TDSR:: td_sr_frontend_sys_conf_root_node option missing in config_sr_sat.txt; Not Initializing VTTextDependent"
          "SpeakerRecognizer",
          buf,
          2u);
      }
      v52 = 1;
LABEL_72:

      if (v52)
        goto LABEL_50;
LABEL_73:
      v50 = v15;
      goto LABEL_74;
    }
    -[VTTextDependentSpeakerRecognizer _getValueForNDAPIConfigOption:](v15, "_getValueForNDAPIConfigOption:", CFSTR("td_sr_model_dir"));
    v32 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v33 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v33, OS_LOG_TYPE_DEFAULT, "TDSR:: td_sr_model_dir option missing in config_sr_sat.txt; defaulting to \"td-sr-model\",
          buf,
          2u);
      }
      v32 = CFSTR("td-sr-model");
    }
    v34 = *p_satDirectory;
    v35 = (__CFString *)v32;
    -[NSString stringByAppendingPathComponent:](v34, "stringByAppendingPathComponent:");
    v36 = objc_claimAutoreleasedReturnValue();
    tdSATModelDirPath = v15->_tdSATModelDirPath;
    v15->_tdSATModelDirPath = (NSString *)v36;

    -[NSString stringByAppendingPathComponent:](v15->_tdSATModelDirPath, "stringByAppendingPathComponent:", v69);
    v38 = objc_claimAutoreleasedReturnValue();
    tdSATModelFilePath = v15->_tdSATModelFilePath;
    v15->_tdSATModelFilePath = (NSString *)v38;

    v40 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v15->_tdSATModelDirPath;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v73 = v41;
      _os_log_impl(&dword_20D965000, v40, OS_LOG_TYPE_DEFAULT, "TDSR:: tdSATModelDirPath : %{public}@", buf, 0xCu);
      v40 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v15->_tdSATModelFilePath;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v73 = v42;
      _os_log_impl(&dword_20D965000, v40, OS_LOG_TYPE_DEFAULT, "TDSR:: tdSATModelFilePath: %{public}@", buf, 0xCu);
      v40 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v73 = v66;
      _os_log_impl(&dword_20D965000, v40, OS_LOG_TYPE_DEFAULT, "TDSR:: tdSrSysConfigRoot : %{public}@", buf, 0xCu);
      v40 = VTLogContextFacilityVoiceTrigger;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v73 = v31;
      _os_log_impl(&dword_20D965000, v40, OS_LOG_TYPE_DEFAULT, "TDSR:: tdSrSysConfigFile : %{public}@", buf, 0xCu);
    }
    if (v8)
    {
      +[VTTextDependentSpeakerRecognizer _createDirectoryIfDoesNotExist:](VTTextDependentSpeakerRecognizer, "_createDirectoryIfDoesNotExist:", v15->_tdSATModelDirPath);
      v70 = 0;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "fileExistsAtPath:isDirectory:", v15->_tdSATModelDirPath, &v70);

      if (v70)
        v45 = v44;
      else
        v45 = 0;
      if ((v45 & 1) == 0)
      {
        v46 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v47 = v15->_tdSATModelDirPath;
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v73 = v47;
          v48 = "TDSR:: Could not create TD-SAT model dir at(%{public}@)";
LABEL_64:
          _os_log_impl(&dword_20D965000, v46, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);
          goto LABEL_70;
        }
        goto LABEL_70;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "fileExistsAtPath:", v15->_tdSATModelFilePath);

      if ((v54 & 1) == 0)
      {
        v46 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v58 = v15->_tdSATModelFilePath;
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v73 = v58;
          v48 = "TDSR:: Could not find TD-SAT model file at(%{public}@); Returning nil for TD-PSR";
          goto LABEL_64;
        }
LABEL_70:
        v52 = 1;
        goto LABEL_71;
      }
    }
    if (!nd_sat_initialize((IntNovDetect *)v15->_novDetect, -[NSString UTF8String](v15->_tdSATModelFilePath, "UTF8String")))
    {
      kdebug_trace();
      v59 = objc_msgSend(objc_alloc(MEMORY[0x24BE2E6E0]), "initWithConfigFile:configRoot:sampleRate:delegate:", v31, v66, 16000, v15);
      speakerVectorGenerator = v15->_speakerVectorGenerator;
      v15->_speakerVectorGenerator = (EARPSRAudioProcessor *)v59;

      kdebug_trace();
      v15->_isTdPsrAbleToProcess = 0;
      v61 = dispatch_queue_create("com.apple.voicetrigger.tdsr-q", 0);
      queue = v15->_queue;
      v15->_queue = (OS_dispatch_queue *)v61;

      v63 = dispatch_queue_create("com.apple.voicetrigger.tdsr-state-q", 0);
      stateSerialQueue = v15->_stateSerialQueue;
      v15->_stateSerialQueue = (OS_dispatch_queue *)v63;

      v52 = 0;
LABEL_71:

      goto LABEL_72;
    }
    v55 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      novDetect = v15->_novDetect;
      if (novDetect)
      {
        if (*((_DWORD *)novDetect + 1) == 2 || *(_DWORD *)novDetect != -1838836561)
          v57 = "Invalid NovDetect object";
        else
          v57 = (const char *)*((_QWORD *)novDetect + 4);
      }
      else
      {
        v57 = "Invalid NovDetect pointer (NULL)";
      }
      *(_DWORD *)buf = 67240450;
      v73[0] = -1;
      LOWORD(v73[1]) = 2082;
      *(_QWORD *)((char *)&v73[1] + 2) = v57;
      _os_log_impl(&dword_20D965000, v55, OS_LOG_TYPE_DEFAULT, "TDSR:: Failed to initialize SAT: err=%{public}d:%{public}s", buf, 0x12u);
    }

    goto LABEL_70;
  }
  v28 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v15->_novDetect;
    if (v29)
    {
      if (*((_DWORD *)v29 + 1) == 2 || *(_DWORD *)v29 != -1838836561)
        v30 = "Invalid NovDetect object";
      else
        v30 = (const char *)*((_QWORD *)v29 + 4);
    }
    else
    {
      v30 = "Invalid NovDetect pointer (NULL)";
    }
    *(_DWORD *)buf = 67240450;
    v73[0] = -1;
    LOWORD(v73[1]) = 2082;
    *(_QWORD *)((char *)&v73[1] + 2) = v30;
    _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "TDSR:: Failed to initialize NDAPI: err=[%{public}d]:%{public}s", buf, 0x12u);
  }

LABEL_49:
LABEL_50:
  v50 = 0;
LABEL_74:

  return v50;
}

- (double)getThresholdSAT
{
  double result;

  -[VTTextDependentSpeakerRecognizer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("threshold_sat"), INFINITY);
  return result;
}

- (double)getCombinationWeight
{
  double result;

  -[VTTextDependentSpeakerRecognizer _getFloatValueForNDAPIConfigOption:defaultValue:](self, "_getFloatValueForNDAPIConfigOption:defaultValue:", CFSTR("td_sr_combination_weight"), 0.0);
  return result;
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
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VTTextDependentSpeakerRecognizer;
  -[VTTextDependentSpeakerRecognizer dealloc](&v4, sel_dealloc);
}

- (BOOL)tdPsrCanProcessRequest
{
  NSObject *stateSerialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__VTTextDependentSpeakerRecognizer_tdPsrCanProcessRequest__block_invoke;
  v5[3] = &unk_24C7F4D00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateSerialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTdPsrCanProcessRequest:(BOOL)a3
{
  NSObject *stateSerialQueue;
  _QWORD v4[5];
  BOOL v5;

  stateSerialQueue = self->_stateSerialQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__VTTextDependentSpeakerRecognizer_setTdPsrCanProcessRequest___block_invoke;
  v4[3] = &unk_24C7F4D98;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(stateSerialQueue, v4);
}

- (void)resetForNewRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__VTTextDependentSpeakerRecognizer_resetForNewRequest__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)processAudio:(const signed __int16 *)a3 numSamples:(unint64_t)a4
{
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, 2 * a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__VTTextDependentSpeakerRecognizer_processAudio_numSamples___block_invoke;
    block[3] = &unk_24C7F4328;
    block[4] = self;
    v10 = v6;
    v11 = a4;
    v8 = v6;
    dispatch_async(queue, block);

  }
}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__VTTextDependentSpeakerRecognizer_endAudio__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)getSATVectorCount
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__VTTextDependentSpeakerRecognizer_getSATVectorCount__block_invoke;
  v5[3] = &unk_24C7F4D00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int)_getSATVectorCount
{
  int v3;
  NSObject *v4;
  void *novDetect;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = nd_sat_vectorcount((uint64_t)self->_novDetect, a2);
  if (v3 < 0)
  {
    v4 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      novDetect = self->_novDetect;
      if (novDetect)
      {
        if (*((_DWORD *)novDetect + 1) == 2 || *(_DWORD *)novDetect != -1838836561)
          v6 = "Invalid NovDetect object";
        else
          v6 = (const char *)*((_QWORD *)novDetect + 4);
      }
      else
      {
        v6 = "Invalid NovDetect pointer (NULL)";
      }
      v8 = 136446210;
      v9 = v6;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "TDSR:: Failed to getSATVectorCount: %{public}s", (uint8_t *)&v8, 0xCu);
    }

  }
  return v3;
}

- (void)updateSAT
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__VTTextDependentSpeakerRecognizer_updateSAT__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)deleteExistingSATModel
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__VTTextDependentSpeakerRecognizer_deleteExistingSATModel__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)deleteVectorAtIndex:(int)a3
{
  IntNovDetect *novDetect;
  NSObject *v5;
  void *v6;
  const char *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect && nd_sat_deletevector(novDetect, *(const char **)&a3))
  {
    v5 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_novDetect;
      if (v6)
      {
        if (*((_DWORD *)v6 + 1) == 2 || *(_DWORD *)v6 != -1838836561)
          v7 = "Invalid NovDetect object";
        else
          v7 = (const char *)*((_QWORD *)v6 + 4);
      }
      else
      {
        v7 = "Invalid NovDetect pointer (NULL)";
      }
      v8[0] = 67240450;
      v8[1] = -1;
      v9 = 2082;
      v10 = v7;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "TDSR:: NDAPI::Failed to nd_sat_deletevector: err=[%{public}d]:%{public}s", (uint8_t *)v8, 0x12u);
    }

  }
}

- (void)psrAudioProcessor:(id)a3 hasResult:(id)a4 numElements:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  void *novDetect;
  float *v14;
  float v15;
  NSObject *v16;
  unint64_t numSamplesProecssed;
  NSObject *v18;
  void *v19;
  const char *v20;
  id WeakRetained;
  double v22;
  int v23;
  double v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = VTLogContextFacilityVoiceTrigger;
  v11 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "TDSR:: SpeakerVector available", (uint8_t *)&v23, 2u);
    }
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
    novDetect = self->_novDetect;
    if (novDetect)
    {
      v14 = (float *)nd_sat_analyze((uint64_t)novDetect, v12, a5);
      if (v14)
      {
        v15 = *v14;
        v16 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          numSamplesProecssed = self->_numSamplesProecssed;
          v23 = 134349312;
          v24 = v15;
          v25 = 2050;
          v26 = numSamplesProecssed;
          _os_log_impl(&dword_20D965000, v16, OS_LOG_TYPE_DEFAULT, "TDSR:: Done: SAT: %{public}f, numSamples: %{public}lu", (uint8_t *)&v23, 0x16u);
        }
      }
      else
      {
        v18 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = self->_novDetect;
          if (v19)
          {
            if (*((_DWORD *)v19 + 1) == 2 || *(_DWORD *)v19 != -1838836561)
              v20 = "Invalid NovDetect object";
            else
              v20 = (const char *)*((_QWORD *)v19 + 4);
          }
          else
          {
            v20 = "Invalid NovDetect pointer (NULL)";
          }
          v23 = 136446210;
          v24 = *(double *)&v20;
          _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: SAT: Failed to compute score: err: %{public}s", (uint8_t *)&v23, 0xCu);
        }

        v15 = 0.0;
      }
      self->_lastRequestSatScore = v15;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      *(float *)&v22 = v15;
      objc_msgSend(WeakRetained, "textDependentSpeakerRecognizer:hasSatScore:", self, v22);

    }
  }
  else if (v11)
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "TDSR:: ERR: speakerVector is nil!", (uint8_t *)&v23, 2u);
  }

}

- (double)_getFloatValueForNDAPIConfigOption:(id)a3 defaultValue:(double)a4
{
  void *v5;
  void *v6;
  float v7;

  -[VTTextDependentSpeakerRecognizer _getValueForNDAPIConfigOption:](self, "_getValueForNDAPIConfigOption:", a3);
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
  IntNovDetect *novDetect;
  IntNovDetect *v7;

  v4 = a3;
  v5 = v4;
  novDetect = (IntNovDetect *)self->_novDetect;
  if (novDetect)
  {
    v7 = nd_getoption(novDetect, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      novDetect = (IntNovDetect *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      novDetect = 0;
    }
  }

  return novDetect;
}

- (void)logWithAudioFilepath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSUInteger v15;
  AudioFileWriter *v16;
  NSMutableData *v17;
  NSObject *v18;
  NSObject *v19;
  NSMutableData *psrAudioDataForLogging;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSUInteger v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: logAudioFilepath is nil", buf, 2u);
    }
    goto LABEL_12;
  }
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileLoggingIsEnabled");

  if ((v6 & 1) == 0)
  {
    v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: logWithAudioFilepath called when AudioFileLogging is NOT enabled.", buf, 2u);
    }
LABEL_12:
    psrAudioDataForLogging = self->_psrAudioDataForLogging;
    self->_psrAudioDataForLogging = 0;

    goto LABEL_13;
  }
  if (-[NSMutableData length](self->_psrAudioDataForLogging, "length"))
  {
    objc_msgSend(v4, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_psr"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("wav"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[NSMutableData length](self->_psrAudioDataForLogging, "length");
      *(_DWORD *)buf = 138412546;
      v29 = v13;
      v30 = 2048;
      v31 = v15 >> 1;
      _os_log_impl(&dword_20D965000, v14, OS_LOG_TYPE_DEFAULT, "TDSR:: Writing psr-audio at : %@, numSamples=%lu", buf, 0x16u);
    }

    v25 = 0x40CF400000000000;
    v26 = xmmword_20DA245E0;
    v27 = xmmword_20DA245F0;
    v22 = 0x40CF400000000000;
    v23 = xmmword_20DA245E0;
    v24 = xmmword_20DA245F0;
    v16 = -[AudioFileWriter initWithURL:inputFormat:outputFormat:]([AudioFileWriter alloc], "initWithURL:inputFormat:outputFormat:", v13, &v25, &v22);
    -[AudioFileWriter addSamples:len:](v16, "addSamples:len:", -[NSMutableData bytes](self->_psrAudioDataForLogging, "bytes"), self->_numSamplesProecssed);
    -[AudioFileWriter close](v16, "close");
    v17 = self->_psrAudioDataForLogging;
    self->_psrAudioDataForLogging = 0;

  }
  else
  {
    v21 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: logWithAudioFilepath called when psrAudioDataForLogging.length==0", buf, 2u);
    }
  }
LABEL_13:

}

- (NSString)tdSATModelFilePath
{
  return self->_tdSATModelFilePath;
}

- (void)setTdSATModelFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_tdSATModelFilePath, a3);
}

- (float)lastRequestSatScore
{
  return self->_lastRequestSatScore;
}

- (void)setLastRequestSatScore:(float)a3
{
  self->_lastRequestSatScore = a3;
}

- (EARPSRAudioProcessor)speakerVectorGenerator
{
  return self->_speakerVectorGenerator;
}

- (void)setSpeakerVectorGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_speakerVectorGenerator, a3);
}

- (VTTextDependentSpeakerRecognizerDelegate)delegate
{
  return (VTTextDependentSpeakerRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)resourcePath
{
  return self->_resourcePath;
}

- (void)setResourcePath:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePath, a3);
}

- (NSString)satDirectory
{
  return self->_satDirectory;
}

- (void)setSatDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_satDirectory, a3);
}

- (NSString)tdSATModelDirPath
{
  return self->_tdSATModelDirPath;
}

- (void)setTdSATModelDirPath:(id)a3
{
  objc_storeStrong((id *)&self->_tdSATModelDirPath, a3);
}

- (NSString)assetHash
{
  return self->_assetHash;
}

- (void)setAssetHash:(id)a3
{
  objc_storeStrong((id *)&self->_assetHash, a3);
}

- (NSData)speakerVector
{
  return self->_speakerVector;
}

- (void)setSpeakerVector:(id)a3
{
  objc_storeStrong((id *)&self->_speakerVector, a3);
}

- (unint64_t)numSamplesProecssed
{
  return self->_numSamplesProecssed;
}

- (void)setNumSamplesProecssed:(unint64_t)a3
{
  self->_numSamplesProecssed = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)stateSerialQueue
{
  return self->_stateSerialQueue;
}

- (void)setStateSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateSerialQueue, a3);
}

- (NSMutableData)psrAudioDataForLogging
{
  return self->_psrAudioDataForLogging;
}

- (void)setPsrAudioDataForLogging:(id)a3
{
  objc_storeStrong((id *)&self->_psrAudioDataForLogging, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psrAudioDataForLogging, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speakerVector, 0);
  objc_storeStrong((id *)&self->_assetHash, 0);
  objc_storeStrong((id *)&self->_tdSATModelDirPath, 0);
  objc_storeStrong((id *)&self->_satDirectory, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_speakerVectorGenerator, 0);
  objc_storeStrong((id *)&self->_tdSATModelFilePath, 0);
}

void __58__VTTextDependentSpeakerRecognizer_deleteExistingSATModel__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 0);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v24 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24;

    v6 = v17;
    if (!v18 && v17)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v7 = v17;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(v7);
            if (*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stringByAppendingPathComponent:");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v26 = v11;
                _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "TDSR:: Removing invalidated speaker model at: %{public}@", buf, 0xCu);
              }
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v17);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = 0;
              objc_msgSend(v13, "removeItemAtPath:error:", v11, &v19);
              v14 = v19;

              if (v14)
              {
                v15 = (id)VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v14, "localizedDescription");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v26 = v11;
                  v27 = 2114;
                  v28 = v16;
                  _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x16u);

                }
              }

            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v8);
      }

      v6 = v17;
    }

  }
}

void __45__VTTextDependentSpeakerRecognizer_updateSAT__block_invoke(uint64_t a1)
{
  const char *v2;
  int v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  int v10;
  _DWORD v11[7];

  *(_QWORD *)&v11[5] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "tdPsrCanProcessRequest"))
  {
    v3 = nd_sat_update(*(IntNovDetect **)(*(_QWORD *)(a1 + 32) + 8), v2);
    v4 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "_getSATVectorCount");
      v10 = 134349056;
      *(_QWORD *)v11 = v5;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "TDSR:: updateSpeakerModel: numSV after update: %{public}ld", (uint8_t *)&v10, 0xCu);
    }

    if (v3)
    {
      v6 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if (v7)
        {
          if (*(_DWORD *)(v7 + 4) == 2 || *(_DWORD *)v7 != -1838836561)
            v8 = "Invalid NovDetect object";
          else
            v8 = *(const char **)(v7 + 32);
        }
        else
        {
          v8 = "Invalid NovDetect pointer (NULL)";
        }
        v10 = 67240450;
        v11[0] = -1;
        LOWORD(v11[1]) = 2082;
        *(_QWORD *)((char *)&v11[1] + 2) = v8;
        _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "TDSR:: Failed to persist via sat_update: %{public}d, %{public}s", (uint8_t *)&v10, 0x12u);
      }

    }
  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "TDSR:: TD-PSR Cannot process request, Not updating td-speaker-model", (uint8_t *)&v10, 2u);
    }
  }
}

uint64_t __53__VTTextDependentSpeakerRecognizer_getSATVectorCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getSATVectorCount");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __44__VTTextDependentSpeakerRecognizer_endAudio__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "tdPsrCanProcessRequest");
  v3 = VTLogContextFacilityVoiceTrigger;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 134349056;
      v8 = v4;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "TDSR:: ending Audio: NumSamples processed: %{public}lu", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endAudio");
  }
  else
  {
    v5 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "tdPsrCanProcessRequest");
      *(_DWORD *)buf = 67240192;
      LODWORD(v8) = v6;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: endAudio called without calling resetForNewRequest: _tdPsrResetSuccessfully: %{public}d", buf, 8u);
    }

  }
}

void __60__VTTextDependentSpeakerRecognizer_processAudio_numSamples___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint8_t buf[4];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "tdPsrCanProcessRequest") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "appendData:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addAudio:", *(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) += *(_QWORD *)(a1 + 48);
  }
  else
  {
    v2 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "tdPsrCanProcessRequest");
      *(_DWORD *)buf = 67240192;
      v5 = v3;
      _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "TDSR:: WARN: processAudio called without calling resetForNewRequest: _tdPsrResetSuccessfully: %{public}d", buf, 8u);
    }

  }
}

void __54__VTTextDependentSpeakerRecognizer_resetForNewRequest__block_invoke(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setTdPsrCanProcessRequest:", 0);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 0;
  kdebug_trace();
  if (nd_reset(*(IntNovDetect **)(*(_QWORD *)(a1 + 32) + 8), v2))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTdPsrCanProcessRequest:", 0);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v3)
    {
      if (*(_DWORD *)(v3 + 4) == 2 || *(_DWORD *)v3 != -1838836561)
        v4 = "Invalid NovDetect object";
      else
        v4 = *(const char **)(v3 + 32);
    }
    else
    {
      v4 = "Invalid NovDetect pointer (NULL)";
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nd_reset failed: %d:%s"), 0xFFFFFFFFLL, v4);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    +[VTTextDependentSpeakerRecognizer errorWithCode:message:](VTTextDependentSpeakerRecognizer, "errorWithCode:message:", -1, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(WeakRetained, "textDependentSpeakerRecognizer:failedWithError:", *(_QWORD *)(a1 + 32), v11);

  }
  else
  {
    kdebug_trace();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "resetForNewRequest");
    objc_msgSend(*(id *)(a1 + 32), "setTdPsrCanProcessRequest:", 1);
    +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileLoggingIsEnabled");

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(_QWORD *)(v9 + 112) = v8;
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v13 + 112);
      *(_QWORD *)(v13 + 112) = 0;
    }

    kdebug_trace();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v14, "timeIntervalSinceDate:", v5);
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2050;
      v22 = v17 * 1000.0;
      _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "TDSR:: Done resetForNewRequest: _speakerVectorGenerator: %{public}@: time for TDSR: %{public}f ms", buf, 0x16u);
    }

  }
}

uint64_t __62__VTTextDependentSpeakerRecognizer_setTdPsrCanProcessRequest___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __58__VTTextDependentSpeakerRecognizer_tdPsrCanProcessRequest__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

+ (BOOL)psrTdAssetExistsAtResourcePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  BOOL v8;
  char v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("config_sr_sat.txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v10);

  if (v10)
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    v8 = 0;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "TDSR:: ERR: expecting file; found dir at: %{public}@",
        buf,
        0xCu);
      v8 = v10 == 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v6 & v8;
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  const __CFString *v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFString *)a4;
  v6 = (__CFString *)v5;
  v7 = (void *)MEMORY[0x24BDD1540];
  if (v5)
    v8 = v5;
  else
    v8 = CFSTR("???");
  v12 = *MEMORY[0x24BDD0FC8];
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("VTTextDependentSpeakerRecognizer"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)_createDirectoryIfDoesNotExist:(id)a3
{
  id v3;
  void *v4;
  char v5;
  int v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v14);
  v6 = v14;
  if (v14)
    v7 = v5;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "TDSR:: Creating Directory : %@", buf, 0xCu);
      v6 = v14;
    }
    if (!v6)
    {
      v9 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "TDSR:: same name of file exists, this will be removed", buf, 2u);
      }
      objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);
    }
    v13 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v13);
    v10 = v13;
    if (v10)
    {
      v11 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "TDSR:: Creating Directory failed : %{public}@", buf, 0xCu);

      }
    }

  }
}

@end
