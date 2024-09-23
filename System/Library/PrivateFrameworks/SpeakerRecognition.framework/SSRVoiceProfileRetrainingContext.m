@implementation SSRVoiceProfileRetrainingContext

- (SSRVoiceProfileRetrainingContext)initWithVoiceRetrainingContext:(id)a3 error:(id *)a4
{
  SSRVoiceProfileRetrainingContext *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  SSRVoiceProfile *voiceProfile;
  void *v11;
  uint64_t v12;
  CSAsset *asset;
  CSAsset *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  SSRVoiceProfileRetrainingContext *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CSAsset *v23;
  uint64_t v24;
  NSString *configVersion;
  float v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  CSAsset *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSURL *resourceFilePath;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSArray *compareVoiceProfileArray;
  char v55;
  uint64_t v56;
  __int128 v57;
  char v58;
  unint64_t spIdType;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  NSArray *v72;
  void *v73;
  void *v74;
  void *v75;
  SSRVoiceProfileModelContext *v76;
  uint64_t v77;
  void *v78;
  unint64_t v79;
  NSObject *v80;
  void *v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void *v83;
  SSRVoiceProfileModelContext *v84;
  uint64_t v85;
  SSRVoiceProfileModelContext *v86;
  void *v87;
  NSObject *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  NSString *sessionId;
  SSRLoggingAggregator *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  SSRLoggingAggregator *logAggregator;
  __int128 v116;
  id v117;
  void *v119;
  id v120;
  _QWORD v121[4];
  SSRVoiceProfileRetrainingContext *v122;
  _BYTE *v123;
  uint64_t v124;
  unint64_t v125;
  objc_super v126;
  const __CFString *v127;
  void *v128;
  uint8_t v129[4];
  const char *v130;
  __int16 v131;
  id v132;
  __int16 v133;
  id v134;
  __int16 v135;
  void *v136;
  _BYTE buf[24];
  uint64_t (*v138)(uint64_t, uint64_t);
  __int128 v139;
  const __CFString *v140;
  void *v141;
  const __CFString *v142;
  void *v143;
  const __CFString *v144;
  _QWORD v145[4];

  v145[1] = *MEMORY[0x24BDAC8D0];
  v120 = a3;
  v126.receiver = self;
  v126.super_class = (Class)SSRVoiceProfileRetrainingContext;
  v5 = -[SSRVoiceProfileRetrainingContext init](&v126, sel_init);
  if (!v5)
    goto LABEL_85;
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingVoiceProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingVoiceProfile")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: VoiceProfile is invalid - Bailing out"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    if (a4)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v144 = CFSTR("reason");
      v145[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, &v144, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 713, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingVoiceProfile"));
  v9 = objc_claimAutoreleasedReturnValue();
  voiceProfile = v5->_voiceProfile;
  v5->_voiceProfile = (SSRVoiceProfile *)v9;

  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingAsset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingAsset"));
    v12 = objc_claimAutoreleasedReturnValue();
    asset = v5->_asset;
    v5->_asset = (CSAsset *)v12;

    v14 = v5->_asset;
  }
  else
  {
    +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfile locale](v5->_voiceProfile, "locale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "installedAssetOfType:forLanguage:", 3, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v5->_asset;
    v5->_asset = (CSAsset *)v22;

    v14 = v5->_asset;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Last known assets are nil - Bailing out"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_error_impl(&dword_2117D4000, v36, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      if (a4)
      {
        v37 = (void *)MEMORY[0x24BDD1540];
        v142 = CFSTR("reason");
        v143 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 107, v38);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_10;
    }
  }
  -[CSAsset configVersion](v14, "configVersion");
  v24 = objc_claimAutoreleasedReturnValue();
  configVersion = v5->_configVersion;
  v5->_configVersion = (NSString *)v24;

  -[CSAsset psrCombinationWeight](v5->_asset, "psrCombinationWeight");
  v5->_combinationWeight = v26;
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingPayloadProfile"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingSpIdType"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingSpIdType"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "intValue") == 0;

      if (!v33)
      {
        objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingSpIdType"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_spIdType = (int)objc_msgSend(v34, "intValue");

        goto LABEL_37;
      }
    }
    v35 = v5->_asset;
    if (CSIsCommunalDevice())
    {

LABEL_33:
      v43 = 3;
LABEL_36:
      v5->_spIdType = v43;
      goto LABEL_37;
    }
    if ((CSIsIOS() & 1) != 0 || (CSIsAppleSiliconMac() & 1) != 0)
    {
      -[CSAsset psrCombinationWeight](v35, "psrCombinationWeight");
      v40 = v39;
      v41 = -[CSAsset useTDTIEnrollment](v35, "useTDTIEnrollment");
      v42 = v40 == 1.0 && v41;

      if (v42)
        goto LABEL_33;
    }
    else
    {

    }
    v43 = 1;
    goto LABEL_36;
  }
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingPayloadProfile"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");
  v30 = 3;
  if (!v29)
    v30 = 1;
  v5->_spIdType = v30;

