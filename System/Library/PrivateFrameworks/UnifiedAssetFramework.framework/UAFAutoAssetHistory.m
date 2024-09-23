@implementation UAFAutoAssetHistory

+ (id)_getAutoAssetSetInfo:(id)a3 includeAssetVersion:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetSetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  if (v8)
  {
    objc_msgSend(v5, "assetSetIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("assetSetIdentifier"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_24F1F9848, CFSTR("assetSetIdentifier"));
  }

  v10 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = v5;
  objc_msgSend(v5, "autoAssetEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v34 = *(_QWORD *)v36;
    v31 = v4;
    do
    {
      v13 = 0;
      v32 = v12;
      do
      {
        if (*(_QWORD *)v36 != v34)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
        objc_msgSend(*(id *)(v6 + 3800), "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "assetSelector");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "assetSpecifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v14, "assetSelector");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "assetSpecifier");
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (!v4)
            goto LABEL_14;
        }
        else
        {
          v19 = &stru_24F1F9848;
          if (!v4)
          {
LABEL_14:
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("assetSpecifier"));
            goto LABEL_20;
          }
        }
        objc_msgSend(*(id *)(v6 + 3800), "dictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("assetSpecifier"));
        objc_msgSend(v14, "assetSelector");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "assetVersion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v14, "assetSelector");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "assetVersion");
          v24 = v10;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("assetVersion"));

          v10 = v24;
          v4 = v31;
          v6 = 0x24BDBC000;
        }
        else
        {
          objc_msgSend(v20, "setObject:forKeyedSubscript:", &stru_24F1F9848, CFSTR("assetVersion"));
        }

        if (v20)
          v26 = v20;
        else
          v26 = &unk_24F202FB0;
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("assetSelector"));

        v12 = v32;
LABEL_20:
        if (objc_msgSend(v14, "assetLockedInhibitsRemoval"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "assetLockedInhibitsRemoval"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, CFSTR("assetLockedInhibitsRemoval"));

        }
        objc_msgSend(v10, "addObject:", v15);

        ++v13;
      }
      while (v12 != v13);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v10, "count"))
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v10, CFSTR("autoAssetEntries"));

  return v30;
}

+ (id)_getPersistAssetInfoPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  +[UAFCommonUtilities getDefaultStoragePath](UAFCommonUtilities, "getDefaultStoragePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("history");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)getPersistedAssetInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _BYTE v39[128];
  const __CFString *v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAutoAssetHistory _getPersistAssetInfoPath](UAFAutoAssetHistory, "_getPersistAssetInfoPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v24 = v4;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
    v36 = 0;
    v25 = v2;
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v36;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".%@.%@"), CFSTR("cur"), CFSTR("json"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(".%@.%@"), CFSTR("prev"), CFSTR("json"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v7)
    {
      v8 = v7;
      v29 = *(_QWORD *)v33;
      v9 = v3;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v11, "lastPathComponent");
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = v12;
            if ((-[__CFString hasSuffix:](v12, "hasSuffix:", v28) & 1) != 0)
            {
              v14 = CFSTR("cur");
            }
            else if (-[__CFString hasSuffix:](v13, "hasSuffix:", v26))
            {
              v14 = CFSTR("prev");
            }
            else
            {
              v14 = CFSTR("unknown");
            }
          }
          else
          {
            v14 = CFSTR("unknown");
            v13 = CFSTR("unknown");
          }
          v31 = v6;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v11, 2, &v31);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (const __CFString *)v31;

          if (v16 || !v15)
          {
            v19 = CFSTR("unknown error");
            if (v16)
              v19 = v16;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to get data from persisted info URL '%@', err = '%@'"), v11, v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = (id)v16;
          }
          else
          {
            v30 = 0;
            objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v30);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v30;
            if (v6)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to parse data from persisted info URL '%@', err = '%@'"), v11, v6);
              v18 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v18;
            }
          }
          v3 = v9;
          v37[0] = CFSTR("assetSetInfo");
          v37[1] = CFSTR("filename");
          v38[0] = v17;
          v38[1] = v13;
          v37[2] = CFSTR("history");
          v38[2] = v14;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v20);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v8);
    }

    v4 = v24;
    v2 = v25;
    v21 = (void *)v23;
  }
  else
  {
    v40 = CFSTR("error");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no info available, topdir '%@' does not exist"), v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v41[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);
  }

  return v3;
}

