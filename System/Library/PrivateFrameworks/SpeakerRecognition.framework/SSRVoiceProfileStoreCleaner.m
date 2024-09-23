@implementation SSRVoiceProfileStoreCleaner

- (id)filterDuplicatedSiriProfilesFrom:(id)a3
{
  id v3;
  void *v4;
  os_log_t *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  os_log_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  char v42;
  os_log_t v43;
  _BOOL4 v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  _BYTE v75[18];
  __int16 v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_3545);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v3;
  objc_msgSend(v3, "filteredArrayUsingPredicate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v4;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  if (!v56)
    goto LABEL_47;
  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v55 = *(_QWORD *)v69;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v69 != v55)
        objc_enumerationMutation(obj);
      v58 = v6;
      v7 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v6);
      v8 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
        v74 = 2114;
        *(_QWORD *)v75 = v7;
        _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Processing onboarded Siri user: %{public}@", buf, 0x16u);
      }
      v59 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v9 = obj;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v65 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(v7, "locale");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "locale");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if ((CSIsCommunalDevice() & 1) == 0)
            {
              if ((v17 & 1) == 0)
                continue;
LABEL_17:
              objc_msgSend(v59, "addObject:", v14);
              continue;
            }
            objc_msgSend(v7, "siriProfileId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "siriProfileId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToString:", v19);

            if ((v17 & v20) == 1)
              goto LABEL_17;
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
        }
        while (v11);
      }

      v21 = objc_msgSend(v59, "count");
      v5 = (os_log_t *)MEMORY[0x24BE284B8];
      if (v21 >= 2)
      {
        v22 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          v24 = objc_msgSend(v59, "count");
          *(_DWORD *)buf = 136315650;
          v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
          v74 = 1026;
          *(_DWORD *)v75 = v24;
          *(_WORD *)&v75[4] = 2114;
          *(_QWORD *)&v75[6] = v59;
          _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Detected matching %{public}d users: %{public}@", buf, 0x1Cu);

        }
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v25 = v59;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v61;
LABEL_25:
          v29 = 0;
          while (1)
          {
            if (*(_QWORD *)v61 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v29);
            if (objc_msgSend(v30, "isMarkedSATEnrolled"))
            {
              objc_msgSend(v30, "getExplicitEnrollmentUtterancesForType:", 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count");

              if (v32 > 3)
                break;
            }
            if (v27 == ++v29)
            {
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
              if (v27)
                goto LABEL_25;
              goto LABEL_32;
            }
          }
          v33 = v30;

          if (v33)
            goto LABEL_38;
        }
        else
        {
LABEL_32:

        }
        objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v34;
          objc_msgSend(v7, "locale");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "siriProfileId");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          *(_DWORD *)buf = 136315906;
          v39 = CFSTR("Primary");
          if (v37)
            v39 = (const __CFString *)v37;
          v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
          v74 = 2114;
          *(_QWORD *)v75 = v36;
          *(_WORD *)&v75[8] = 2114;
          *(_QWORD *)&v75[10] = v39;
          v76 = 2114;
          v77 = v33;
          _os_log_impl(&dword_2117D4000, v35, OS_LOG_TYPE_DEFAULT, "%s Valid profile not found %{public}@ and %{public}@ - defaulting to %{public}@", buf, 0x2Au);

        }
LABEL_38:
        objc_msgSend(v33, "profileID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "profileID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqualToString:", v41);

        v43 = *v5;
        v44 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
        if ((v42 & 1) != 0)
        {
          if (v44)
          {
            v45 = v43;
            objc_msgSend(v7, "profileID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
            v74 = 2114;
            *(_QWORD *)v75 = v46;
            _os_log_impl(&dword_2117D4000, v45, OS_LOG_TYPE_DEFAULT, "%s Skipping retaining user %{public}@", buf, 0x16u);

          }
        }
        else
        {
          if (v44)
          {
            v47 = v43;
            objc_msgSend(v7, "profileID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v73 = "-[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:]";
            v74 = 2114;
            *(_QWORD *)v75 = v48;
            _os_log_impl(&dword_2117D4000, v47, OS_LOG_TYPE_DEFAULT, "%s Adding invalid user for deletion - %{public}@", buf, 0x16u);

          }
          objc_msgSend(v54, "addObject:", v7);
        }

      }
      v6 = v58 + 1;
    }
    while (v58 + 1 != v56);
    v56 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
  }
  while (v56);
