@implementation VTUtteranceMetadataManager

+ (void)saveUtteranceMetadataForUtterance:(id)a3 isExplicitEnrollment:(BOOL)a4 isHandheldEnrollment:(BOOL)a5 withBiometricResult:(unint64_t)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];

  v7 = a5;
  v8 = a4;
  v10 = a3;
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(a1, "_getBaseMetaDictionaryForUtterancePath:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v14 = CFSTR("explicit");
    else
      v14 = CFSTR("implicit");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("trainingType"));
    if (v7)
      v15 = CFSTR("near-field");
    else
      v15 = CFSTR("far-field");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("handheld"));
    +[VTSpeakerIdUtilities timeStampWithSaltGrain](VTSpeakerIdUtilities, "timeStampWithSaltGrain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("grainedDate"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("otherSourceProfileMatch"));

    objc_msgSend(a1, "_writeMetaDict:forUtterancePath:", v13, v10);
  }
  else
  {
    v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "ERR: called with nil uttPath", v19, 2u);
    }
  }

}

+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v10[0] = CFSTR("productType");
    +[VTUtilities deviceProductType](VTUtilities, "deviceProductType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v10[1] = CFSTR("productVersion");
    +[VTUtilities deviceProductVersion](VTUtilities, "deviceProductVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = CFSTR("utteranceWav");
    v11[1] = v5;
    v11[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "ERR: called with nil uttPath", v9, 2u);
    }
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v6;
}

+ (void)_writeMetaDict:(id)a3 forUtterancePath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 1, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if (v8)
      {
        v9 = (void *)VTLogContextFacilityVoiceTrigger;
        if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
LABEL_13:

          goto LABEL_14;
        }
        v10 = v9;
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "::: Error creating json Metadata: %{public}@", buf, 0xCu);

      }
      else
      {
        objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".wav"), CFSTR(".json"));
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "writeToFile:atomically:", v10, 0);
      }

      goto LABEL_13;
    }
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "ERR: called with nil uttMeta";
      goto LABEL_10;
    }
  }
  else
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "ERR: called with nil uttPath";
LABEL_10:
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
  }
LABEL_14:

}

+ (void)saveMetaVersionFileAtSATAudioDirectory:(id)a3
{
  id v3;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("meta_version.json"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[VTUtteranceMetadataManager _saveMetaVersionFileAtPath:](VTUtteranceMetadataManager, "_saveMetaVersionFileAtPath:", v3);

}

+ (void)upgradeMetaFilesIfNecessaaryAtSATRoot:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _QWORD v33[5];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCC60];
  v33[0] = *MEMORY[0x24BDBCCD0];
  v33[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v6, 0, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (!v8)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v7;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (!v10)
      goto LABEL_18;
    v11 = v10;
    v19 = v4;
    v20 = v3;
    v12 = *(_QWORD *)v24;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
      v21 = 0;
      v22 = 0;
      objc_msgSend(v14, "getResourceValue:forKey:error:", &v22, v5, &v21);
      v15 = v22;
      v16 = v21;
      if (v16)
      {
        v17 = v16;
        v18 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v14;
          v31 = 2114;
          v32 = v17;
          _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "Error determining if file is dir-entry: url=%{public}@, err=%{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (!objc_msgSend(v15, "BOOLValue"))
          goto LABEL_9;
        objc_msgSend(v14, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[VTUtteranceMetadataManager _upgradeLocaleDirectoryIfNecessary:](VTUtteranceMetadataManager, "_upgradeLocaleDirectoryIfNecessary:", v17);
      }

LABEL_9:
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (!v11)
        {
          v4 = v19;
          v3 = v20;
          goto LABEL_18;
        }
        goto LABEL_7;
      }
    }
  }
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v3;
    v31 = 2114;
    v32 = v8;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Error reading contents of SAT root: %{public}@: err: %{public}@", buf, 0x16u);
  }
LABEL_18:

}

+ (void)_saveMetaVersionFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = CFSTR("meta_version");
  v12[0] = &unk_24C802FE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "ERROR creating meta-version json-data from dict: ERR: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "writeToURL:atomically:", v3, 0);
  }

}