+ (BOOL)_createHistoryDirIfNeeded:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject **v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  char v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (!objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v21))
  {
    v26 = *MEMORY[0x24BDD0CC8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", 448);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    v7 = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, v9, a4);

    if ((v10 & 1) != 0)
      goto LABEL_22;
    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = UAFErrorCodeAssetHistoryFailedToCreateFile;
      if (*a4)
      {
        v24[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to create UAF history directory path at '%@'"), v5);
        v13 = objc_claimAutoreleasedReturnValue();
        v24[1] = *MEMORY[0x24BDD1398];
        v25[0] = v13;
        v25[1] = *a4;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = (NSObject **)v25;
        v16 = v24;
LABEL_11:
        v17 = 2;
LABEL_20:
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), v12, v19);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
      v22 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to create UAF history directory path at '%@'"), v5);
      v13 = objc_claimAutoreleasedReturnValue();
      v23 = v13;
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v23;
      v16 = &v22;
LABEL_19:
      v17 = 1;
      goto LABEL_20;
    }
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "+[UAFAutoAssetHistory _createHistoryDirIfNeeded:error:]";
      v30 = 2112;
      v31 = v5;
      v18 = "%s failed to create UAF history directory path at '%@'";
LABEL_16:
      _os_log_error_impl(&dword_229282000, v13, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    }
LABEL_21:

    v7 = 0;
    goto LABEL_22;
  }
  if (!v21)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = UAFErrorCodeAssetHistoryPathExistsIsNotDir;
      if (*a4)
      {
        v34[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UAF history directory path exists but is not a directory, not preserving info, path is '%@'"), v5);
        v13 = objc_claimAutoreleasedReturnValue();
        v35[0] = v13;
        v34[1] = *MEMORY[0x24BDD1398];
        v35[1] = *a4;
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = (NSObject **)v35;
        v16 = v34;
        goto LABEL_11;
      }
      v32 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UAF history directory path exists but is not a directory, not preserving info, path is '%@'"), v5);
      v13 = objc_claimAutoreleasedReturnValue();
      v33 = v13;
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v33;
      v16 = &v32;
      goto LABEL_19;
    }
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "+[UAFAutoAssetHistory _createHistoryDirIfNeeded:error:]";
      v30 = 2112;
      v31 = v5;
      v18 = "%s UAF history directory path exists but is not a directory, not preserving info, path is '%@'";
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  v7 = 1;
LABEL_22:

  return v7;
}

