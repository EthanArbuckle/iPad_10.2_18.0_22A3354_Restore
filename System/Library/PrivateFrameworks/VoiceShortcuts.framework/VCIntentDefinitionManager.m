@implementation VCIntentDefinitionManager

+ (id)intentDefinitionURLsForBundleID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCIntentDefinitionManager.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

  }
  WFSyncedDefinitionDirectoryURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  WFBundledDefinitionDirectoryURL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(a1, "intentDefinitionURLsForBundleID:inDirectory:", v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
        break;

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v14 = 0;
  }

  return v14;
}

+ (id)intentDefinitionURLsForBundleID:(id)a3 inDirectory:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v34 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = v8;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCIntentDefinitionManager.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

    v8 = v27;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCIntentDefinitionManager.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchDirectory"));

    v8 = 0;
  }
  WFDefinitionDirectoryURLsForBundleIdentifier();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v33)
  {
    v30 = v8;
    v32 = *(_QWORD *)v44;
    v9 = *MEMORY[0x1E0C999D0];
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __73__VCIntentDefinitionManager_intentDefinitionURLsForBundleID_inDirectory___block_invoke;
        v41[3] = &unk_1E7AA8218;
        v42 = v34;
        objc_msgSend(v12, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v13, 4, v41);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v35 = i;
          v15 = (void *)objc_opt_new();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v16 = v14;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v38 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                v36 = 0;
                objc_msgSend(v21, "getResourceValue:forKey:error:", &v36, v9, 0);
                v22 = v36;
                if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
                {
                  objc_msgSend(v21, "pathExtension");
                  v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  if (v23 == CFSTR("intentdefinition")
                    || (v24 = v23) != 0
                    && (v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("intentdefinition")),
                        v24,
                        v24,
                        v25))
                  {
                    objc_msgSend(v15, "addObject:", v21);
                  }
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            }
            while (v18);
          }

          if (objc_msgSend(v15, "count"))
          {

            goto LABEL_29;
          }

          i = v35;
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v33)
        continue;
      break;
    }
    v15 = 0;
LABEL_29:
    v8 = v30;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)intentDefinitionBundleURLForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  id v25;
  void *v26;
  char v27;
  id v28;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  _QWORD v52[5];

  v52[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  WFSyncedDefinitionDirectoryURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v4;
  WFBundledDefinitionDirectoryURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v6;
  v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v32)
  {
    v9 = *(_QWORD *)v41;
    v10 = 0x1E0CB3000uLL;
    *(_QWORD *)&v8 = 136315650;
    v30 = v8;
    v33 = v7;
    v31 = *(_QWORD *)v41;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v11);
        objc_msgSend(*(id *)(v10 + 1568), "defaultManager", v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v13, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, 0, 0, &v39);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v39;

        if (v14)
          v16 = 1;
        else
          v16 = v15 == 0;
        if (!v16 && (objc_msgSend(v15, "vc_isFileNotFound") & 1) == 0)
        {
          getWFWatchSyncLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            v46 = "+[VCIntentDefinitionManager intentDefinitionBundleURLForBundleID:]";
            v47 = 2114;
            v48 = v12;
            v49 = 2114;
            v50 = v15;
            _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to enumerate search directory %{public}@ for synced application data: %{public}@", buf, 0x20u);
          }

        }
        v34 = v15;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (!v19)
          goto LABEL_27;
        v20 = v19;
        v21 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v23, "lastPathComponent");
            v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v3;
            v26 = v25;
            if (v24 == v25)
            {

              goto LABEL_32;
            }
            if (v3 && v24)
            {
              v27 = objc_msgSend(v24, "isEqualToString:", v25);

              if ((v27 & 1) != 0)
              {
                v26 = v24;
LABEL_32:
                v28 = v23;

                v7 = v33;
                goto LABEL_33;
              }
            }
            else
            {

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v20)
            continue;
          break;
        }
LABEL_27:

        ++v11;
        v7 = v33;
        v9 = v31;
        v10 = 0x1E0CB3000;
      }
      while (v11 != v32);
      v28 = 0;
      v32 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (!v32)
        goto LABEL_33;
    }
  }
  v28 = 0;
LABEL_33:

  return v28;
}

