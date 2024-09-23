@implementation UAFGestalt

+ (UAFGestalt)sharedManager
{
  if (_MergedGlobals_12 != -1)
    dispatch_once(&_MergedGlobals_12, &__block_literal_global_13);
  return (UAFGestalt *)(id)qword_2540B1D60;
}

void __27__UAFGestalt_sharedManager__block_invoke()
{
  UAFGestalt *v0;
  void *v1;

  v0 = objc_alloc_init(UAFGestalt);
  v1 = (void *)qword_2540B1D60;
  qword_2540B1D60 = (uint64_t)v0;

}

+ (BOOL)dictionaryIsValid:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  NSObject *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FileType"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("GestaltConfiguration")) & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FileVersion"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && (-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("1.0.0")) & 1) != 0)
      {
        v9 = 1;
LABEL_16:

        goto LABEL_17;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315650;
        v13 = "+[UAFGestalt dictionaryIsValid:]";
        v14 = 2112;
        v15 = v8;
        v16 = 2112;
        v17 = CFSTR("1.0.0");
        _os_log_error_impl(&dword_229282000, v10, OS_LOG_TYPE_ERROR, "%s Mismatched file version %@ vs %@", (uint8_t *)&v12, 0x20u);
      }

    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315650;
        v13 = "+[UAFGestalt dictionaryIsValid:]";
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = CFSTR("GestaltConfiguration");
        _os_log_error_impl(&dword_229282000, v8, OS_LOG_TYPE_ERROR, "%s Mismatched file type %@ vs %@", (uint8_t *)&v12, 0x20u);
      }
    }
    v9 = 0;
    goto LABEL_16;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315138;
    v13 = "+[UAFGestalt dictionaryIsValid:]";
    _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s dictionary is null", (uint8_t *)&v12, 0xCu);
  }
  v9 = 0;
LABEL_17:

  return v9;
}

+ (BOOL)predicateMatch:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  NSObject *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TargetingPredicate"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = objc_msgSend(&unk_24F202F80, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(&unk_24F202F80);
          v10 = *(NSObject **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSObject containsString:](v5, "containsString:", v11))
          {
            +[UAFCommonUtilities mobileGestaltQuery:](UAFCommonUtilities, "mobileGestaltQuery:", v10);
            v12 = objc_claimAutoreleasedReturnValue();
            if (!v12)
            {
              UAFGetLogCategory((id *)&UAFLogContextClient);
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v26 = "+[UAFGestalt predicateMatch:]";
                v27 = 2112;
                v28 = v10;
                _os_log_error_impl(&dword_229282000, v19, OS_LOG_TYPE_ERROR, "%s No mobile gestalt answer for %@", buf, 0x16u);
              }

              v18 = 0;
              goto LABEL_21;
            }
            v13 = (void *)v12;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject stringByReplacingOccurrencesOfString:withString:](v5, "stringByReplacingOccurrencesOfString:withString:", v11, v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v5 = v15;
          }

        }
        v7 = objc_msgSend(&unk_24F202F80, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v7)
          continue;
        break;
      }
    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[UAFGestalt predicateMatch:]";
      v27 = 2114;
      v28 = v5;
      _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s Evaluating predicate string: '%{public}@'", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "evaluateWithObject:", 0);

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "+[UAFGestalt predicateMatch:]";
      _os_log_error_impl(&dword_229282000, v5, OS_LOG_TYPE_ERROR, "%s Missing predicate string", buf, 0xCu);
    }
    v18 = 0;
  }
LABEL_21:

  return v18;
}

+ (BOOL)isKeySupported:(id)a3 key:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SupportedKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "containsObject:", v5);
  else
    v7 = 0;

  return v7;
}

+ (BOOL)deviceMatch:(id)a3 onMatch:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __CFString *v14;
  BOOL v15;
  NSObject *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, id))a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ValidConfigs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "+[UAFGestalt deviceMatch:onMatch:]";
      v26 = 2112;
      v27 = CFSTR("ValidConfigs");
      v28 = 2112;
      v29 = v6;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s Invalid %@ value: %@", buf, 0x20u);
    }
    v15 = 0;
    goto LABEL_27;
  }
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {
    v15 = 0;
    goto LABEL_26;
  }
  v9 = v8;
  v18 = v6;
  v10 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TargetingType"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("GestaltPredicate")))
        {
          if (!+[UAFGestalt predicateMatch:](UAFGestalt, "predicateMatch:", v13))
          {

            continue;
          }
          v5[2](v5, v13);
          v15 = 1;
          v6 = v18;
        }
        else
        {
          v6 = v18;
          if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("AllDevices")))
          {
            v5[2](v5, v13);
            v15 = 1;
          }
          else
          {
            UAFGetLogCategory((id *)&UAFLogContextClient);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v25 = "+[UAFGestalt deviceMatch:onMatch:]";
              v26 = 2112;
              v27 = v14;
              _os_log_error_impl(&dword_229282000, v16, OS_LOG_TYPE_ERROR, "%s Unknown targeting type: %@", buf, 0x16u);
            }

            v15 = 0;
          }
        }

        goto LABEL_26;
      }
    }
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
      continue;
    break;
  }
  v15 = 0;
  v6 = v18;