+ (BOOL)_writeAssetInfoToFile:(id)a3 data:(id)a4 filePath:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject **v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject **v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  NSObject *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = +[UAFCommonUtilities openFD:oflags:mode:error:](UAFCommonUtilities, "openFD:oflags:mode:error:", v11, 1537, 420, a6);
  if ((v12 & 0x80000000) != 0)
  {
    if (a6)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = UAFErrorCodeAssetHistoryFailedToCreateFile;
      if (*a6)
      {
        v44[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to open file for persisting info for assetSetIdentifier '%@' at path = '%@'"), v9, v11);
        v14 = objc_claimAutoreleasedReturnValue();
        v44[1] = *MEMORY[0x24BDD1398];
        v24 = *a6;
        v45[0] = v14;
        v45[1] = v24;
        v25 = (void *)MEMORY[0x24BDBCE70];
        v26 = (NSObject **)v45;
        v27 = v44;
        v28 = 2;
      }
      else
      {
        v42 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to open file for persisting info for assetSetIdentifier '%@' at path = '%@'"), v9, v11);
        v14 = objc_claimAutoreleasedReturnValue();
        v43 = v14;
        v25 = (void *)MEMORY[0x24BDBCE70];
        v26 = &v43;
        v27 = &v42;
        v28 = 1;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), v23, v29);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "+[UAFAutoAssetHistory _writeAssetInfoToFile:data:filePath:error:]";
        v38 = 2112;
        v39 = v9;
        v40 = 2112;
        v41 = v11;
        _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, "%s failed to open file for persisting info for assetSetIdentifier '%@' at path = '%@'", buf, 0x20u);
      }
    }
    goto LABEL_18;
  }
  v13 = 1;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v12, 1);
  if ((-[NSObject writeData:error:](v14, "writeData:error:", v10, a6) & 1) == 0)
  {
    if (a6)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = UAFErrorCodeAssetHistoryFailedToCreateFile;
      if (*a6)
      {
        v34[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to write to file for persisting info for assetSetIdentifier '%@' at path = '%@'"), v9, v11);
        v17 = objc_claimAutoreleasedReturnValue();
        v34[1] = *MEMORY[0x24BDD1398];
        v35[0] = v17;
        v35[1] = *a6;
        v18 = (void *)MEMORY[0x24BDBCE70];
        v19 = (NSObject **)v35;
        v20 = v34;
        v21 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to write to file for persisting info for assetSetIdentifier '%@' at path = '%@'"), v9, v11, *MEMORY[0x24BDD0FC8]);
        v17 = objc_claimAutoreleasedReturnValue();
        v33 = v17;
        v18 = (void *)MEMORY[0x24BDBCE70];
        v19 = &v33;
        v20 = &v32;
        v21 = 1;
      }
      objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), v16, v30);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "+[UAFAutoAssetHistory _writeAssetInfoToFile:data:filePath:error:]";
        v38 = 2112;
        v39 = v9;
        v40 = 2112;
        v41 = v11;
        _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s failed to write to file for persisting info for assetSetIdentifier '%@' at path = '%@'", buf, 0x20u);
      }
    }

LABEL_18:
    v13 = 0;
  }

  return v13;
}

