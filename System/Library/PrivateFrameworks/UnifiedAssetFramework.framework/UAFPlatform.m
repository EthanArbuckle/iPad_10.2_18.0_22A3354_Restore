@implementation UAFPlatform

+ (id)versionComponentFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invertedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "integerValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)versionComponentsFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          +[UAFPlatform versionComponentFromString:](UAFPlatform, "versionComponentFromString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {

            v14 = 0;
            goto LABEL_18;
          }
          v13 = (void *)v12;
          if (!v9)
            v9 = (id)objc_opt_new();
          objc_msgSend(v9, "addObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }

    v9 = v9;
    v14 = v9;
LABEL_18:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)maxVersionFromVersionString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.9999"), a3);
}

+ (int64_t)compareVersion:(id)a3 with:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  unint64_t i;
  void *v26;
  uint64_t v27;

  v5 = a4;
  +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
    goto LABEL_12;
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    v11 = 1;
    while (v10 < objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      if (v13 < v15)
      {
        v11 = -1;
        goto LABEL_23;
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      if (v17 > v19)
        goto LABEL_23;
      if (++v10 >= objc_msgSend(v6, "count"))
        break;
    }
  }
  v20 = objc_msgSend(v6, "count");
  if (v20 == objc_msgSend(v8, "count"))
  {
LABEL_12:
    v11 = 0;
  }
  else
  {
    v21 = v6;
    v22 = v8;
    v23 = objc_msgSend(v21, "count");
    if (v23 <= objc_msgSend(v22, "count"))
    {
      v11 = -1;
    }
    else
    {

      v24 = v21;
      v21 = v22;
      v11 = 1;
      v22 = v24;
    }
    for (i = objc_msgSend(v21, "count"); i < objc_msgSend(v22, "count"); ++i)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "integerValue");

      if (v27)
        goto LABEL_22;
    }
    v11 = 0;
LABEL_22:

  }
LABEL_23:

  return v11;
}

+ (id)configurationManagers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  UAFConfigurationManager *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "assetNamed:", CFSTR("com.apple.siri.uaf.osupdates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "location");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v33 = v3;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v5;
      objc_msgSend(v5, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x24BDBCC60];
      v52[0] = *MEMORY[0x24BDBCC60];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v10, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[UAFCommonUtilities mobileGestaltQuery:](UAFCommonUtilities, "mobileGestaltQuery:", CFSTR("ProductVersion"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v34 = 0;
        v16 = *(_QWORD *)v41;
        v37 = v9;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            v18 = v15;
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(v12);
            v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            v38 = 0;
            v39 = 0;
            v20 = objc_msgSend(v19, "getResourceValue:forKey:error:", &v39, v9, &v38);
            v21 = v39;
            v15 = v38;

            if (v20)
              v22 = v15 == 0;
            else
              v22 = 0;
            if (v22 && objc_msgSend(v21, "BOOLValue"))
            {
              v23 = v12;
              objc_msgSend(v19, "lastPathComponent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "lastPathComponent");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                if (objc_msgSend(a1, "compareVersion:with:", v24, v36) == -1)
                {
                  UAFGetLogCategory((id *)&UAFLogContextClient);
                  v29 = objc_claimAutoreleasedReturnValue();
                  v12 = v23;
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v46 = "+[UAFPlatform configurationManagers:]";
                    v47 = 2114;
                    v48 = v24;
                    v49 = 2114;
                    v50 = v36;
                    _os_log_impl(&dword_229282000, v29, OS_LOG_TYPE_INFO, "%s Skipping platform directory: %{public}@ < %{public}@", buf, 0x20u);
                  }
                }
                else
                {
                  v27 = [UAFConfigurationManager alloc];
                  v44 = v19;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = -[UAFConfigurationManager initWithURLs:](v27, "initWithURLs:", v28);

                  v12 = v23;
                  if (v29)
                  {
                    v30 = v34;
                    if (!v34)
                      v30 = (void *)objc_opt_new();
                    v34 = v30;
                    objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v24);
                  }
                }
                v9 = v37;

              }
              else
              {
                v12 = v23;
                v9 = v37;
              }

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
        v34 = 0;
      }

      v6 = v34;
      v5 = v32;
      v3 = v33;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