+ (void)_upgradeLocaleDirectoryIfNecessary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _QWORD v45[4];

  v45[1] = *MEMORY[0x24BDAC8D0];
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[VTUtteranceMetadataManager _audioDirectoryNeedsUpgrade:](VTUtteranceMetadataManager, "_audioDirectoryNeedsUpgrade:", v4))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = *MEMORY[0x24BDBCCD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v34 = v5;
    objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v6, 0, &v39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v39;

    if (v8)
    {
      v9 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v42 = v4;
        v43 = 2114;
        v44 = v8;
        _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Error reading contents of audioDir: %{public}@, err: %{public}@", buf, 0x16u);
      }
      goto LABEL_24;
    }
    v30 = 0;
    v31 = v4;
    v32 = v3;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v11)
    {
LABEL_23:

      v4 = v31;
      objc_msgSend(v31, "URLByAppendingPathComponent:", CFSTR("meta_version.json"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[VTUtteranceMetadataManager _saveMetaVersionFileAtPath:](VTUtteranceMetadataManager, "_saveMetaVersionFileAtPath:", v28);

      v3 = v32;
      v7 = v29;
      v8 = v30;
LABEL_24:

      goto LABEL_25;
    }
    v12 = v11;
    v13 = CFSTR("meta_version.json");
    v14 = *(_QWORD *)v36;
LABEL_8:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
      objc_msgSend(v17, "absoluteString", v29, v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("enrollment_completed")) & 1) != 0
        || (objc_msgSend(v19, "isEqualToString:", v13) & 1) != 0)
      {
        goto LABEL_11;
      }
      v20 = v13;
      objc_msgSend(v17, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pathExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("wav"));

      if (v23)
      {
        objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".wav"), CFSTR(".json"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "fileExistsAtPath:", v24) & 1) == 0)
        {
          v27 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v42 = v21;
            _os_log_impl(&dword_20D965000, v27, OS_LOG_TYPE_DEFAULT, "Missing meta-file: Creating new Meta file for audio file: %{public}@", buf, 0xCu);
          }
          objc_msgSend(a1, "_getBaseMetaDictionaryForUtterancePath:", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_writeMetaDict:forUtterancePath:", v16, v21);

          goto LABEL_10;
        }

      }
      objc_msgSend(v17, "pathExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("json"));

      if (v26)
        +[VTUtteranceMetadataManager _upgradeUtteranceMeta:](VTUtteranceMetadataManager, "_upgradeUtteranceMeta:", v17);
LABEL_10:

      v13 = v20;
LABEL_11:

      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (!v12)
          goto LABEL_23;
        goto LABEL_8;
      }
    }
  }
LABEL_25:

}

+ (BOOL)_audioDirectoryNeedsUpgrade:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("meta_version.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
      if (v9)
      {
        v10 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v17 = v3;
          v18 = 2114;
          v19 = v9;
          _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Json-Err reading metaVersionFile: %{public}@: err: %{public}@", buf, 0x16u);
        }
        v11 = 1;
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("meta_version"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (unint64_t)objc_msgSend(v13, "unsignedIntegerValue") < 4;

      }
    }
    else
    {
      v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v3;
        _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0xCu);
      }
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (void)_upgradeUtteranceMeta:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v25);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v25;
      if (v7)
      {
        v8 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v7;
          _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "error reading meta-file: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
        v13 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v13;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("utteranceWav"));
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productType"));
        v14 = objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          +[VTUtilities deviceProductType](VTUtilities, "deviceProductType");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v23 = (void *)v14;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("productType"));
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productVersion"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          +[VTUtilities deviceProductVersion](VTUtilities, "deviceProductVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("productVersion"));
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trainingType"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("explicit")))
            v18 = CFSTR("explicit");
          else
            v18 = CFSTR("implicit");
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("trainingType"));
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handheld"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          if (objc_msgSend(v19, "isEqualToString:", CFSTR("near-field")))
            v21 = CFSTR("near-field");
          else
            v21 = CFSTR("far-field");
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, CFSTR("handheld"));
        }
        objc_msgSend(v4, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_writeMetaDict:forUtterancePath:", v11, v22);

      }
    }
    else
    {
      v10 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v4;
        _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "ERR: Unexpected. metaData is nil while the uttMetaPath exists at: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "ERR: uttMetaURL is nil", buf, 2u);
    }
  }

}

+ (BOOL)isUtteranceImplicitlyTrained:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCE50];
    -[__CFString path](v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (__CFString *)v18;
      if (v9)
      {
        v10 = VTLogContextFacilityVoiceTrigger;
        v11 = 0;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v20 = v4;
          v21 = 2114;
          v22 = v9;
          _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "ERR: read metafile %{public}@ failed with %{public}@ - defaulting to NO", buf, 0x16u);
          v11 = 0;
        }
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trainingType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v11 = objc_msgSend(v14, "isEqualToString:", CFSTR("implicit"));
        }
        else
        {
          v16 = VTLogContextFacilityVoiceTrigger;
          v11 = 0;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v20 = CFSTR("trainingType");
            v21 = 2114;
            v22 = v4;
            _os_log_impl(&dword_20D965000, v16, OS_LOG_TYPE_DEFAULT, "ERR: missing %{public}@ key in %{public}@ - defaulting to NO", buf, 0x16u);
            v11 = 0;
          }
        }

      }
    }
    else
    {
      v13 = VTLogContextFacilityVoiceTrigger;
      v11 = 0;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v4;
        _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "ERR: metaData is nil, defaulting to NO for %{public}@", buf, 0xCu);
        v11 = 0;
      }
    }

  }
  else
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    v11 = 0;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "ERR: uttMetaURL is nil, defaulting to NO", buf, 2u);
      v11 = 0;
    }
  }

  return v11;
}

+ (id)recordedTimeStampOfFile:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "stringByAppendingPathExtension:", CFSTR("json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;
      if (v10)
      {
        v11 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v21 = v3;
          v22 = 2114;
          v23 = v10;
          _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "Json-Err reading metaVersionFile: %{public}@: err: %{public}@", buf, 0x16u);
        }
        v12 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("grainedDate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
          objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLocale:", v17);

          objc_msgSend(v16, "setDateFormat:", CFSTR("yyyyMMdd"));
          objc_msgSend(v16, "dateFromString:", v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v14 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v6;
        _os_log_impl(&dword_20D965000, v14, OS_LOG_TYPE_DEFAULT, "ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0xCu);
      }
      v12 = 0;
    }

  }
  else
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "ERR: %{public}@ is not present", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

@end
