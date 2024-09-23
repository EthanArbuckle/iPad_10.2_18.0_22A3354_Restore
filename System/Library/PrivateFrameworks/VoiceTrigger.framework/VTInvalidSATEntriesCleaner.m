@implementation VTInvalidSATEntriesCleaner

+ (id)cleanupInvalidSATEntriesAtSATRoot:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4 dryRun:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  id v31;
  void *v32;
  int64_t v33;
  _BOOL4 v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  _QWORD v48[5];

  v5 = a5;
  v48[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBCC60];
  v48[0] = *MEMORY[0x24BDBCCD0];
  v48[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v32 = v8;
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v10, 0, &v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v42;

  if (v12)
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v45 = v7;
      v46 = 2114;
      v47 = v12;
      _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "Error reading contents of SAT root: %{public}@: err: %{public}@", buf, 0x16u);
    }
    v14 = 0;
    goto LABEL_32;
  }
  v33 = a4;
  v31 = v7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v30 = v11;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v16)
  {
    v17 = v16;
    v34 = v5;
    v12 = 0;
    v18 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v36 = 0;
        v37 = 0;
        objc_msgSend(v20, "getResourceValue:forKey:error:", &v37, v9, &v36);
        v21 = v37;
        v22 = v36;

        if (v22)
        {
          v23 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v45 = v20;
            v46 = 2114;
            v47 = v22;
            _os_log_impl(&dword_20D965000, v23, OS_LOG_TYPE_DEFAULT, "Error determining if file is dir-entry: url=%{public}@, err=%{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error determining if file is a dir: url: %@, err: %@"), v20, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v24);

LABEL_17:
          v12 = 0;
LABEL_18:

          goto LABEL_10;
        }
        if (objc_msgSend(v21, "BOOLValue"))
        {
          objc_msgSend(v20, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[VTInvalidSATEntriesCleaner cleanupOrphanedMetafilesForLanguage:payloadUtteranceLifeTimeInDays:dryRun:](VTInvalidSATEntriesCleaner, "cleanupOrphanedMetafilesForLanguage:payloadUtteranceLifeTimeInDays:dryRun:", v25, v33, v34);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22)
            objc_msgSend(v14, "addObjectsFromArray:", v22);
          goto LABEL_17;
        }
        v26 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v20;
          _os_log_impl(&dword_20D965000, v26, OS_LOG_TYPE_DEFAULT, "Deleting invalid SAT file-entry: %{public}@", buf, 0xCu);
        }
        objc_msgSend(v20, "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v27);

        if (v34)
        {
          v12 = 0;
          goto LABEL_10;
        }
        v35 = 0;
        objc_msgSend(v32, "removeItemAtURL:error:", v20, &v35);
        v12 = v35;
        if (v12)
        {
          v28 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v45 = v20;
            v46 = 2114;
            v47 = v12;
            _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "Error deleting invalid SAT file-entry=%{public}@, err=%{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error deleting invalid SAT file-entry: url: %@, err: %@"), v20, v12);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);
          goto LABEL_18;
        }
LABEL_10:

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (!v17)
        goto LABEL_31;
    }
  }
  v12 = 0;
LABEL_31:

  v11 = v30;
  v7 = v31;
LABEL_32:

  return v14;
}

+ (id)cleanupOrphanedMetafilesForLanguage:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4 dryRun:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Processing lang_dir: %{public}@", buf, 0xCu);
  }
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cleanupOrphanedMetafilesAtURL:dryRun:", v11, v5);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v9, "addObjectsFromArray:", v12);
  v24 = (void *)v12;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 3, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cleanupOrphanedMetafilesAtURL:dryRun:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v9, "addObjectsFromArray:", v14);
  v15 = a4;
  objc_msgSend(a1, "cleanupPayloadUtterancesExceedingLifeTimeInDays:forType:forLanguageCode:dryRun:", a4, 3, v8, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v9, "addObjectsFromArray:", v16);
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 2, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cleanupOrphanedMetafilesAtURL:dryRun:", v18, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v9, "addObjectsFromArray:", v19);
  objc_msgSend(a1, "cleanupPayloadUtterancesExceedingLifeTimeInDays:forType:forLanguageCode:dryRun:", v15, 2, v8, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v9, "addObjectsFromArray:", v20);
  v21 = (void *)objc_msgSend(v9, "copy");

  return v21;
}