LABEL_37:
  v44 = (void *)MEMORY[0x24BDBCF48];
  -[CSAsset resourcePath](v5->_asset, "resourcePath");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "URLWithString:", v45);
  v46 = objc_claimAutoreleasedReturnValue();
  resourceFilePath = v5->_resourceFilePath;
  v5->_resourceFilePath = (NSURL *)v46;

  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingCompareVoiceProfiles"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingCompareVoiceProfiles"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: VoiceProfile is invalid - Bailing out"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v15;
        _os_log_error_impl(&dword_2117D4000, v100, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      if (a4)
      {
        v101 = (void *)MEMORY[0x24BDD1540];
        v140 = CFSTR("reason");
        v141 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 713, v102);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_10:

LABEL_11:
      v19 = 0;
      goto LABEL_86;
    }
  }
  v5->_forceRetrain = 0;
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingForce"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingForce"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_forceRetrain = objc_msgSend(v52, "BOOLValue");

  }
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingCompareVoiceProfiles"));
  v53 = objc_claimAutoreleasedReturnValue();
  compareVoiceProfileArray = v5->_compareVoiceProfileArray;
  v5->_compareVoiceProfileArray = (NSArray *)v53;

  v117 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = 1;
  *(_QWORD *)&v57 = 136315906;
  v116 = v57;
  while (1)
  {
    v58 = v55;
    spIdType = v5->_spIdType;
    if (spIdType != 3)
      break;
    if ((v55 & 1) != 0)
      goto LABEL_65;
LABEL_46:
    +[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:](SSRUtils, "satConfigFileNameForCSSpIdType:forModelType:forAssetType:", spIdType, v56, -[CSAsset assetProvider](v5->_asset, "assetProvider", v116));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x24BDBCF48];
    -[CSAsset resourcePath](v5->_asset, "resourcePath");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stringByAppendingPathComponent:", v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "URLWithString:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "path");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v61) = objc_msgSend(v119, "fileExistsAtPath:", v65);

    if ((v61 & 1) != 0)
    {
      -[SSRVoiceProfile voiceProfileModelFilePathForRecognizerType:spIdType:](v5->_voiceProfile, "voiceProfileModelFilePathForRecognizerType:spIdType:", v56, v5->_spIdType);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAsset hashFromResourcePath](v5->_asset, "hashFromResourcePath");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "URLByAppendingPathComponent:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = v5->_spIdType;
      objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingCompareVoiceProfilesSpIdType"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
      {
        objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingCompareVoiceProfilesSpIdType"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v69) = objc_msgSend(v71, "intValue");

        v69 = (int)v69;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v138 = __Block_byref_object_copy__4851;
      *(_QWORD *)&v139 = __Block_byref_object_dispose__4852;
      *((_QWORD *)&v139 + 1) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v72 = v5->_compareVoiceProfileArray;
      v121[0] = MEMORY[0x24BDAC760];
      v121[1] = 3221225472;
      v121[2] = __73__SSRVoiceProfileRetrainingContext_initWithVoiceRetrainingContext_error___block_invoke;
      v121[3] = &unk_24CC857D8;
      v124 = v56;
      v125 = v69;
      v122 = v5;
      v123 = buf;
      -[NSArray enumerateObjectsUsingBlock:](v72, "enumerateObjectsUsingBlock:", v121);
      if (objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware"))
      {
        -[SSRVoiceProfile exclaveVoiceProfileModelFilePathForRecognizerType:spIdType:](v5->_voiceProfile, "exclaveVoiceProfileModelFilePathForRecognizerType:spIdType:", v56, v5->_spIdType);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSAsset hashFromResourcePath](v5->_asset, "hashFromResourcePath");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "URLByAppendingPathComponent:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v76 = [SSRVoiceProfileModelContext alloc];
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
          v77 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        else
          v77 = 0;
        v86 = -[SSRVoiceProfileModelContext initWithConfigFilePath:withModelPath:withModelPathExclave:withCompareModelFilePaths:](v76, "initWithConfigFilePath:withModelPath:withModelPathExclave:withCompareModelFilePaths:", v64, v68, v75, v77);

      }
      else
      {
        v84 = [SSRVoiceProfileModelContext alloc];
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
          v85 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        else
          v85 = 0;
        v86 = -[SSRVoiceProfileModelContext initWithConfigFilePath:withModelPath:withCompareModelFilePaths:](v84, "initWithConfigFilePath:withModelPath:withCompareModelFilePaths:", v64, v68, v85);
      }
      +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v56);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setValue:forKey:", v86, v87);

      v88 = (id)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v5->_spIdType);
        v89 = (id)objc_claimAutoreleasedReturnValue();
        +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v56);
        v90 = (id)objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfile locale](v5->_voiceProfile, "locale");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v129 = v116;
        v130 = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
        v131 = 2114;
        v132 = v89;
        v133 = 2114;
        v134 = v90;
        v135 = 2114;
        v136 = v91;
        _os_log_impl(&dword_2117D4000, v88, OS_LOG_TYPE_DEFAULT, "%s Added model context {%{public}@, %{public}@} for %{public}@", v129, 0x2Au);

      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v78 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v79 = v5->_spIdType;
        v80 = v78;
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v56);
        v82 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        -[SSRVoiceProfile locale](v5->_voiceProfile, "locale");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v116;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v81;
        *(_WORD *)&buf[22] = 2114;
        v138 = v82;
        LOWORD(v139) = 2114;
        *(_QWORD *)((char *)&v139 + 2) = v83;
        _os_log_impl(&dword_2117D4000, v80, OS_LOG_TYPE_DEFAULT, "%s Skipping model {%{public}@, %{public}@} for %{public}@", buf, 0x2Au);

      }
    }

    v55 = 1;
    v56 = 2;
    if ((v58 & 1) != 0)
      goto LABEL_67;
  }
  if ((v55 & (spIdType == 4)) == 0)
    goto LABEL_46;