LABEL_47:

  if (objc_msgSend(v54, "count"))
    v49 = v54;
  else
    v49 = 0;
  v50 = v49;

  return v50;
}

- (id)filterInvalidSiriProfilesFrom:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v3, "filteredArrayUsingPredicate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = v4;
  objc_msgSend(v4, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[SSRVoiceProfileStoreCleaner filterInvalidSiriProfilesFrom:]";
          v28 = 2114;
          v29 = v11;
          _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Processing onboarded Siri user: %{public}@", buf, 0x16u);
        }
        v20[0] = v9;
        v20[1] = 3221225472;
        v20[2] = __61__SSRVoiceProfileStoreCleaner_filterInvalidSiriProfilesFrom___block_invoke_5;
        v20[3] = &unk_24CC851B8;
        v20[4] = v11;
        v21 = v5;
        +[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:](SSRUtils, "getHomeUserIdForVoiceProfile:withCompletion:", v11, v20);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
    v13 = v5;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (id)cleanupProfileStore
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  char v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  uint8_t v50[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint8_t v56[128];
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _QWORD v61[5];

  v61[2] = *MEMORY[0x24BDAC8D0];
  +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provisionedVoiceProfilesForAppDomain:withLocale:", 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SSRSpeakerProfilesBasePath");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v39);

  if ((v5 & 1) == 0)
  {
    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s File path doesnt exist - %{public}@", buf, 0x16u);
    }
    v12 = 0;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBCC60];
  v61[0] = *MEMORY[0x24BDBCCD0];
  v61[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v9, 0, &v49);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v49;

  if (!v10)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__3526;
    v59 = __Block_byref_object_dispose__3527;
    v60 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 5);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __50__SSRVoiceProfileStoreCleaner_cleanupProfileStore__block_invoke;
    v48[3] = &unk_24CC851E0;
    v48[4] = buf;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v48);
    v14 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v50 = 136315394;
      v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
      v52 = 2114;
      v53 = v15;
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s App domains in use - %{public}@", v50, 0x16u);
    }
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v16 = v37;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (!v17)
    {
      v41 = 0;
      goto LABEL_36;
    }
    v41 = 0;
    v18 = *(_QWORD *)v45;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v42 = 0;
        v43 = 0;
        objc_msgSend(v20, "getResourceValue:forKey:error:", &v43, v8, &v42);
        v21 = v43;
        v22 = v42;
        if (v22)
        {
          v23 = v22;
          v24 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v50 = 136315650;
            v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
            v52 = 2114;
            v53 = v20;
            v54 = 2114;
            v55 = v23;
            _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s ERR: Failed determining if file is dir-entry url=%{public}@ with %{public}@", v50, 0x20u);
          }
        }
        else if (v21)
        {
          objc_msgSend(v20, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "containsObject:", v23);
          v26 = *MEMORY[0x24BE284B8];
          v27 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
          if ((v25 & 1) == 0)
          {
            if (v27)
            {
              v32 = *(void **)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v50 = 136315650;
              v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
              v52 = 2114;
              v53 = v20;
              v54 = 2114;
              v55 = v32;
              _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid domain %{public}@ not part of domains %{public}@", v50, 0x20u);
            }
            objc_msgSend(v20, "path");
            v29 = (id)objc_claimAutoreleasedReturnValue();
            v33 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v29);
            goto LABEL_31;
          }
          if (v27)
          {
            *(_DWORD *)v50 = 136315394;
            v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
            v52 = 2114;
            v53 = v23;
            _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Processing domain - %{public}@", v50, 0x16u);
          }
          -[SSRVoiceProfileStoreCleaner _cleanupAppDomain:](self, "_cleanupAppDomain:", v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = v28;

            v41 = v29;
LABEL_31:

          }
        }
        else
        {
          v30 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v50 = 136315394;
            v51 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
            v52 = 2114;
            v53 = v20;
            _os_log_impl(&dword_2117D4000, v30, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid file %{public}@", v50, 0x16u);
          }
          objc_msgSend(v20, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v23);
        }

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (!v17)
      {
LABEL_36:

        v12 = v41;
        _Block_object_dispose(buf, 8);

        goto LABEL_37;
      }
    }
  }
  v11 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v35 = v11;
    objc_msgSend(v10, "localizedDescription");
    v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2114;
    v58 = v36;
    _os_log_error_impl(&dword_2117D4000, v35, OS_LOG_TYPE_ERROR, "%s ERR: Failed reading contents of SAT root %{public}@ with %{public}@", buf, 0x20u);

  }
  v12 = v10;