+ (id)cleanupOrphanedMetafilesAtURL:(id)a3 dryRun:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v39;
  id v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  id v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = *MEMORY[0x24BDBCCD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v41 = v6;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v7, 0, &v54);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v54;

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error reading contents of audioDir: %@, err: %@"), v5, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v56 = v10;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    v61 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  v42 = a4;
  v40 = v5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("meta_version.json"), "stringByDeletingPathExtension");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v39 = v8;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v19, "absoluteString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByDeletingPathExtension");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "compare:", CFSTR("enrollment_completed"))
          && (objc_msgSend(v22, "isEqualToString:", v44) & 1) == 0)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v13, "removeObjectForKey:", v22);
          else
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v22);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v10 = v13;
  v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v24)
  {
    v25 = v24;
    v43 = 0;
    v26 = *(_QWORD *)v47;
    while (1)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v10);
        v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        objc_msgSend(v10, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "pathExtension");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "compare:", CFSTR("json"));

        v33 = VTLogContextFacilityVoiceTrigger;
        v34 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
        if (v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 138543362;
            v56 = v30;
            _os_log_impl(&dword_20D965000, v33, OS_LOG_TYPE_DEFAULT, "Found non-meta file: %{public}@", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found non meta-file: %@"), v30);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
          objc_msgSend(v12, "addObject:", v28);

          goto LABEL_23;
        }
        if (v34)
        {
          *(_DWORD *)buf = 138543618;
          v56 = v29;
          v57 = 2114;
          v58 = v30;
          _os_log_impl(&dword_20D965000, v33, OS_LOG_TYPE_DEFAULT, "Deleting invalid SAT entry: %{public}@ : <%{public}@>", buf, 0x16u);
        }
        objc_msgSend(v30, "absoluteString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v35);

        if (!v42)
        {
          v45 = v43;
          objc_msgSend(v41, "removeItemAtURL:error:", v30, &v45);
          v36 = v45;

          if (v36)
          {
            v37 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v56 = v30;
              v57 = 2114;
              v58 = v36;
              _os_log_impl(&dword_20D965000, v37, OS_LOG_TYPE_DEFAULT, "Error deleting entry: %{public}@:%{public}@", buf, 0x16u);
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error deleting entry: %@:%@"), v30, v36);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v36;
            goto LABEL_22;
          }
          v43 = 0;
        }
LABEL_23:

      }
      v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      if (!v25)
        goto LABEL_38;
    }
  }
  v43 = 0;
LABEL_38:

  v8 = v39;
  v5 = v40;
  v9 = v43;
LABEL_39:

  return v12;
}

+ (id)cleanupPayloadUtterancesExceedingLifeTimeInDays:(int64_t)a3 forType:(unint64_t)a4 forLanguageCode:(id)a5 dryRun:(BOOL)a6
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[4];
  BOOL v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a3 * -86400.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = VTLogContextFacilityVoiceTrigger;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v9;
      v20 = 1024;
      v21 = a4;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "Checking payload utterances prior to %{public}@ for language %{public}@ and modelType %d", buf, 0x1Cu);
    }
    +[VTSpeakerIdUtilities getImplicitEnrollmentUtterancesPriorTo:forType:forLanguageCode:](VTSpeakerIdUtilities, "getImplicitEnrollmentUtterancesPriorTo:forType:forLanguageCode:", v10, a4, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __109__VTInvalidSATEntriesCleaner_cleanupPayloadUtterancesExceedingLifeTimeInDays_forType_forLanguageCode_dryRun___block_invoke;
    v14[3] = &__block_descriptor_33_e25_v32__0__NSString_8Q16_B24l;
    v15 = a6;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v11, OS_LOG_TYPE_ERROR, "ERR: obsoleteCutOffDate is nil - Bailing out", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

void __109__VTInvalidSATEntriesCleaner_cleanupPayloadUtterancesExceedingLifeTimeInDays_forType_forLanguageCode_dryRun___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "removeItemAtPath:error:", v3, &v13);
    v5 = v13;

    v6 = VTLogContextFacilityVoiceTrigger;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v3;
        v16 = 2114;
        v17 = v5;
        _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "ERR: Failed deleting %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v3;
      _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "Deleted lifetimeexpired SAT entry %{public}@", buf, 0xCu);
    }

    objc_msgSend(v3, "stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("json"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v9, "removeItemAtPath:error:", v8, &v12);
    v10 = v12;

    v11 = VTLogContextFacilityVoiceTrigger;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v8;
        v16 = 2114;
        v17 = v10;
        _os_log_error_impl(&dword_20D965000, v11, OS_LOG_TYPE_ERROR, "ERR: Failed deleting %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "Deleted lifetimeexpired metafile %{public}@", buf, 0xCu);
    }

  }
}

@end
