@implementation VTVoiceProfileMigration

+ (unint64_t)getCurrentVoiceProfileVersionForLanguageCode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:](VTSpeakerIdUtilities, "getProfileVersionFilePathForLanguageCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  if (!objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v19))
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ doesnt exist!!!", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (v19)
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "ERR:%{public}@ is a directory!!!", buf, 0xCu);
      v8 = 0;
      goto LABEL_8;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v11, 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (v8)
    v15 = v14 == 0;
  else
    v15 = 0;
  if (!v15)
  {
    v16 = v14;
    v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v16;
      _os_log_error_impl(&dword_20D965000, v17, OS_LOG_TYPE_ERROR, "ERR: Could not read existing %@ file: err: %@", buf, 0x16u);
    }

    v12 = 0;
    goto LABEL_10;
  }

LABEL_8:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VoiceProfileCompatabiltyVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VoiceProfileCompatabiltyVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (int)objc_msgSend(v11, "intValue");
LABEL_10:

LABEL_12:
  return v12;
}

+ (BOOL)checkIfMigrationNecessaryForCompatibilityVersion:(unint64_t)a3 forLanguageCode:(id)a4
{
  return +[VTVoiceProfileMigration getCurrentVoiceProfileVersionForLanguageCode:](VTVoiceProfileMigration, "getCurrentVoiceProfileVersionForLanguageCode:", a4) < a3;
}

+ (BOOL)migrateVoiceProfileToVersion:(unint64_t)a3 forLanguageCode:(id)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  int v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  char v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  void *v50;
  int v51;
  uint64_t v52;
  _BOOL4 v53;
  NSObject *v54;
  const char *v55;
  uint32_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  void *v61;
  id v62;
  void *v63;
  id obj;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  char v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  unint64_t v89;
  __int16 v90;
  unint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = +[VTVoiceProfileMigration getCurrentVoiceProfileVersionForLanguageCode:](VTVoiceProfileMigration, "getCurrentVoiceProfileVersionForLanguageCode:", v5);
  v7 = v6;
  v85 = 0;
  if (a3 != 1 || v6)
  {
    v58 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v87 = v5;
      v88 = 2048;
      v89 = v7;
      v90 = 2048;
      v91 = a3;
      _os_log_impl(&dword_20D965000, v58, OS_LOG_TYPE_DEFAULT, "Migrating Voice Profile for %{public}@ from %lu to %lu not supported", buf, 0x20u);
    }
  }
  else
  {
    +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForLanguageCode:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v8, &v84);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v84;

    +[VTSpeakerIdUtilities getSATDirectoryForModelType:forLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForModelType:forLanguageCode:", 1, v5);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 || !v11)
    {
      v59 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v87 = v8;
        v88 = 2114;
        v89 = (unint64_t)v12;
        _os_log_impl(&dword_20D965000, v59, OS_LOG_TYPE_DEFAULT, "Coudn't fetch the list of files at path: %{public}@ %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v13 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", 1, v5);
      v14 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", 3, v5);
      v62 = v5;
      v15 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", 2, v5);
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v61 = v11;
      obj = v11;
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
      v12 = 0;
      if (v74)
      {
        v73 = *(_QWORD *)v81;
        v63 = v8;
        do
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v81 != v73)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            if (v17)
            {
              objc_msgSend(v8, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringByAppendingPathComponent:", v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v17, "isEqualToString:", CFSTR("audio")))
                goto LABEL_36;
              v66 = v19;
              v20 = v12;
              objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("meta_version.json"));
              v21 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("enrollment_migrated"));
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v18;
              objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("enrollment_completed"));
              v67 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("meta_version.json"));
              v22 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("enrollment_migrated"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)v21;
              objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("enrollment_completed"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v9 + 1408), "defaultManager");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v9;
              v26 = objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v21, &v85);

              v65 = (void *)v22;
              if (v26)
              {
                objc_msgSend(*(id *)(v25 + 1408), "defaultManager");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = v20;
                v28 = objc_msgSend(v27, "moveItemAtPath:toPath:error:", v21, v22, &v79);
                v29 = v79;

                if ((v28 & 1) == 0)
                {
                  v30 = VTLogContextFacilityVoiceTrigger;
                  v19 = v66;
                  v31 = v72;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    v87 = v23;
                    v88 = 2114;
                    v89 = v22;
                    v90 = 2114;
                    v91 = (unint64_t)v29;
                    _os_log_impl(&dword_20D965000, v30, OS_LOG_TYPE_DEFAULT, "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
                  }
                  v18 = v68;
LABEL_23:
                  v9 = 0x24BDD1000uLL;
                  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v61);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v32, "fileExistsAtPath:isDirectory:", v31, &v85);

                  if (v33)
                  {
                    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v78 = v29;
                    v35 = objc_msgSend(v34, "moveItemAtPath:toPath:error:", v31, v71, &v78);
                    v36 = v78;

                    if ((v35 & 1) != 0)
                    {
                      v37 = (void *)v67;
                    }
                    else
                    {
                      v38 = VTLogContextFacilityVoiceTrigger;
                      v37 = (void *)v67;
                      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        v87 = v72;
                        v88 = 2114;
                        v89 = (unint64_t)v71;
                        v90 = 2114;
                        v91 = (unint64_t)v36;
                        _os_log_impl(&dword_20D965000, v38, OS_LOG_TYPE_DEFAULT, "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
                      }
                    }
                  }
                  else
                  {
                    v36 = v29;
                    v37 = (void *)v67;
                  }
                  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v39, "fileExistsAtPath:isDirectory:", v37, &v85);

                  if (v40)
                  {
                    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v77 = v36;
                    v42 = objc_msgSend(v41, "moveItemAtPath:toPath:error:", v37, v70, &v77);
                    v12 = v77;

                    if ((v42 & 1) == 0)
                    {
                      v43 = VTLogContextFacilityVoiceTrigger;
                      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        v87 = v37;
                        v88 = 2114;
                        v89 = (unint64_t)v70;
                        v90 = 2114;
                        v91 = (unint64_t)v12;
                        _os_log_impl(&dword_20D965000, v43, OS_LOG_TYPE_DEFAULT, "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
                      }
                    }
                    v9 = 0x24BDD1000;
                  }
                  else
                  {
                    v12 = v36;
                  }

                  v8 = v63;