LABEL_37:

LABEL_38:
  return v12;
}

- (id)deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((CSIsCommunalDevice() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userVoiceProfilesForAppDomain:forLocale:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      v7 = 0;
    }
    else
    {
      v26 = v6;
      v27 = v5;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v9;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v11)
      {
        v12 = v11;
        v7 = 0;
        v13 = (os_log_t *)MEMORY[0x24BE284B8];
        v14 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v16, "getEnrollmentUtterancesForModelType:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (!v17 || !objc_msgSend(v17, "count"))
            {
              v19 = *v13;
              if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v33 = "-[SSRVoiceProfileStoreCleaner deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:]";
                v34 = 2114;
                v35 = v16;
                _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Found profile %{public}@ with no enrollment utts", buf, 0x16u);
              }
              objc_msgSend(v8, "deleteUserVoiceProfile:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v21 = *v13;
              if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
              {
                v22 = v21;
                objc_msgSend(v20, "localizedDescription");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v33 = "-[SSRVoiceProfileStoreCleaner deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:]";
                v34 = 2114;
                v35 = v23;
                _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, "%s Deleted voiceprofile with error %{public}@", buf, 0x16u);

              }
              v7 = v20;
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v12);
      }
      else
      {
        v7 = 0;
      }

      v6 = v26;
      v5 = v27;
      v9 = v25;
    }

  }
  return v7;
}

- (id)_cleanupAppDomain:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v38;
  void *v39;
  SSRVoiceProfileStoreCleaner *v40;
  id v41;
  void *v42;
  id obj;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _QWORD v60[5];

  v60[2] = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "SSRBasePathForAppDomain:", CFSTR("com.apple.siri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AFPreferencesSupportedLanguages();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDBCC60];
  v60[0] = *MEMORY[0x24BDBCCD0];
  v60[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v9, 0, &v50);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v50;

  if (!v11)
  {
    v38 = v10;
    v39 = v5;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v10;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (!v15)
    {
      v11 = 0;
      goto LABEL_36;
    }
    v16 = v15;
    v40 = self;
    v11 = 0;
    v17 = *(_QWORD *)v47;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v18);
        v20 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          objc_msgSend(v19, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
          v54 = 2114;
          v55 = v22;
          _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Processing locale - %{public}@", buf, 0x16u);

        }
        v44 = 0;
        v45 = 0;
        objc_msgSend(v19, "getResourceValue:forKey:error:", &v45, v8, &v44, v38, v39);
        v23 = v45;
        v24 = v44;
        if (v24)
        {
          v25 = v24;
          v26 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
            v54 = 2114;
            v55 = v19;
            v56 = 2114;
            v57 = v25;
            _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s ERR: Failed determining if file is dir-entry url=%{public}@ with %{public}@", buf, 0x20u);
          }
          v27 = v25;

          v11 = v27;
        }
        else
        {
          if (v23)
          {
            objc_msgSend(v19, "lastPathComponent");
            v27 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42
              && objc_msgSend(v42, "count")
              && v28
              && (objc_msgSend(v27, "isEqualToString:", v28) & 1) == 0
              && (objc_msgSend(v42, "containsObject:", v27) & 1) == 0)
            {
              v33 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
                v54 = 2114;
                v55 = v19;
                v56 = 2114;
                v57 = v42;
                v58 = 2114;
                v59 = v28;
                _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid locale %{public}@ not supported in set %{public}@ and current language %{public}@", buf, 0x2Au);
              }
              objc_msgSend(v19, "path");
              v30 = (id)objc_claimAutoreleasedReturnValue();
              v34 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v30);