LABEL_65:
  v92 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v93 = v92;
    +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", spIdType);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", v56);
    v95 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfile locale](v5->_voiceProfile, "locale");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = v116;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v94;
    *(_WORD *)&buf[22] = 2114;
    v138 = v95;
    LOWORD(v139) = 2114;
    *(_QWORD *)((char *)&v139 + 2) = v96;
    _os_log_impl(&dword_2117D4000, v93, OS_LOG_TYPE_DEFAULT, "%s Skipping SAT Model {%{public}@, %{public}@} for %{public}@", buf, 0x2Au);

  }
LABEL_67:
  if (objc_msgSend(v117, "count", v116))
    v97 = v117;
  else
    v97 = 0;
  objc_storeStrong((id *)&v5->_modelsContext, v97);
  if (!v5->_modelsContext)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: _modelsContext is nil - Bailing out"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v103;
      _os_log_error_impl(&dword_2117D4000, v104, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    if (a4)
    {
      v105 = (void *)MEMORY[0x24BDD1540];
      v127 = CFSTR("reason");
      v128 = v103;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 713, v106);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend(v120, "objectForKeyedSubscript:", CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_filterToVoiceTriggerUtterances = objc_msgSend(v99, "BOOLValue");

  }
  else
  {
    v5->_filterToVoiceTriggerUtterances = 0;
  }
  v5->_maxAllowedSpeakerVectors = -[CSAsset maxAllowedEnrollmentUtterances](v5->_asset, "maxAllowedEnrollmentUtterances");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "UUIDString");
  v108 = objc_claimAutoreleasedReturnValue();
  sessionId = v5->_sessionId;
  v5->_sessionId = (NSString *)v108;

  v110 = [SSRLoggingAggregator alloc];
  -[SSRVoiceProfile locale](v5->_voiceProfile, "locale");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset configVersion](v5->_asset, "configVersion");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = -[SSRLoggingAggregator initWithEvent:locale:configVersion:](v110, "initWithEvent:locale:configVersion:", CFSTR("retraining"), v111, v112);
  logAggregator = v5->_logAggregator;
  v5->_logAggregator = (SSRLoggingAggregator *)v113;

LABEL_85:
  v19 = v5;
LABEL_86:

  return v19;
}

- (id)description
{
  void *v2;
  NSString *sessionId;
  CSAsset *asset;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  sessionId = self->_sessionId;
  asset = self->_asset;
  -[SSRVoiceProfile profileID](self->_voiceProfile, "profileID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[SessionId: %@, Asset: %@, ProfileID: %@]"), sessionId, asset, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSArray)compareVoiceProfileArray
{
  return self->_compareVoiceProfileArray;
}

- (void)setCompareVoiceProfileArray:(id)a3
{
  objc_storeStrong((id *)&self->_compareVoiceProfileArray, a3);
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

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (BOOL)filterToVoiceTriggerUtterances
{
  return self->_filterToVoiceTriggerUtterances;
}

- (BOOL)forceRetrain
{
  return self->_forceRetrain;
}

- (unint64_t)maxAllowedSpeakerVectors
{
  return self->_maxAllowedSpeakerVectors;
}

- (NSDictionary)modelsContext
{
  return self->_modelsContext;
}

- (float)combinationWeight
{
  return self->_combinationWeight;
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
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
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_modelsContext, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_voiceProfile, 0);
  objc_storeStrong((id *)&self->_compareVoiceProfileArray, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

void __73__SSRVoiceProfileRetrainingContext_initWithVoiceRetrainingContext_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a1[6];
  v4 = a1[7];
  v5 = a2;
  objc_msgSend(v5, "voiceProfileModelFilePathForRecognizerType:spIdType:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 80), "hashFromResourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(v5, "profileID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:forKey:", v10, v9);
}

@end