+ (BOOL)_persistAssetSetInfo:(id)a3 assetSetIdentifier:(id)a4 isEliminating:(BOOL)a5 jsonData:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NSObject **v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void **v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  NSObject *v41;
  void *v42;
  NSObject *log;
  os_log_t loga;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v47 = a6;
  +[UAFAutoAssetManager getSerialQueue](UAFAutoAssetManager, "getSerialQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if ((objc_msgSend(CFSTR("configuration"), "isEqualToString:", v11) & 1) != 0)
  {
    v46 = v11;
    v14 = CFSTR("uafConfiguredLog");
  }
  else
  {
    if ((objc_msgSend(CFSTR("locked"), "isEqualToString:", v11) & 1) == 0)
    {
      if (a7)
      {
        v25 = (void *)MEMORY[0x24BDD1540];
        v26 = UAFErrorCodeAssetHistoryUnknownType;
        if (*a7)
        {
          v65[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown infoType '%@'"), v11);
          v27 = objc_claimAutoreleasedReturnValue();
          v65[1] = *MEMORY[0x24BDD1398];
          v66[0] = v27;
          v66[1] = *a7;
          v28 = (void *)MEMORY[0x24BDBCE70];
          v29 = (NSObject **)v66;
          v30 = v65;
          v31 = 2;
        }
        else
        {
          v63 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown infoType '%@'"), v11);
          v27 = objc_claimAutoreleasedReturnValue();
          v64 = v27;
          v28 = (void *)MEMORY[0x24BDBCE70];
          v29 = &v64;
          v30 = &v63;
          v31 = 1;
        }
        objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), v26, v39);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        UAFGetLogCategory((id *)&UAFLogContextMAConfig);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "+[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:]";
          v55 = 2112;
          v56 = v11;
          _os_log_error_impl(&dword_229282000, v27, OS_LOG_TYPE_ERROR, "%s unknown infoType '%@'", buf, 0x16u);
        }
      }
      v18 = 0;
      v15 = 0;
      v21 = 0;
      v16 = 0;
      v17 = 0;
      goto LABEL_29;
    }
    v46 = v11;
    v14 = CFSTR("uafLockedLog");
  }
  +[UAFAutoAssetHistory _getPersistAssetInfoPath](UAFAutoAssetHistory, "_getPersistAssetInfoPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[UAFAutoAssetHistory _createHistoryDirIfNeeded:error:](UAFAutoAssetHistory, "_createHistoryDirIfNeeded:error:", v15, a7))
  {
    v18 = 0;
    v21 = 0;
    v16 = 0;
    v17 = 0;
    v24 = 0;
    v11 = v46;
    goto LABEL_31;
  }
  v45 = v12;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@-%@"), v15, v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@"), v16, CFSTR("cur"), CFSTR("json"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@"), v16, CFSTR("prev"), CFSTR("json"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v19 = +[UAFCommonUtilities rename:toPath:error:](UAFCommonUtilities, "rename:toPath:error:", v17, v18, &v48);
  v20 = v48;
  v21 = v20;
  if (v19)
  {
    v22 = objc_msgSend(v20, "code");
    objc_msgSend(v21, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 != 2 && objc_msgSend((id)*MEMORY[0x24BDD1128], "isEqualToString:", v23))
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v54 = "+[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:]";
        v55 = 2114;
        v56 = v17;
        v57 = 2114;
        v58 = v18;
        v59 = 2114;
        v60 = v23;
        v61 = 2048;
        v62 = v22;
        _os_log_impl(&dword_229282000, log, OS_LOG_TYPE_DEFAULT, "%s failed to rename current persisted info file '%{public}@' to previous '%{public}@', domain = '%{public}@', code = %ld", buf, 0x34u);
      }

    }
  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v17, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v12 = v45;
    if (v32)
    {
      v27 = v32;
      v24 = +[UAFAutoAssetHistory _writeAssetInfoToFile:data:filePath:error:](UAFAutoAssetHistory, "_writeAssetInfoToFile:data:filePath:error:", v45, v47, v17, a7);
      v11 = v46;
LABEL_30:

      goto LABEL_31;
    }
    if (a7)
    {
      loga = (os_log_t)MEMORY[0x24BDD1540];
      v33 = UAFErrorCodeAssetHistoryFailedToCreateObject;
      v11 = v46;
      if (*a7)
      {
        v51[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown infoType '%@'"), v46);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = *MEMORY[0x24BDD1398];
        v52[0] = v34;
        v52[1] = *a7;
        v35 = (void *)MEMORY[0x24BDBCE70];
        v36 = (void **)v52;
        v37 = v51;
        v38 = 2;
      }
      else
      {
        v49 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown infoType '%@'"), v46);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v34;
        v35 = (void *)MEMORY[0x24BDBCE70];
        v36 = &v50;
        v37 = &v49;
        v38 = 1;
      }
      objc_msgSend(v35, "dictionaryWithObjects:forKeys:count:", v36, v37, v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject errorWithDomain:code:userInfo:](loga, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), v33, v42);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v27 = 0;
      v24 = 0;
      v12 = v45;
      goto LABEL_30;
    }
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v41 = objc_claimAutoreleasedReturnValue();
    v11 = v46;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "+[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:]";
      v55 = 2112;
      v56 = v46;
      _os_log_error_impl(&dword_229282000, v41, OS_LOG_TYPE_ERROR, "%s unknown infoType '%@'", buf, 0x16u);
    }

    v27 = 0;
LABEL_29:
    v24 = 0;
    goto LABEL_30;
  }
  v24 = 1;
  v12 = v45;
  v11 = v46;
LABEL_31:

  return v24;
}