LABEL_23:

            }
            else
            {
              -[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:](v40, "_cleanuplanguageCodePath:forAppDomain:", v19, v41);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = v29;

                v11 = v30;
                goto LABEL_23;
              }
            }

            goto LABEL_28;
          }
          v31 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
            v54 = 2114;
            v55 = v19;
            _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid file %{public}@", buf, 0x16u);
          }
          objc_msgSend(v19, "path");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v32 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v27);
        }
LABEL_28:

        ++v18;
      }
      while (v16 != v18);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      v16 = v35;
      if (!v35)
      {
LABEL_36:

        v10 = v38;
        v5 = v39;
        goto LABEL_37;
      }
    }
  }
  v12 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    objc_msgSend(v11, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v53 = "-[SSRVoiceProfileStoreCleaner _cleanupAppDomain:]";
    v54 = 2114;
    v55 = v41;
    v56 = 2114;
    v57 = v5;
    v58 = 2114;
    v59 = v14;
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed reading AppDomain %{public}@ at %{public}@ with %{public}@", buf, 0x2Au);

  }
LABEL_37:
  v36 = v11;

  return v36;
}

- (id)_cleanuplanguageCodePath:(id)a3 forAppDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  SSRVoiceProfileStoreCleaner *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v44;
  id v45;
  id v46;
  SSRVoiceProfileStoreCleaner *v47;
  id obj;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  _QWORD v65[5];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBCC60];
  v65[0] = *MEMORY[0x24BDBCCD0];
  v65[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, v10, 0, &v55);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v55;

  if (!v12)
  {
    v47 = self;
    v45 = v7;
    v46 = v6;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v44 = v11;
    obj = v11;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (!v16)
    {
      v12 = 0;
      goto LABEL_33;
    }
    v17 = v16;
    v18 = v9;
    v12 = 0;
    v19 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v22 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          objc_msgSend(v21, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
          v59 = 2114;
          v60 = v24;
          _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Processing profile - %{public}@", buf, 0x16u);

        }
        v49 = 0;
        v50 = 0;
        objc_msgSend(v21, "getResourceValue:forKey:error:", &v50, v18, &v49);
        v25 = v50;
        v26 = v49;
        if (v26)
        {
          v27 = v26;
          v28 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
            v59 = 2114;
            v60 = v21;
            v61 = 2114;
            v62 = v27;
            _os_log_error_impl(&dword_2117D4000, v28, OS_LOG_TYPE_ERROR, "%s ERR: Failed determining if file is dir-entry url=%{public}@ with %{public}@", buf, 0x20u);
          }
          v29 = v27;

          v12 = v29;
        }
        else
        {
          if (v25)
          {
            objc_msgSend(v21, "lastPathComponent");
            v29 = (id)objc_claimAutoreleasedReturnValue();
            +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "voiceProfileForId:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              v32 = v47;
              -[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesForProfile:payloadUtteranceLifeTimeInDays:](v47, "_cleanupOrphanedMetafilesForProfile:payloadUtteranceLifeTimeInDays:", v31, 180);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33;
              if (v33)
              {
                v35 = v33;

                v12 = v35;
                v32 = v47;
              }
              -[SSRVoiceProfileStoreCleaner _cleanupImplicitUtteranceCacheForProfile:](v32, "_cleanupImplicitUtteranceCacheForProfile:", v31);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                v37 = v36;

                v12 = v37;
                goto LABEL_27;
              }
            }
            else
            {
              v40 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
                v59 = 2114;
                v60 = v21;
                _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid profile %{public}@", buf, 0x16u);
              }
              objc_msgSend(v21, "path");
              v37 = (id)objc_claimAutoreleasedReturnValue();
              v41 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v37);
LABEL_27:

            }
            goto LABEL_29;
          }
          v38 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
            v59 = 2114;
            v60 = v21;
            _os_log_impl(&dword_2117D4000, v38, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid file %{public}@", buf, 0x16u);
          }
          objc_msgSend(v21, "path");
          v29 = (id)objc_claimAutoreleasedReturnValue();
          v39 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v29);
        }