LABEL_36:
                  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("audio"), v61) & 1) != 0
                    || (objc_msgSend(v17, "isEqualToString:", CFSTR("model")) & 1) != 0
                    || objc_msgSend(v17, "isEqualToString:", CFSTR("td-sr-model")))
                  {
                    objc_msgSend(*(id *)(v9 + 1408), "defaultManager");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v44, "fileExistsAtPath:isDirectory:", v19, &v85);

                    if (v45)
                    {
                      objc_msgSend(*(id *)(v9 + 1408), "defaultManager");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v76 = v12;
                      v47 = objc_msgSend(v46, "removeItemAtPath:error:", v19, &v76);
                      v48 = v76;

                      if ((v47 & 1) == 0)
                      {
                        v49 = VTLogContextFacilityVoiceTrigger;
                        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543618;
                          v87 = v19;
                          v88 = 2114;
                          v89 = (unint64_t)v48;
                          _os_log_impl(&dword_20D965000, v49, OS_LOG_TYPE_DEFAULT, "ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x16u);
                        }
                      }
                    }
                    else
                    {
                      v48 = v12;
                    }
                    objc_msgSend(*(id *)(v9 + 1408), "defaultManager");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = v48;
                    v51 = objc_msgSend(v50, "moveItemAtPath:toPath:error:", v18, v19, &v75);
                    v12 = v75;

                    v52 = VTLogContextFacilityVoiceTrigger;
                    v53 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
                    if (v51)
                    {
                      if (v53)
                      {
                        *(_DWORD *)buf = 138543618;
                        v87 = v18;
                        v88 = 2114;
                        v89 = (unint64_t)v19;
                        v54 = v52;
                        v55 = "Successfully moved %{public}@ to %{public}@";
                        v56 = 22;
                        goto LABEL_9;
                      }
LABEL_10:

                      continue;
                    }
                    if (!v53)
                      goto LABEL_10;
                    *(_DWORD *)buf = 138543874;
                    v87 = v18;
                    v88 = 2114;
                    v89 = (unint64_t)v19;
                    v90 = 2114;
                    v91 = (unint64_t)v12;
                    v54 = v52;
                    v55 = "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@";
                    v56 = 32;
                  }
                  else
                  {
                    v57 = VTLogContextFacilityVoiceTrigger;
                    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_10;
                    *(_DWORD *)buf = 138543362;
                    v87 = v18;
                    v54 = v57;
                    v55 = "Skipping moving of file %{public}@";
                    v56 = 12;
                  }