+ (void)persistAssetSetInfoConfiguring:(id)a3 isEliminating:(BOOL)a4 reason:(id)a5
{
  _BOOL8 v6;
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
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v6 = a4;
  v31[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "assetSetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[UAFAutoAssetHistory persistAssetSetInfoConfiguring:isEliminating:reason:]";
        v26 = 2114;
        v27 = v9;
        _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s failed to create output dictionary for persisting info about configuring asset set '%{public}@', not persisting information", buf, 0x16u);
      }
      v11 = 0;
      v10 = 0;
      v12 = 0;
      goto LABEL_18;
    }
    v11 = (void *)v13;
    v30[0] = CFSTR("reason");
    v30[1] = CFSTR("timestamp");
    v31[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFCommonUtilities getISO8601Timestamp:withFractionalSeconds:](UAFCommonUtilities, "getISO8601Timestamp:withFractionalSeconds:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("UAFHistoryMetadata"));

    +[UAFAutoAssetHistory _getAutoAssetSetInfo:includeAssetVersion:](UAFAutoAssetHistory, "_getAutoAssetSetInfo:includeAssetVersion:", v7, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("autoAssetSet"));

    v23 = 0;
    +[UAFCommonUtilities serializeDictToJSONData:error:](UAFCommonUtilities, "serializeDictToJSONData:error:", v11, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    if (!v10)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "+[UAFAutoAssetHistory persistAssetSetInfoConfiguring:isEliminating:reason:]";
        v26 = 2114;
        v27 = v9;
        v28 = 2114;
        v29 = v12;
        _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s could not serialize output dictionary to json, not persisting info about configuring asset set '%{public}@', error is '%{public}@'", buf, 0x20u);
      }
      v10 = 0;
      goto LABEL_18;
    }
  }
  v18 = v12;
  v22 = v12;
  v19 = +[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:](UAFAutoAssetHistory, "_persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:", CFSTR("configuration"), v9, v6, v10, &v22);
  v12 = v22;

  if (!v19 || v12 != 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[UAFAutoAssetHistory persistAssetSetInfoConfiguring:isEliminating:reason:]";
      v26 = 2114;
      v27 = v9;
      v28 = 2114;
      v29 = v12;
      _os_log_error_impl(&dword_229282000, v21, OS_LOG_TYPE_ERROR, "%s failed to persist info while configuring assetSetIdentifier '%{public}@', error is '%{public}@'", buf, 0x20u);
    }
LABEL_18:

    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:

}