LABEL_29:

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (!v17)
      {
LABEL_33:

        v7 = v45;
        v6 = v46;
        v11 = v44;
        goto LABEL_34;
      }
    }
  }
  v13 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    objc_msgSend(v12, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v58 = "-[SSRVoiceProfileStoreCleaner _cleanuplanguageCodePath:forAppDomain:]";
    v59 = 2114;
    v60 = v7;
    v61 = 2114;
    v62 = v6;
    v63 = 2114;
    v64 = v15;
    _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed reading AppDomain %{public}@ at %{public}@ with %{public}@", buf, 0x2Au);

  }
LABEL_34:
  v42 = v12;

  return v42;
}

- (id)_cleanupImplicitUtteranceCacheForProfile:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "voiceProfileImplicitCacheDirPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SSRVoiceProfileStoreCleaner _cleanupImplicitUtteranceCacheForProfile:]";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Removing Implicit utterance cache directory at %{public}@", (uint8_t *)&v7, 0x16u);
  }
  +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_cleanupOrphanedMetafilesForProfile:(id)a3 payloadUtteranceLifeTimeInDays:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "voiceProfileIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "voiceProfileVersion");
  v9 = (os_log_t *)MEMORY[0x24BE284B8];
  v10 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v6, "profileID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136315906;
    v30 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesForProfile:payloadUtteranceLifeTimeInDays:]";
    v31 = 2114;
    v32 = v12;
    v33 = 1026;
    v34 = v8;
    v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Processing profile %{public}@ with version %{public}d and identity %{public}@", (uint8_t *)&v29, 0x26u);

  }
  if (objc_msgSend(v6, "voiceProfileVersion"))
  {
    objc_msgSend(v6, "voiceProfileBasePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfileStoreCleaner _cleanupContentsOfSatFolder:](self, "_cleanupContentsOfSatFolder:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = v14;
    objc_msgSend(v6, "voiceProfileAudioDirPathForSpidType:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:](self, "_cleanupOrphanedMetafilesAtURL:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = v18;

      v14 = v19;
    }
    objc_msgSend(v6, "voiceProfileAudioDirPathForSpidType:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:](self, "_cleanupOrphanedMetafilesAtURL:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = v22;

      v14 = v23;
    }
    -[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:](self, "_cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:", v6, 3, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = v24;

      v14 = v25;
    }
    v26 = v14;

  }
  else
  {
    v27 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315138;
      v30 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesForProfile:payloadUtteranceLifeTimeInDays:]";
      _os_log_impl(&dword_2117D4000, v27, OS_LOG_TYPE_DEFAULT, "%s Found legacy voice profile - Skipping", (uint8_t *)&v29, 0xCu);
    }
    v26 = 0;
  }

  return v26;
}

- (id)_cleanupContentsOfSatFolder:(id)a3
{
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _UNKNOWN **v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = &off_24CC84000;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getContentsOfDirectory:](SSRUtils, "getContentsOfDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v30;
    *(_QWORD *)&v8 = 136315394;
    v26 = v8;
    v27 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        objc_msgSend(v12, "lastPathComponent", v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3[47], "stringForCSSpIdType:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
          goto LABEL_11;
        objc_msgSend(v3[47], "stringForCSSpIdType:", 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v15))
          goto LABEL_10;
        objc_msgSend(v3[47], "stringForCSSpIdType:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v16))
        {

LABEL_10:
LABEL_11:

          goto LABEL_12;
        }
        objc_msgSend(v3[47], "stringForCSSpIdType:", 5);
        v17 = v9;
        v18 = v6;
        v19 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v13, "isEqualToString:", v20);

        v3 = v19;
        v6 = v18;
        v9 = v17;
        v10 = v27;

        if ((v28 & 1) == 0
          && (objc_msgSend(v13, "containsString:", CFSTR("enrollment_version.json")) & 1) == 0
          && (objc_msgSend(v13, "containsString:", CFSTR("meta_version.json")) & 1) == 0
          && (objc_msgSend(v13, "containsString:", CFSTR("enrollment_completed")) & 1) == 0
          && (objc_msgSend(v13, "containsString:", CFSTR("enrollment_migrated")) & 1) == 0)
        {
          v21 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v34 = "-[SSRVoiceProfileStoreCleaner _cleanupContentsOfSatFolder:]";
            v35 = 2114;
            v36 = v12;
            _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid SAT entry: %{public}@", buf, 0x16u);
          }
          v22 = v3[47];
          objc_msgSend(v12, "path");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (id)objc_msgSend(v22, "removeItemAtPath:", v14);
          v10 = v27;
          goto LABEL_11;
        }