LABEL_26:

LABEL_27:
  return v15;
}

+ (id)urlForGestalt:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  _OWORD v19[9];

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  +[UAFCommonUtilities rootDirectory](UAFCommonUtilities, "rootDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("file://%@%@/Gestalt/%@.plist"), v6, CFSTR("/System/Library/UnifiedAssetFramework"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF48];
  v10 = (void *)MEMORY[0x24BDD17C8];
  +[UAFCommonUtilities rootDirectory](UAFCommonUtilities, "rootDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("file://%@%@/Gestalt/%@.plist"), v11, CFSTR("/AppleInternal/Library/UnifiedAssetFramework"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v19, 0, sizeof(v19));
  if (!+[UAFCommonUtilities isInternalInstall](UAFCommonUtilities, "isInternalInstall")
    || (objc_msgSend(v13, "path"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = +[UAFCommonUtilities stat:withBuf:error:](UAFCommonUtilities, "stat:withBuf:error:", v14, v19, 0), v14, v16 = v13, v15))
  {
    v16 = v8;
  }
  v17 = v16;

  return v17;
}

+ (id)dictionaryForGestalt:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[UAFGestalt urlForGestalt:](UAFGestalt, "urlForGestalt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v4, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
    {
      if (+[UAFGestalt dictionaryIsValid:](UAFGestalt, "dictionaryIsValid:", v5))
      {
        v13 = v5;
LABEL_15:

        goto LABEL_16;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "+[UAFGestalt dictionaryForGestalt:]";
        v10 = "%s Dictionary is not valid";
        v11 = v9;
        v12 = 12;
        goto LABEL_18;
      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "+[UAFGestalt dictionaryForGestalt:]";
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v7;
        v10 = "%s Error reading %@: %@";
        v11 = v9;
        v12 = 32;
LABEL_18:
        _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
    }

    v13 = 0;
    goto LABEL_15;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "+[UAFGestalt dictionaryForGestalt:]";
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s Could not find config file for %@", buf, 0x16u);
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (UAFGestalt)init
{
  UAFGestalt *v2;
  UAFGestalt *v3;
  UAFGestalt *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UAFGestalt;
  v2 = -[UAFGestalt init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)query:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[UAFGestalt dictionaryForGestalt:](UAFGestalt, "dictionaryForGestalt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __27__UAFGestalt_query_forKey___block_invoke;
    v11[3] = &unk_24F1F8168;
    v13 = &v14;
    v12 = v6;
    if (!+[UAFGestalt deviceMatch:onMatch:](UAFGestalt, "deviceMatch:onMatch:", v7, v11))
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[UAFGestalt query:forKey:]";
        v20 = 2114;
        v21 = v5;
        _os_log_impl(&dword_229282000, v8, OS_LOG_TYPE_DEFAULT, "%s No matching configs for %{public}@", buf, 0x16u);
      }

    }
    v9 = *((_BYTE *)v15 + 24) != 0;

  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

BOOL __27__UAFGestalt_query_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = +[UAFGestalt isKeySupported:key:](UAFGestalt, "isKeySupported:key:", a2, *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)queryAllSupportedKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  +[UAFGestalt dictionaryForGestalt:](UAFGestalt, "dictionaryForGestalt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)MEMORY[0x24BDBD1A8];
  if (v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__UAFGestalt_queryAllSupportedKeys___block_invoke;
    v9[3] = &unk_24F1F8190;
    v9[4] = &v10;
    if (!+[UAFGestalt deviceMatch:onMatch:](UAFGestalt, "deviceMatch:onMatch:", v4, v9))
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[UAFGestalt queryAllSupportedKeys:]";
        v18 = 2114;
        v19 = v3;
        _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s No matching configs for %{public}@", buf, 0x16u);
      }

      v7 = (void *)v11[5];
      v11[5] = (uint64_t)v5;

    }
    v5 = (id)v11[5];
  }

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __36__UAFGestalt_queryAllSupportedKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SupportedKeys"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
