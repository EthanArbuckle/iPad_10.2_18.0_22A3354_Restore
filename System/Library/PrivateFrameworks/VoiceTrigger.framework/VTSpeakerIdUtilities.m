@implementation VTSpeakerIdUtilities

+ (id)getSATDirectoryForLanguageCode:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (__CFString *)a3;
  CPSharedResourcesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/VoiceTrigger/SAT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = v3;
  else
    v7 = CFSTR("xx_XX");
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringForVTSpIdType:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 - 1 < 3)
    return off_24C7F3B78[a3 - 1];
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "ERR: Unknown VTSpIdType:%lu", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

+ (id)getSATDirectoryForModelType:(unint64_t)a3 forLanguageCode:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForLanguageCode:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities stringForVTSpIdType:](VTSpeakerIdUtilities, "stringForVTSpIdType:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v10 = "ERR: SAT Base Directory path is nil - Bailing out";
      v11 = v9;
      v12 = 2;
LABEL_8:
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!v6)
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = a3;
      v10 = "ERR: Invalid SpIdType %ld - Bailing out";
      v11 = v13;
      v12 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v8;
}

+ (id)getSATModelDirectoryForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[VTSpeakerIdUtilities getSATDirectoryForModelType:forLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForModelType:forLanguageCode:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("model"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "ERR: Invalid ModelType path for SpIdType %ld - Bailing out", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)getSATAudioDirectoryForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[VTSpeakerIdUtilities getSATDirectoryForModelType:forLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForModelType:forLanguageCode:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("audio"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "ERR: Invalid ModelType path for SpIdType %ld - Bailing out", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)createSATDirectoriesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATModelDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATModelDirectoryForType:forLanguageCode:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, 0);

  v10 = 0;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v12 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v26);
    v10 = v26;

    v13 = VTLogContextFacilityVoiceTrigger;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
        _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "Creating SAT audio directory at path %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v21 = v13;
      objc_msgSend(v10, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v6;
      v29 = 2114;
      v30 = v22;
      _os_log_error_impl(&dword_20D965000, v21, OS_LOG_TYPE_ERROR, "Couldn't create SAT audio directory at path %{public}@ %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v7, 0);

  if ((v15 & 1) != 0)
  {
    v16 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v25);
    v16 = v25;

    v19 = VTLogContextFacilityVoiceTrigger;
    if ((v18 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = v7;
        _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "Creating SAT model directory at path %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v23 = v19;
      objc_msgSend(v16, "localizedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      v29 = 2114;
      v30 = v24;
      _os_log_error_impl(&dword_20D965000, v23, OS_LOG_TYPE_ERROR, "Couldn't create SAT model directory at path %{public}@ %{public}@", buf, 0x16u);

    }
  }

  return v16;
}

+ (id)getSpeakerModelPathForType:(unint64_t)a3 withLanguageCode:(id)a4 withConfigPath:(id)a5 createDirectory:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  if (v6)
    v11 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", a3, v9);
  +[VTSpeakerIdUtilities _getAssetHashFromConfigPath:](VTSpeakerIdUtilities, "_getAssetHashFromConfigPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATModelDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATModelDirectoryForType:forLanguageCode:", a3, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)getProfileVersionFilePathForLanguageCode:(id)a3
{
  void *v3;
  void *v4;

  +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForLanguageCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("enrollment_version.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_getAssetHashFromConfigPath:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("com_apple_MobileAsset_VoiceTriggerAssets/"));
  v6 = v5;
  v7 = objc_msgSend(v3, "rangeOfString:", CFSTR(".asset"));
  v9 = CFSTR("nohash");
  if (v6 && v8)
  {
    objc_msgSend(v3, "substringWithRange:", v4 + v6, v7 - (v4 + v6));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)getExplicitEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  id v23;

  v5 = a4;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__574;
  v21 = __Block_byref_object_dispose__575;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__VTSpeakerIdUtilities_getExplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke;
  v14[3] = &unk_24C7F3AD0;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_591);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v18[5], "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  return v12;
}

+ (id)getSortedImplicitEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id v25;

  v5 = a4;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__574;
  v23 = __Block_byref_object_dispose__575;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke;
  v16[3] = &unk_24C7F3AD0;
  v11 = v6;
  v17 = v11;
  v18 = &v19;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v20[5], "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_34);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  return v14;
}

+ (id)getImplicitEnrollmentUtterancesPriorTo:(id)a3 forType:(unint64_t)a4 forLanguageCode:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;

  v7 = a3;
  v8 = a5;
  if (v7)
  {
    +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", a4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v9, &v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v31;

      *(_QWORD *)buf = 0;
      v26 = buf;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__574;
      v29 = __Block_byref_object_dispose__575;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count") + 1);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke;
      v22[3] = &unk_24C7F3AD0;
      v23 = v9;
      v24 = buf;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);
      v14 = (void *)MEMORY[0x24BDD1758];
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke_2;
      v20[3] = &unk_24C7F3B58;
      v21 = v7;
      objc_msgSend(v14, "predicateWithBlock:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v26 + 5), "filteredArrayUsingPredicate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v18 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20D965000, v18, OS_LOG_TYPE_ERROR, "ERR: satAudioDirectory is nil - Bailing out", buf, 2u);
      }
      v12 = 0;
      v16 = 0;
    }

  }
  else
  {
    v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v17, OS_LOG_TYPE_ERROR, "ERR: date is nil - Bailing out", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

+ (id)getSortedEnrollmentUtterancesForType:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a4;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__574;
  v24 = __Block_byref_object_dispose__575;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __77__VTSpeakerIdUtilities_getSortedEnrollmentUtterancesForType_forLanguageCode___block_invoke;
  v17 = &unk_24C7F3AD0;
  v9 = v6;
  v18 = v9;
  v19 = &v20;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v14);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.wav'"), v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21[5], "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  return v12;
}