LABEL_12:

        ++v11;
      }
      while (v9 != v11);
      v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      v9 = v24;
    }
    while (v24);
  }

  return 0;
}

- (id)_cleanupInvalidAudioFiles:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  __CFString *v34;
  char v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v43;
  id v44;
  uint64_t v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  char v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  unint64_t v61;
  _BYTE v62[128];
  _QWORD v63[3];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v63[0] = *MEMORY[0x24BDBCCD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v8, 0, &v52);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v52;

    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Failed reading contents of audioDir: %@, err: %@"), v3, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
        v56 = 2114;
        v57 = v13;
        _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v15 = v10;

    }
    else
    {
      v43 = v9;
      v44 = v3;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      obj = v9;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v20 = *(_QWORD *)v49;
        do
        {
          v21 = 0;
          v45 = v18;
          do
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v21);
            objc_msgSend(v22, "pathExtension");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("wav"));

            if (v24)
            {
              objc_msgSend(v22, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v19;
              v26 = v4;
              objc_msgSend(v4, "attributesOfItemAtPath:error:", v25, &v47);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v47;

              v29 = objc_msgSend(v27, "fileSize");
              if (v28 || !v29)
              {
                v41 = *MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315906;
                  v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
                  v56 = 2114;
                  v57 = v22;
                  v58 = 2114;
                  v59 = v28;
                  v60 = 2050;
                  v61 = v29;
                  _os_log_error_impl(&dword_2117D4000, v41, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get atrributes of file %{public}@, err %{public}@, size %{public}llu", buf, 0x2Au);
                }
                v19 = v28;
              }
              else
              {
                objc_msgSend(v22, "URLByDeletingPathExtension");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "URLByAppendingPathExtension:", CFSTR("json"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v31, "path");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v26, "fileExistsAtPath:isDirectory:", v32, &v53);

                v34 = CFSTR("n/a");
                if (v33)
                {
                  +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:", v31);
                  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                v35 = -[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("explicit"));
                if (!(v29 >> 13) && (v35 & 1) == 0)
                {
                  objc_msgSend(v22, "path");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v36);

                  objc_msgSend(v31, "path");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v38);

                  v40 = *MEMORY[0x24BE284B8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
                    v56 = 2114;
                    v57 = v22;
                    v58 = 2114;
                    v59 = v31;
                    _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid SAT entry: %{public}@ %{public}@", buf, 0x20u);
                  }
                }

                v19 = 0;
              }
              v4 = v26;
              v18 = v45;
            }
            ++v21;
          }
          while (v18 != v21);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
        }
        while (v18);
      }
      else
      {
        v19 = 0;
      }

      v15 = v19;
      v9 = v43;
      v3 = v44;
    }

  }
  else
  {
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v55 = "-[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:]";
      v56 = 2114;
      v57 = v3;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s File path doesnt exist - %{public}@", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)_cleanupOrphanedMetafilesAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  int v47;
  SSRVoiceProfileStoreCleaner *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  _QWORD v68[3];
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[4];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    v71[0] = *MEMORY[0x24BDBCCD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v9, 0, &v62);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v62;

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed reading contents of audioDir: %@, err: %@"), v4, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v15 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
        v65 = 2114;
        v66 = v14;
        _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v16 = v11;
    }
    else
    {
      v49 = self;
      v51 = v5;
      v52 = v4;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("meta_version.json"), "stringByDeletingPathExtension");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v50 = v10;
      v19 = v10;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v59 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v24, "absoluteString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringByDeletingPathExtension");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v27, "compare:", CFSTR("enrollment_completed"))
              && (objc_msgSend(v27, "isEqualToString:", v53) & 1) == 0)
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
                objc_msgSend(v18, "removeObjectForKey:", v27);
              else
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v27);
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
        }
        while (v21);
      }

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v14 = v18;
      v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v55 != v31)
              objc_enumerationMutation(v14);
            v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            objc_msgSend(v14, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "pathExtension");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "compare:", CFSTR("json"));

            v37 = *MEMORY[0x24BE284B8];
            v38 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
            if (v36)
            {
              if (v38)
              {
                *(_DWORD *)buf = 136315394;
                v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
                v65 = 2114;
                v66 = v34;
                _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s Found non-meta file: %{public}@", buf, 0x16u);
              }
            }
            else
            {
              if (v38)
              {
                *(_DWORD *)buf = 136315650;
                v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
                v65 = 2114;
                v66 = v33;
                v67 = 2114;
                v68[0] = v34;
                _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s Deleting invalid SAT entry: %{public}@ : <%{public}@>", buf, 0x20u);
              }
              objc_msgSend(v34, "path");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v39);

            }
          }
          v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
        }
        while (v30);
      }

      v4 = v52;
      -[SSRVoiceProfileStoreCleaner _cleanupInvalidAudioFiles:](v49, "_cleanupInvalidAudioFiles:", v52);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getExplicitEnrollmentUtterancesFromDirectory:", v52);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "count");
        +[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getImplicitEnrollmentUtterancesFromDirectory:", v52);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "count");
        *(_DWORD *)buf = 136315906;
        v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
        v65 = 2114;
        v66 = v52;
        v67 = 1026;
        LODWORD(v68[0]) = v45;
        WORD2(v68[0]) = 1026;
        *(_DWORD *)((char *)v68 + 6) = v47;
        _os_log_impl(&dword_2117D4000, v43, OS_LOG_TYPE_DEFAULT, "%s Processed %{public}@ with %{public}d explicit and %{public}d implicit utterances", buf, 0x22u);

      }
      v16 = v41;

      v10 = v50;
      v5 = v51;
    }

  }
  else
  {
    v17 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[SSRVoiceProfileStoreCleaner _cleanupOrphanedMetafilesAtURL:]";
      v65 = 2114;
      v66 = v4;
      _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s File path doesnt exist - %{public}@", buf, 0x16u);
    }
    v16 = 0;
  }

  return v16;
}