+ (id)appInfoForBundleID:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const __CFString *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  __int128 v30;
  void *v31;
  NSObject *v32;
  id obj;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  NSObject *v45;
  __int16 v46;
  NSObject *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  WFSyncedDefinitionDirectoryURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v3;
  WFDefinitionDirectoryURLsForBundleIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v37;
    v10 = CFSTR("AppInfo.appinfo");
    v11 = 0x1E0CB3000uLL;
    *(_QWORD *)&v7 = 136315906;
    v30 = v7;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v12), "URLByAppendingPathComponent:", v10, v30);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v11 + 1568), "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v13, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isReadableFileAtPath:", v15);

      if ((v16 & 1) == 0)
        break;
      v17 = objc_alloc(MEMORY[0x1E0C99D50]);
      v35 = 0;
      v18 = objc_msgSend(v17, "initWithContentsOfURL:options:error:", v13, 0, &v35);
      v19 = v35;
      v20 = v19;
      if (v18)
      {
        v21 = v8;
        v22 = v9;
        v23 = v11;
        v24 = v10;
        v34 = 0;
        objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithData:error:", v18, &v34);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v34;
        if (v26)
        {
          v31 = v25;
          getWFWatchSyncLogObject();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v41 = "+[VCIntentDefinitionManager appInfoForBundleID:]";
            v42 = 2114;
            v43 = v18;
            v44 = 2114;
            v45 = v32;
            v46 = 2114;
            v47 = v13;
            v48 = 2114;
            v49 = v26;
            _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_ERROR, "%s Failed to create INAppInfo from data: %{public}@, bundleID: %{public}@, appInfoURL: %{public}@: %{public}@", buf, 0x34u);
          }

          v25 = v31;
        }

        if (v25)
        {

          goto LABEL_26;
        }
        v10 = v24;
        v11 = v23;
        v9 = v22;
        v8 = v21;
        goto LABEL_21;
      }
      if ((-[NSObject vc_isFileNotFound](v19, "vc_isFileNotFound") & 1) != 0)
        goto LABEL_21;
      if (v20)
      {
        getWFWatchSyncLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          v41 = "+[VCIntentDefinitionManager appInfoForBundleID:]";
          v42 = 2114;
          v43 = v32;
          v44 = 2114;
          v45 = v13;
          v46 = 2114;
          v47 = v20;
          _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_ERROR, "%s Failed to load INAppInfo data for %{public}@ at %{public}@: %{public}@", buf, 0x2Au);
        }

LABEL_21:
      }

      if (v8 == ++v12)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_24;
      }
    }
    getWFWatchSyncLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "+[VCIntentDefinitionManager appInfoForBundleID:]";
      v42 = 2114;
      v43 = v32;
      v44 = 2114;
      v45 = v13;
      _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_ERROR, "%s Failed to load INAppInfo data for %{public}@ at %{public}@. App Info URL is not readable.", buf, 0x20u);
    }
    goto LABEL_21;
  }
LABEL_24:
  v25 = 0;
LABEL_26:

  return v25;
}

+ (id)allBundleIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  WFSyncedDefinitionDirectoryURL();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v2;
  WFBundledDefinitionDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "if_flatMap:", &__block_literal_global_6964);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "wf_fileIsDirectory", (_QWORD)v16))
        {
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __49__VCIntentDefinitionManager_allBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v2, 0, 0, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (v4)
    v6 = 1;
  else
    v6 = v5 == 0;
  if (!v6 && (objc_msgSend(v5, "vc_isFileNotFound") & 1) == 0)
  {
    getWFWatchSyncLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "+[VCIntentDefinitionManager allBundleIdentifiers]_block_invoke";
      v14 = 2114;
      v15 = v2;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to enumerate search directory %{public}@ for synced application data: %{public}@", buf, 0x20u);
    }

  }
  if (v4)
    v8 = v4;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  return v9;
}

uint64_t __73__VCIntentDefinitionManager_intentDefinitionURLsForBundleID_inDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "vc_isFileNotFound") & 1) == 0)
  {
    getWFWatchSyncLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 136315906;
      v13 = "+[VCIntentDefinitionManager intentDefinitionURLsForBundleID:inDirectory:]_block_invoke";
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate intent definition files for %{public}@ in search directory %{public}@: %{public}@", (uint8_t *)&v12, 0x2Au);
    }

    v8 = 0;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
