@implementation UAFPrestageConfiguration

+ (id)supportedFileVersions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("1.0.0");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BOOL v21;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[UAFPrestageConfiguration supportedFileVersions](UAFPrestageConfiguration, "supportedFileVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UAFConfiguration isValid:fileType:fileVersions:error:](UAFConfiguration, "isValid:fileType:fileVersions:error:", v5, CFSTR("PrestageConfiguration"), v6, a4);

  if (!v7
    || !+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("AssetSetName"), objc_opt_class(), 1, a4)|| !+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("ValidConfigs"), objc_opt_class(), 1, a4))
  {
    v21 = 0;
    goto LABEL_28;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ValidConfigs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (!v9)
  {
    v21 = 1;
    goto LABEL_34;
  }
  v10 = v9;
  v11 = *(_QWORD *)v39;
  v32 = v8;
  v29 = *(_QWORD *)v39;
  while (2)
  {
    v12 = 0;
    v30 = v10;
    do
    {
      if (*(_QWORD *)v39 != v11)
        objc_enumerationMutation(v8);
      v31 = v12;
      v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v26 = (void *)objc_opt_class();
          *(_DWORD *)buf = 136315394;
          v44 = "+[UAFPrestageConfiguration isValid:error:]";
          v45 = 2112;
          v46 = v26;
          v27 = v26;
          _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s ValidConfig is not expected kind \"%@\", buf, 0x16u);

        }
        goto LABEL_32;
      }
      v14 = v13;
      if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v14, CFSTR("TargetingType"), objc_opt_class(), 1, a4))goto LABEL_32;
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("TargetingType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("PrestagePredicate")))
      {
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AllDevices")) & 1) != 0)
          goto LABEL_15;
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "+[UAFPrestageConfiguration isValid:error:]";
          v45 = 2114;
          v46 = v15;
          _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s Unknown targeting type: %{public}@", buf, 0x16u);
        }

LABEL_40:
LABEL_32:

        v21 = 0;
        goto LABEL_34;
      }
      if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v14, CFSTR("TargetingPredicate"), objc_opt_class(), 1, a4))goto LABEL_40;
LABEL_15:
      if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v14, CFSTR("Usages"), objc_opt_class(), 1, a4))goto LABEL_40;
      v33 = v15;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("Usages"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v35 != v19)
              objc_enumerationMutation(v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              UAFGetLogCategory((id *)&UAFLogContextConfiguration);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = (void *)objc_opt_class();
                *(_DWORD *)buf = 136315394;
                v44 = "+[UAFPrestageConfiguration isValid:error:]";
                v45 = 2112;
                v46 = v24;
                v25 = v24;
                _os_log_impl(&dword_229282000, v23, OS_LOG_TYPE_DEFAULT, "%s Usage is not expected kind \"%@\", buf, 0x16u);

              }
              v8 = v32;
              goto LABEL_32;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v18)
            continue;
          break;
        }
      }

      v8 = v32;
      v12 = v31 + 1;
      v11 = v29;
    }
    while (v31 + 1 != v30);
    v10 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    v21 = 1;
    if (v10)
      continue;
    break;
  }
LABEL_34:

LABEL_28:
  return v21;
}

+ (id)fromContentsOfURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  UAFPrestageConfiguration *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4)
    *a4 = 0;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  if (v6)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[UAFPrestageConfiguration fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      v11 = "%s Failed to load UAFAssetSetConfiguration dictionary from \"%@\": %@";
      v12 = v10;
      v13 = 32;
LABEL_17:
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!+[UAFPrestageConfiguration isValid:error:](UAFPrestageConfiguration, "isValid:error:", v6, a4))
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFPrestageConfiguration fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v11 = "%s Failed to validate UAFAssetSetConfiguration dictionary from \"%@\";
      v12 = v10;
      v13 = 22;
      goto LABEL_17;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v14 = -[UAFPrestageConfiguration initWithDictionary:]([UAFPrestageConfiguration alloc], "initWithDictionary:", v6);
LABEL_15:

  return v14;
}

+ (BOOL)predicateMatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(&unk_24F202F68, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(&unk_24F202F68);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        +[UAFCommonUtilities mobileGestaltQuery:](UAFCommonUtilities, "mobileGestaltQuery:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(&unk_24F202F68, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v7);
  }
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);
  +[UAFCommonUtilities systemLanguageLocale](UAFCommonUtilities, "systemLanguageLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("SystemLanguage"));

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[UAFPrestageConfiguration predicateMatch:]";
    v23 = 2114;
    v24 = v3;
    _os_log_impl(&dword_229282000, v13, OS_LOG_TYPE_DEFAULT, "%s Evaluating predicate string: '%{public}@'", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "evaluateWithObject:", v4);

  return v15;
}

- (UAFPrestageConfiguration)initWithDictionary:(id)a3
{
  id v4;
  UAFPrestageConfiguration *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSArray *usages;
  UAFPrestageConfiguration *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UAFPrestageConfiguration;
  v5 = -[UAFPrestageConfiguration init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssetSetName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ValidConfigs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAFPrestageConfiguration usages:](v5, "usages:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    usages = v5->_usages;
    v5->_usages = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (id)usages:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TargetingType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("AllDevices"));

        if (v10)
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Usages"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TargetingType"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PrestagePredicate"));

        if (v14)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TargetingPredicate"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[UAFPrestageConfiguration predicateMatch:](UAFPrestageConfiguration, "predicateMatch:", v11))
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Usages"));
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v15);
            v12 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v15;
LABEL_10:

            v5 = (void *)v12;
          }

          continue;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v4)
        goto LABEL_21;
    }
  }
  v5 = 0;
LABEL_21:

  return v5;
}

- (id)mergeAssetSetUsages:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[NSArray count](self->_usages, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", self->_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v6, "addObjectsFromArray:", self->_usages);
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, self->_name);

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)usages
{
  return self->_usages;
}

- (void)setUsages:(id)a3
{
  objc_storeStrong((id *)&self->_usages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usages, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