- (id)_cleanupPayloadUtterancesFromProfile:(id)a3 forModelType:(unint64_t)a4 exceedingLifeTimeInDays:(int64_t)a5
{
  id v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a5 * -86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x24BE284B8];
  v10 = *MEMORY[0x24BE284B8];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v7, "profileID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]";
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v12;
      v25 = 1024;
      v26 = a4;
      _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Checking payload utterances prior to %{public}@ for profile %{public}@ and modelType %d", (uint8_t *)&v19, 0x26u);

    }
    objc_msgSend(v7, "getImplicitEnrollmentUtterancesPriorTo:forType:", v8, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_40);
    v14 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v19 = 136315138;
      v20 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]";
      _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ObsoleteCutOffDate is nil - Bailing out", (uint8_t *)&v19, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("obsoleteCutOffDate is nil - Bailing out"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]";
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v27 = CFSTR("reason");
    v28[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 113, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)cleanupInvalidModelsForProfile:(id)a3 withAssetArray:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  for (i = 1; i != 6; ++i)
  {
    objc_msgSend(v12, "voiceProfileModelDirForSpidType:recognizerType:", i, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "voiceProfileModelDirForSpidType:recognizerType:", i, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfileStoreCleaner _cleanupModelFilesAtDir:forAssetArray:](self, "_cleanupModelFilesAtDir:forAssetArray:", v10, v6);

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRVoiceProfileStoreCleaner _cleanupModelFilesAtDir:forAssetArray:](self, "_cleanupModelFilesAtDir:forAssetArray:", v11, v6);

  }
}