+ (void)persistAssetSetInfoLocked:(id)a3 atomicEntries:(id)a4 autoAssetSet:(id)a5 isEliminating:(BOOL)a6 reason:(id)a7
{
  _BOOL8 v8;
  __CFString *v11;
  id v12;
  id v13;
  __CFString *v14;
  _BOOL8 v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  __CFString *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  id obj;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  id v74;
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[4];
  _QWORD v78[4];
  _BYTE v79[128];
  _QWORD v80[2];
  _QWORD v81[4];

  v8 = a6;
  v81[2] = *MEMORY[0x24BDAC8D0];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = (__CFString *)a7;
  v15 = v8;
  v16 = v14;
  objc_msgSend(v13, "assetSetIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v19 = 0;
    v54 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v54)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
        v71 = 2114;
        v72 = v17;
        _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s failed to create array for atomic entries for persisting info about locked asset set '%{public}@', not persisting information", buf, 0x16u);
      }
      v51 = 0;
      v18 = 0;
      v19 = 0;
      v54 = 0;
      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v70 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
        v71 = 2114;
        v72 = v17;
        _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s failed to create output dictionary for persisting info about locked asset set '%{public}@', not persisting information", buf, 0x16u);
      }
      v51 = 0;
      v18 = 0;
      v19 = 0;
      goto LABEL_53;
    }
    v49 = v17;
    v50 = v16;
    if (v16)
      v24 = v16;
    else
      v24 = CFSTR("<no reason provided>");
    v80[0] = CFSTR("reason");
    v80[1] = CFSTR("timestamp");
    v81[0] = v24;
    v25 = (void *)v23;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UAFCommonUtilities getISO8601Timestamp:withFractionalSeconds:](UAFCommonUtilities, "getISO8601Timestamp:withFractionalSeconds:", v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("UAFHistoryMetadata"));

    v48 = v11;
    if (v11)
      v29 = v11;
    else
      v29 = &stru_24F1F9848;
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("atomicInstance"));
    v46 = v13;
    +[UAFAutoAssetHistory _getAutoAssetSetInfo:includeAssetVersion:](UAFAutoAssetHistory, "_getAutoAssetSetInfo:includeAssetVersion:", v13, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v25;
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("autoAssetSet"));

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v47 = v12;
    obj = v12;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    if (v55)
    {
      v53 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v77[0] = CFSTR("fullAssetSelector");
          v75[0] = CFSTR("assetSpecifier");
          objc_msgSend(v32, "fullAssetSelector");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "assetSpecifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(v32, "fullAssetSelector");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "assetSpecifier");
            v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = v58;
          }
          else
          {
            v35 = &stru_24F1F9848;
          }
          v76[0] = v35;
          v75[1] = CFSTR("assetVersion");
          objc_msgSend(v32, "fullAssetSelector");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "assetVersion");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_msgSend(v32, "fullAssetSelector");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "assetVersion");
            v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v38 = v57;
          }
          else
          {
            v38 = &stru_24F1F9848;
          }
          v76[1] = v38;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v78[0] = v39;
          v77[1] = CFSTR("assetID");
          objc_msgSend(v32, "assetID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v32, "assetID");
            v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v41 = v60;
          }
          else
          {
            v41 = &stru_24F1F9848;
          }
          v78[1] = v41;
          v77[2] = CFSTR("localContentURL");
          objc_msgSend(v32, "localContentURL");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v32, "localContentURL");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "absoluteString");
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v43 = v56;
          }
          else
          {
            v43 = &stru_24F1F9848;
          }
          v78[2] = v43;
          v77[3] = CFSTR("inhibitedFromEmergencyRemoval");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v32, "inhibitedFromEmergencyRemoval"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v78[3] = v44;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {

          }
          if (v40)

          if (v37)
          {

          }
          if (v34)
          {

          }
          objc_msgSend(v54, "addObject:", v45);

        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      }
      while (v55);
    }

    objc_msgSend(v51, "setObject:forKeyedSubscript:", v54, CFSTR("atomicEntries"));
    v64 = 0;
    +[UAFCommonUtilities serializeDictToJSONData:error:](UAFCommonUtilities, "serializeDictToJSONData:error:", v51, &v64);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v64;
    if (!v18)
    {
      UAFGetLogCategory((id *)&UAFLogContextMAConfig);
      v22 = objc_claimAutoreleasedReturnValue();
      v17 = v49;
      v16 = v50;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v70 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
        v71 = 2114;
        v72 = v49;
        v73 = 2114;
        v74 = v19;
        _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s could not serialize output dictionary to json, not persisting info about locked asset set '%{public}@', error is '%{public}@'", buf, 0x20u);
      }
      v18 = 0;
      v12 = v47;
      v11 = v48;
      v13 = v46;
      goto LABEL_53;
    }
    v12 = v47;
    v11 = v48;
    v13 = v46;
    v17 = v49;
    v16 = v50;
    v15 = 0;
  }
  v20 = v19;
  v63 = v19;
  v21 = +[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:](UAFAutoAssetHistory, "_persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:", CFSTR("locked"), v17, v15, v18, &v63);
  v19 = v63;

  if (!v21 || v19)
  {
    UAFGetLogCategory((id *)&UAFLogContextMAConfig);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v70 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
      v71 = 2114;
      v72 = v17;
      v73 = 2114;
      v74 = v19;
      _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s failed to persist info for locked assetSetIdentifier '%{public}@', error is '%{public}@'", buf, 0x20u);
    }
LABEL_53:

  }
}

@end
