@implementation UAFAutoAssetInstance

+ (id)instanceDirURL
{
  void *v2;
  void *v3;

  +[UAFCommonUtilities getDefaultStoragePath](UAFCommonUtilities, "getDefaultStoragePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)saveFileURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[UAFAutoAssetInstance instanceDirURL](UAFAutoAssetInstance, "instanceDirURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[UAFAutoAssetInstance instanceDirURL](UAFAutoAssetInstance, "instanceDirURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("instance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (BOOL)decomposeSaveFileURL:(id)a3 assetSetName:(id *)a4 atomicInstance:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  v8 = v7;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  objc_msgSend(v7, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("instance"));

  if (v10)
  {
    objc_msgSend(v8, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByDeletingPathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "rangeOfString:options:", CFSTR("@"), 4);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = 0;
      if (!a4)
        goto LABEL_11;
    }
    else
    {
      v16 = v13;
      objc_msgSend(v12, "substringFromIndex:", v13 + v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringToIndex:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
      if (!a4)
      {
LABEL_11:
        if (a5)
          *a5 = objc_retainAutorelease(v15);

        goto LABEL_14;
      }
    }
    *a4 = objc_retainAutorelease(v12);
    goto LABEL_11;
  }
LABEL_14:

  return v10;
}

+ (BOOL)clear:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  _BOOL4 v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  id v28;
  id v29;
  id obj;
  void *v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  else
    +[UAFAutoAssetInstance instanceDirURL](UAFAutoAssetInstance, "instanceDirURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = *MEMORY[0x24BDBCC98];
    v9 = 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v12)
    {
      v13 = v12;
      v27 = v7;
      v28 = v6;
      v14 = 0;
      v15 = *(_QWORD *)v36;
      v29 = v5;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          v33 = 0;
          v34 = 0;
          v18 = +[UAFAutoAssetInstance decomposeSaveFileURL:assetSetName:atomicInstance:](UAFAutoAssetInstance, "decomposeSaveFileURL:assetSetName:atomicInstance:", v17, &v34, &v33, v27);
          v19 = v34;
          v20 = v33;
          if (v18 && (!v5 || objc_msgSend(v19, "isEqualToString:", v5)))
          {
            v31 = v20;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v14;
            v22 = objc_msgSend(v21, "removeItemAtURL:error:", v17, &v32);
            v23 = v32;

            UAFGetLogCategory((id *)&UAFLogContextClient);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if ((v22 & 1) == 0)
            {
              v6 = v28;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v40 = "+[UAFAutoAssetInstance clear:path:]";
                v41 = 2112;
                v42 = v17;
                v43 = 2114;
                v44 = v23;
                _os_log_error_impl(&dword_229282000, v25, OS_LOG_TYPE_ERROR, "%s Failed to remove \"%@\": %{public}@", buf, 0x20u);
              }

              v9 = 0;
              v5 = v29;
              goto LABEL_24;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "+[UAFAutoAssetInstance clear:path:]";
              v41 = 2112;
              v42 = v17;
              _os_log_impl(&dword_229282000, v25, OS_LOG_TYPE_DEFAULT, "%s Removed \"%@\", buf, 0x16u);
            }

            v14 = v23;
            v5 = v29;
            v20 = v31;
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
        if (v13)
          continue;
        break;
      }
      v9 = 1;
      v23 = v14;
      v6 = v28;
LABEL_24:
      v7 = v27;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
    v9 = 0;
  }

  return v9;
}

@end