- (void)_cleanupModelFilesAtDir:(id)a3 forAssetArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id obj;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _QWORD v62[4];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (!v9)
    goto LABEL_35;
  v62[0] = *MEMORY[0x24BDBCCD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v10, 0, &v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v53;

  if (!v12)
  {
    v40 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v39 = v6;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "hashFromResourcePath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v19);
    }
    v41 = v7;

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v38 = v11;
    obj = v11;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    if (!v23)
    {
      v43 = 0;
      goto LABEL_33;
    }
    v24 = v23;
    v43 = 0;
    v25 = *(_QWORD *)v46;
    v26 = 0x24BE28000uLL;
    while (1)
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v28, "absoluteString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v26 + 1160), "isExclaveHardware"))
        {
          v31 = v25;
          v32 = v26;
          objc_msgSend(v28, "URLByDeletingPathExtension");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "absoluteString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastPathComponent");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v15, "containsObject:", v30) & 1) != 0)
          {
            v26 = v32;
            v25 = v31;
            goto LABEL_29;
          }
          if (v35)
          {
            v26 = v32;
            v25 = v31;
            if ((objc_msgSend(v15, "containsObject:", v35) & 1) != 0)
              goto LABEL_29;
          }
          else
          {
            v26 = v32;
            v25 = v31;
          }
        }
        else
        {
          v35 = 0;
          if ((objc_msgSend(v15, "containsObject:", v30) & 1) != 0)
            goto LABEL_29;
        }
        v44 = v43;
        objc_msgSend(v41, "removeItemAtURL:error:", v28, &v44);
        v36 = v44;

        v37 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v55 = "-[SSRVoiceProfileStoreCleaner _cleanupModelFilesAtDir:forAssetArray:]";
          v56 = 2114;
          v57 = v30;
          v58 = 2114;
          v59 = v36;
          _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s Deleting model file %{public}@ with err %{public}@", buf, 0x20u);
        }
        v43 = v36;
LABEL_29:

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
      if (!v24)
      {
LABEL_33:

        v6 = v39;
        v5 = v40;
        v7 = v41;
        v11 = v38;
        v12 = v43;
        goto LABEL_34;
      }
    }
  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "localizedDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Error reading contents of modelDir: %@, err: %@"), v5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v55 = "-[SSRVoiceProfileStoreCleaner _cleanupModelFilesAtDir:forAssetArray:]";
    v56 = 2114;
    v57 = v15;
    _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
LABEL_34:

LABEL_35:
}

void __105__SSRVoiceProfileStoreCleaner__cleanupPayloadUtterancesFromProfile_forModelType_exceedingLifeTimeInDays___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "URLByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (os_log_t *)MEMORY[0x24BE284B8];
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]_block_invoke";
    v14 = 2114;
    v15 = v2;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Deleting lifetimeexpired SAT entry %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(v2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v7);

  v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "-[SSRVoiceProfileStoreCleaner _cleanupPayloadUtterancesFromProfile:forModelType:exceedingLifeTimeInDays:]_block_invoke";
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Deleted lifetimeexpired metafile %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(v4, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v10);

}

void __50__SSRVoiceProfileStoreCleaner_cleanupProfileStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "appDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v3, "appDomain");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Failed to get appdomain for profile %@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SSRVoiceProfileStoreCleaner cleanupProfileStore]_block_invoke";
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }

  }
}

void __61__SSRVoiceProfileStoreCleaner_filterInvalidSiriProfilesFrom___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!a2)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("kAFAssistantErrorDomain")) & 1) != 0)
    {
      if (objc_msgSend(v6, "code") == 6001)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "code");

        if (v8 != 6002)
          goto LABEL_10;
      }
      v9 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 136315394;
        v12 = "-[SSRVoiceProfileStoreCleaner filterInvalidSiriProfilesFrom:]_block_invoke";
        v13 = 2114;
        v14 = v10;
        _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Detected invalid user: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
    }
    else
    {

    }
  }
LABEL_10:

}

uint64_t __61__SSRVoiceProfileStoreCleaner_filterInvalidSiriProfilesFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "appDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri"));

  return v3;
}

uint64_t __64__SSRVoiceProfileStoreCleaner_filterDuplicatedSiriProfilesFrom___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "appDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri"));

  return v3;
}

@end