+ (id)timeStampWithSaltGrain
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd"));
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)arc4random_uniform(7u) * -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)deleteExistingSATModelForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **p_cache;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  unint64_t v27;
  void **v28;
  void *v29;
  BOOL v30;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[VTSpeakerIdUtilities getSATModelDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATModelDirectoryForType:forLanguageCode:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("/tmp")))
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v4;
      v6 = "ERR: trying to remove %@ directory, bailing out";
LABEL_27:
      _os_log_error_impl(&dword_20D965000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      v30 = 0;
      goto LABEL_25;
    }
LABEL_21:
    v30 = 0;
    goto LABEL_25;
  }
  if (!v4)
  {
    v5 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v3;
      v6 = "ERR: satTDModelDirector is nil for LanguageCode %@";
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  v7 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v4, &v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v40;

    if (!v12 && v11)
    {
      v32 = v11;
      v33 = v3;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v37;
        p_cache = &OBJC_METACLASS___VTSiriNotifications.cache;
        do
        {
          v18 = 0;
          v34 = v15;
          do
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v13);
            if (*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v18))
            {
              objc_msgSend(v4, "stringByAppendingPathComponent:");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v7 + 1408), "defaultManager");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 0;
              objc_msgSend(v20, "removeItemAtPath:error:", v19, &v35);
              v21 = v35;

              if (v21)
              {
                v22 = p_cache[343];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = v22;
                  objc_msgSend(v21, "localizedDescription");
                  v24 = v16;
                  v25 = v13;
                  v26 = v4;
                  v27 = v7;
                  v28 = p_cache;
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v42 = v19;
                  v43 = 2114;
                  v44 = v29;
                  _os_log_impl(&dword_20D965000, v23, OS_LOG_TYPE_DEFAULT, "Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x16u);

                  p_cache = v28;
                  v7 = v27;
                  v4 = v26;
                  v13 = v25;
                  v16 = v24;
                  v15 = v34;

                }
              }

            }
            ++v18;
          }
          while (v15 != v18);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v15);
      }

      v11 = v32;
      v3 = v33;
      v12 = 0;
    }

  }
  v30 = 1;
LABEL_25:

  return v30;
}

void __77__VTSpeakerIdUtilities_getSortedEnrollmentUtterancesForType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

void __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

uint64_t __87__VTSpeakerIdUtilities_getImplicitEnrollmentUtterancesPriorTo_forType_forLanguageCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("wav"));

  if (!v5)
    goto LABEL_10;
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("json"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUtteranceMetadataManager recordedTimeStampOfFile:](VTUtteranceMetadataManager, "recordedTimeStampOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[VTUtteranceMetadataManager isUtteranceImplicitlyTrained:](VTUtteranceMetadataManager, "isUtteranceImplicitlyTrained:", v10)|| !v9)
  {

    goto LABEL_9;
  }
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v12 = v11;

  if (v12 >= 0.0)
  {
LABEL_9:

LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v13 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "Filtered %@ with enrolled date %@", (uint8_t *)&v16, 0x16u);
  }

  v14 = 1;
LABEL_11:

  return v14;
}

void __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

uint64_t __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUtteranceMetadataManager recordedTimeStampOfFile:](VTUtteranceMetadataManager, "recordedTimeStampOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUtteranceMetadataManager recordedTimeStampOfFile:](VTUtteranceMetadataManager, "recordedTimeStampOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v13 = objc_msgSend(v7, "compare:", v9);
LABEL_15:
    v12 = v13;
    goto LABEL_16;
  }
  if (v7)
    v11 = v9 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v12 = 1;
  }
  else
  {
    if (v7 || !v9)
    {
      v13 = objc_msgSend(v4, "compare:options:", v5, 1);
      goto LABEL_15;
    }
    v12 = -1;
  }
LABEL_16:

  return v12;
}

uint64_t __85__VTSpeakerIdUtilities_getSortedImplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("wav"));

  if (!v4)
    goto LABEL_4;
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "stringByAppendingPathExtension:", CFSTR("json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = +[VTUtteranceMetadataManager isUtteranceImplicitlyTrained:](VTUtteranceMetadataManager, "isUtteranceImplicitlyTrained:", v7);

  if ((v5 & 1) != 0)
    v8 = 1;
  else
LABEL_4:
    v8 = 0;

  return v8;
}

void __79__VTSpeakerIdUtilities_getExplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

uint64_t __79__VTSpeakerIdUtilities_getExplicitEnrollmentUtterancesForType_forLanguageCode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("wav"));

  if (!v4)
    goto LABEL_3;
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = +[VTUtteranceMetadataManager isUtteranceImplicitlyTrained:](VTUtteranceMetadataManager, "isUtteranceImplicitlyTrained:", v7);

  if (!(_DWORD)v5)
    v8 = 1;
  else
LABEL_3:
    v8 = 0;

  return v8;
}

@end