LABEL_9:
                  _os_log_impl(&dword_20D965000, v54, OS_LOG_TYPE_DEFAULT, v55, buf, v56);
                  goto LABEL_10;
                }
              }
              else
              {
                v29 = v20;
              }
              v19 = v66;
              v18 = v68;
              v31 = v72;
              goto LABEL_23;
            }
          }
          v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
        }
        while (v74);
      }

      v5 = v62;
      +[VTVoiceProfileMigration updateVoiceProfileVersionFileForLanguageCode:](VTVoiceProfileMigration, "updateVoiceProfileVersionFileForLanguageCode:", v62);
      v11 = v61;
    }

  }
  return 1;
}

+ (void)updateVoiceProfileVersionFileForLanguageCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:](VTSpeakerIdUtilities, "getProfileVersionFilePathForLanguageCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  +[VTUtilities deviceProductType](VTUtilities, "deviceProductType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = +[VTUtilities deviceCategoryForDeviceProductType:](VTUtilities, "deviceCategoryForDeviceProductType:", v6)) == 0)
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v44 = v6;
      v45 = 2114;
      v46 = v3;
      _os_log_error_impl(&dword_20D965000, v8, OS_LOG_TYPE_ERROR, "ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@", buf, 0x16u);
    }
    v7 = 0;
  }
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v40))
    v9 = v40 == 0;
  else
    v9 = 0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v21, 0, &v39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v39;
    v23 = v22;
    if (!v10 || v22)
    {
      v34 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v4;
        v45 = 2112;
        v46 = v23;
        _os_log_error_impl(&dword_20D965000, v34, OS_LOG_TYPE_ERROR, "Could not read existing %@ file: err: %@", buf, 0x16u);
      }
      goto LABEL_27;
    }

    v20 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v24, CFSTR("VoiceProfileCompatabiltyVersion"));

    +[VTUtilities deviceProductType](VTUtilities, "deviceProductType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v25, CFSTR("VoiceProfileProductType"));

    +[VTUtilities deviceSoftwareVersion](VTUtilities, "deviceSoftwareVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v26, CFSTR("VoiceProfileSWVersion"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forKey:", v27, CFSTR("VoiceProfileCategoryType"));

    v19 = (void *)objc_msgSend(v20, "copy");
  }
  else
  {
    v41[0] = CFSTR("VoiceProfileCompatabiltyVersion");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), 1);
    v35 = objc_claimAutoreleasedReturnValue();
    v42[0] = v35;
    v41[1] = CFSTR("VoiceProfileProductType");
    +[VTUtilities deviceProductType](VTUtilities, "deviceProductType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v10;
    v41[2] = CFSTR("VoiceProfileSWVersion");
    +[VTUtilities deviceSoftwareVersion](VTUtilities, "deviceSoftwareVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v11;
    v41[3] = CFSTR("VoiceProfileCategoryType");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v12;
    v41[4] = CFSTR("VoiceProfileIdentifier");
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = v4;
    v14 = v6;
    v15 = v5;
    v16 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[4] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v16;
    v5 = v15;
    v6 = v14;
    v4 = v13;
    v20 = (void *)v35;

  }
  v38 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v19, 1, &v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v38;
  v23 = v28;
  if (!v21 || v28)
  {
    v32 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v19;
      v45 = 2112;
      v46 = v23;
      v33 = "ERR: error creating updatedVoiceProfileJsonData from: %@, err: %@";
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v40))
  {
    if (!v40)
    {
      v37 = 0;
      v29 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v37);
      v23 = v37;
      if ((v29 & 1) == 0)
      {
        v32 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v4;
          v45 = 2112;
          v46 = v23;
          v33 = "ERR: error removing voice profile version file at: %@, err: %@";
          goto LABEL_32;
        }
LABEL_24:
        v10 = v19;
LABEL_27:

        v19 = v10;
        goto LABEL_28;
      }
    }
  }
  v30 = v23;
  v36 = v23;
  v31 = objc_msgSend(v21, "writeToFile:options:error:", v4, 0, &v36);
  v23 = v36;

  if (!v31 || v23)
  {
    v32 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v4;
      v45 = 2112;
      v46 = v23;
      v33 = "ERR: Error writing voice profile version file at: %@, err:%@";
LABEL_32:
      _os_log_error_impl(&dword_20D965000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
LABEL_28:

}

@end
