@implementation MDDialogTransformer

+ (NSDictionary)dialogIdentifiers
{
  return (NSDictionary *)(id)dialogIdentifiers;
}

+ (void)setDialogIdentifiers:(id)a3
{
  objc_storeStrong((id *)&dialogIdentifiers, a3);
}

+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  void *v4;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a1, "_logModeComputationForAceCommand:mode:", v7, a4);
  v8 = objc_msgSend(a1, "_typeOfAddViews:", v7);
  switch(v8)
  {
    case 2:
      v13 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        +[MDDialogTransformer transformAddViews:forMode:].cold.1(v13, v7);
      v4 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v4, "setViews:", MEMORY[0x24BDBD1A8]);
      break;
    case 1:
      v14 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(v7, "aceId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 136315394;
        v19 = "+[MDDialogTransformer transformAddViews:forMode:]";
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_215D0F000, v15, OS_LOG_TYPE_DEFAULT, "%s #modes Found dialog AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(a1, "_transformDialogAddViews:forMode:", v7, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 0:
      v9 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v7, "aceId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 136315394;
        v19 = "+[MDDialogTransformer transformAddViews:forMode:]";
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_215D0F000, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Found legacy AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(a1, "_transformLegacyAddViews:forMode:", v7, a4);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v4 = (void *)v12;
      break;
  }

  return v4;
}

+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  NSObject **v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a1, "_logModeComputationForAceCommand:mode:", v6, a4);
  v7 = (NSObject **)MEMORY[0x24BE08FB0];
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dialogs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v38 = "+[MDDialogTransformer transformAddDialogs:forMode:]";
    v39 = 2112;
    v40 = v10;
    v41 = 2048;
    v42 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_215D0F000, v9, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) contains %tu dialogs", buf, 0x20u);

  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_msgSend(a1, "_alwaysPrintSiriResponse");
  if (v13)
  {
    v14 = *v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "+[MDDialogTransformer transformAddDialogs:forMode:]";
      _os_log_impl(&dword_215D0F000, v14, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
    }
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v6, "dialogs", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((v13 | objc_msgSend(v20, "spokenOnly") ^ 1) == 1)
        {
          objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v20, a4, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

        }
        if ((objc_msgSend(v20, "printedOnly") & 1) == 0 && a4 <= 3 && a4 != 2)
        {
          objc_msgSend(a1, "_sayItForDialog:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v17);
  }

  v23 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v24 = v23;
    objc_msgSend(v31, "aceId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v12, "count");
    v27 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 136315906;
    v38 = "+[MDDialogTransformer transformAddDialogs:forMode:]";
    v39 = 2112;
    v40 = v25;
    v41 = 2048;
    v42 = v26;
    v43 = 2048;
    v44 = v27;
    _os_log_impl(&dword_215D0F000, v24, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) transformed into %tu utterance views and %tu sayIts.", buf, 0x2Au);

  }
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(a1, "_addViewsForAddDialogs:views:", v31, v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v29);

  }
  if (objc_msgSend(v32, "count"))
    objc_msgSend(v28, "addObjectsFromArray:", v32);

  return v28;
}

+ (BOOL)supportsTransformationForAceCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (unint64_t)_typeOfAddViews:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "views", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        v7 |= objc_opt_isKindOfClass();
        objc_msgSend(v11, "dialog");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = v12 != 0;

        v8 |= v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);

    if ((v7 & v8 & 1) != 0)
      v13 = 2;
    else
      v13 = v8 & 1;
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

+ (BOOL)_shouldTransformLegacyAddViews
{
  return 1;
}

+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4
{
  void *v4;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if ((objc_msgSend(a1, "_shouldTransformLegacyAddViews") & 1) == 0)
    goto LABEL_12;
  if (a4 < 2 || a4 == 3)
  {
    if (!objc_msgSend(a1, "_alwaysPrintSiriResponse"))
    {
      objc_msgSend(a1, "_removeUtteranceViewsFromAddViews:forMode:", v7, a4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "+[MDDialogTransformer _transformLegacyAddViews:forMode:]";
      _os_log_impl(&dword_215D0F000, v10, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v14, 0xCu);
    }
LABEL_12:
    v11 = v7;
LABEL_13:
    v4 = v11;
    goto LABEL_14;
  }
  if (a4 == 2)
  {
    if (objc_msgSend(a1, "_alwaysPrintSiriResponse"))
    {
      v8 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = "+[MDDialogTransformer _transformLegacyAddViews:forMode:]";
        _os_log_impl(&dword_215D0F000, v8, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v14, 0xCu);
      }
      v9 = v7;
    }
    else
    {
      objc_msgSend(a1, "_removeRedundantUtteranceViewsFromAddViews:forMode:", v7, 2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v9;
    objc_msgSend(a1, "_removeSpeakableTextFromAddViews:forMode:", v9, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v4;
}

+ (id)_configurationDictionary
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__MDDialogTransformer__configurationDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_configurationDictionary_onceToken != -1)
    dispatch_once(&_configurationDictionary_onceToken, block);
  return (id)_configurationDictionary_configDictionary;
}

void __47__MDDialogTransformer__configurationDictionary__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("ModesConfiguration"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_configurationDictionary_configDictionary;
  _configurationDictionary_configDictionary = v2;

  if (!_configurationDictionary_configDictionary)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __47__MDDialogTransformer__configurationDictionary__block_invoke_cold_1();
    v4 = (void *)_configurationDictionary_configDictionary;
    _configurationDictionary_configDictionary = MEMORY[0x24BDBD1B8];

  }
}

+ (id)_redundantDUCIds
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__MDDialogTransformer__redundantDUCIds__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_redundantDUCIds_onceToken != -1)
    dispatch_once(&_redundantDUCIds_onceToken, block);
  return (id)_redundantDUCIds_redundantDUCIds;
}

void __39__MDDialogTransformer__redundantDUCIds__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_configurationDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("redundantDUCs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v2, "count"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_redundantDUCIds_redundantDUCIds;
  _redundantDUCIds_redundantDUCIds = v3;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)_redundantDUCIds_redundantDUCIds;
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "lowercaseString", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (BOOL)_alwaysPrintSiriResponse
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "siriResponseShouldAlwaysPrint");

  return v3;
}

+ (id)_firstSnippetInViews:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "views");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_firstSnippetInViews:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v27 = v7;
    objc_msgSend(a1, "_redundantDUCIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v5, "views");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            objc_msgSend(v15, "dialogIdentifier");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            v18 = &stru_24D4722A8;
            if (v16)
              v18 = (__CFString *)v16;
            v19 = v18;

            -[__CFString lowercaseString](v19, "lowercaseString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v29, "containsObject:", v20);

            if (v21)
            {
              v22 = (void *)*MEMORY[0x24BE08FB0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
              {
                v23 = v22;
                MDModeGetName(a4);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v35 = "+[MDDialogTransformer _removeRedundantUtteranceViewsFromAddViews:forMode:]";
                v36 = 2112;
                v37 = v19;
                v38 = 2112;
                v39 = v24;
                _os_log_impl(&dword_215D0F000, v23, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing redundant AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);

              }
            }
            else
            {
              objc_msgSend(v8, "addObject:", v15);
            }

          }
          else
          {
            objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v11);
    }

    v25 = (id)objc_msgSend(v5, "copy");
    objc_msgSend(v25, "setViews:", v8);

    v7 = v27;
  }
  else
  {
    v25 = v5;
  }

  return v25;
}

+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  void *v58;
  uint64_t v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  objc_msgSend(v54, "views");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v66;
    v55 = *(_QWORD *)v66;
    do
    {
      v7 = 0;
      v56 = v5;
      do
      {
        if (*(_QWORD *)v66 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v7);
        objc_msgSend(v8, "speakableText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "speakableText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length");

          if (v11)
          {
            v12 = (void *)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v13 = v12;
              objc_msgSend(v8, "speakableText");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "aceId");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              MDModeGetName(a4);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v72 = 2112;
              v73 = v14;
              v74 = 2112;
              v75 = v15;
              v76 = 2112;
              v77 = v16;
              _os_log_impl(&dword_215D0F000, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from view %@ for current mode: %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v8, "setSpeakableText:", 0);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v8;
          objc_msgSend(v17, "speakableSuffix");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");

          if (v19)
          {
            v20 = (void *)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v21 = v20;
              objc_msgSend(v17, "speakableSuffix");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "aceId");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              MDModeGetName(a4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v72 = 2112;
              v73 = v22;
              v74 = 2112;
              v75 = v23;
              v76 = 2112;
              v77 = v24;
              _os_log_impl(&dword_215D0F000, v21, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableSuffix '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v17, "setSpeakableSuffix:", 0);
          objc_msgSend(v17, "speakableDelimiter");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length");

          if (v26)
          {
            v27 = (void *)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v28 = v27;
              objc_msgSend(v17, "speakableDelimiter");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "aceId");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              MDModeGetName(a4);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v72 = 2112;
              v73 = v29;
              v74 = 2112;
              v75 = v30;
              v76 = 2112;
              v77 = v31;
              _os_log_impl(&dword_215D0F000, v28, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);

            }
          }
          v59 = v7;
          objc_msgSend(v17, "setSpeakableDelimiter:", 0);
          objc_msgSend(v17, "speakableFinalDelimiter");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "length");

          if (v33)
          {
            v34 = (void *)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v35 = v34;
              objc_msgSend(v17, "speakableFinalDelimiter");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "aceId");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              MDModeGetName(a4);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              v72 = 2112;
              v73 = v36;
              v74 = 2112;
              v75 = v37;
              v76 = 2112;
              v77 = v38;
              _os_log_impl(&dword_215D0F000, v35, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableFinalDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);

            }
          }
          objc_msgSend(v17, "setSpeakableFinalDelimiter:", 0);
          v58 = v17;
          objc_msgSend(v17, "items");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v62;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v62 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                objc_msgSend(v44, "speakableText");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v45, "length");

                if (v46)
                {
                  v47 = (void *)*MEMORY[0x24BE08FB0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
                  {
                    v48 = v47;
                    objc_msgSend(v44, "speakableText");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "aceId");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    MDModeGetName(a4);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136315906;
                    v71 = "+[MDDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
                    v72 = 2112;
                    v73 = v49;
                    v74 = 2112;
                    v75 = v50;
                    v76 = 2112;
                    v77 = v51;
                    _os_log_impl(&dword_215D0F000, v48, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from SAUIListItem %@ for current mode: %@", buf, 0x2Au);

                  }
                }
                objc_msgSend(v44, "setSpeakableText:", 0);
              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
            }
            while (v41);
          }
          objc_msgSend(v58, "setItems:", v39);

          v6 = v55;
          v5 = v56;
          v7 = v59;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v5);
  }
  v52 = (void *)objc_msgSend(v54, "copy");
  objc_msgSend(v52, "setViews:", obj);

  return v52;
}

+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "views");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_firstSnippetInViews:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v38 = a1;
    v42 = v5;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v45 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v46 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v40 = v7;
    objc_msgSend(v7, "listenAfterSpeaking");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "BOOLValue");

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v41 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    v44 = v8;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v48;
      v14 = 1;
      v15 = v45;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;
            objc_msgSend(v18, "speakableText");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v18, "speakableText");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v20);

              v14 &= objc_msgSend(v18, "canUseServerTTS");
            }
            objc_msgSend(v18, "dialogIdentifier", v38);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v18, "dialogIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v22);

            }
            objc_msgSend(v18, "listenAfterSpeaking");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "BOOLValue");

            v24 = (void *)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v25 = v24;
              objc_msgSend(v18, "dialogIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              MDModeGetName(a4);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v54 = "+[MDDialogTransformer _removeUtteranceViewsFromAddViews:forMode:]";
              v55 = 2112;
              v56 = v26;
              v57 = 2112;
              v58 = v27;
              _os_log_impl(&dword_215D0F000, v25, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);

              v8 = v44;
              v15 = v45;

            }
          }
          else
          {
            objc_msgSend(v46, "addObject:", v17);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v12);
    }
    else
    {
      LOBYTE(v14) = 1;
    }

    v7 = v40;
    objc_msgSend(v40, "speakableText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v40, "speakableText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v30);

    }
    if (objc_msgSend(v8, "count", v38))
    {
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setSpeakableText:", v31);
      objc_msgSend(v40, "setCanUseServerTTS:", v14 & 1);

    }
    if (v45)
    {
      objc_msgSend(v40, "aceId");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = (void *)MEMORY[0x24BDBCED8];
        v51[0] = CFSTR("snippetAceId");
        objc_msgSend(v40, "aceId");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = CFSTR("dialogIdentifiers");
        v52[0] = v34;
        v52[1] = v45;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dictionaryWithDictionary:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDialogIdentifiers:", v36);

      }
    }
    v5 = v42;
    v28 = (id)objc_msgSend(v42, "copy");
    objc_msgSend(v28, "setViews:", v46);

    v6 = v41;
  }
  else
  {
    v28 = v5;
  }

  return v28;
}

+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v35 = v6;
  objc_msgSend(v6, "views");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    v39 = v8;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
        objc_msgSend(v13, "dialog");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v7, "addObject:", v13);
          goto LABEL_16;
        }
        if (objc_msgSend(a1, "_alwaysPrintSiriResponse"))
        {
          v15 = *MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "+[MDDialogTransformer _transformDialogAddViews:forMode:]";
            _os_log_impl(&dword_215D0F000, v15, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
          }
          objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, objc_msgSend(v14, "printedOnly"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v16;
          v52[1] = v13;
          v17 = (void *)MEMORY[0x24BDBCE30];
          v18 = v52;
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v51[0] = v16;
          v51[1] = v13;
          v17 = (void *)MEMORY[0x24BDBCE30];
          v18 = v51;
LABEL_15:
          objc_msgSend(v17, "arrayWithObjects:count:", v18, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v19);

          goto LABEL_16;
        }
        if (a4 < 2 || a4 == 3)
        {
          if (objc_msgSend(v14, "printedOnly"))
          {
            v23 = v13;
            objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, a4, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v24);

          }
          else
          {
            v23 = (id)objc_msgSend(v13, "copy");
            objc_msgSend(a1, "_speakableTextForDialog:mode:", v14, a4);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setSpeakableText:", v25);

            objc_msgSend(v23, "setCanUseServerTTS:", objc_msgSend(v14, "canUseServerTTS"));
            objc_msgSend(v14, "dialogIdentifier");
            v26 = objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = (void *)v26;
              objc_msgSend(v23, "aceId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                v29 = (void *)MEMORY[0x24BDBCED8];
                v45[0] = CFSTR("snippetAceId");
                objc_msgSend(v23, "aceId");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v45[1] = CFSTR("dialogIdentifiers");
                v46[0] = v38;
                objc_msgSend(v14, "dialogIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v37;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v46[1] = v36;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "dictionaryWithDictionary:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "setDialogIdentifiers:", v31);

              }
              v8 = v39;
            }
          }
          goto LABEL_34;
        }
        if (a4 == 2)
        {
          if (objc_msgSend(v14, "spokenOnly"))
          {
            v20 = (void *)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
            {
              v21 = v20;
              objc_msgSend(v14, "dialogIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v48 = "+[MDDialogTransformer _transformDialogAddViews:forMode:]";
              v49 = 2112;
              v50 = v22;
              _os_log_impl(&dword_215D0F000, v21, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) for DisplayOnly Mode since it is Spoken Only", buf, 0x16u);

              v8 = v39;
              goto LABEL_32;
            }
          }
          else
          {
            objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:", v14, 2, 0);
            v21 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v21);
LABEL_32:

          }
          v23 = v13;
          goto LABEL_34;
        }
        v23 = 0;
LABEL_34:
        objc_msgSend(v7, "addObject:", v23);

LABEL_16:
        ++v12;
      }
      while (v10 != v12);
      v32 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      v10 = v32;
    }
    while (v32);
  }

  v33 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v33, "setViews:", v7);

  return v33;
}

+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  int v35;
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v8, "dialogIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MDModeGetName(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 136315650;
    v36 = "+[MDDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v12;
    _os_log_impl(&dword_215D0F000, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into an Utterance View for current mode: %@", (uint8_t *)&v35, 0x20u);

  }
  v13 = objc_alloc_init(MEMORY[0x24BE81870]);
  objc_msgSend(v8, "aceId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAceId:", v14);

  objc_msgSend(v8, "refId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRefId:", v15);

  objc_msgSend(v13, "setCanUseServerTTS:", objc_msgSend(v8, "canUseServerTTS"));
  objc_msgSend(v8, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContext:", v17);

  objc_msgSend(v8, "dialogIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDialogIdentifier:", v18);

  objc_msgSend(v8, "metricsContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMetricsContext:", v19);

  if (v5)
  {
    objc_msgSend(v8, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "text");
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:

LABEL_6:
    v22 = 0;
  }
  else
  {
    switch(a4)
    {
      case 0uLL:
      case 3uLL:
        objc_msgSend(v8, "content");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "text");
        v21 = (id)objc_claimAutoreleasedReturnValue();

        v24 = a1;
        v25 = v8;
        v26 = a4;
        break;
      case 1uLL:
        objc_msgSend(v8, "caption");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "text");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v21 = v28;
        }
        else
        {
          objc_msgSend(v8, "content");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "text");
          v21 = (id)objc_claimAutoreleasedReturnValue();

        }
        v24 = a1;
        v25 = v8;
        v26 = 1;
        break;
      case 2uLL:
        objc_msgSend(v8, "caption");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "text");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v21 = v30;
        }
        else
        {
          objc_msgSend(v8, "content");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "text");
          v21 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_5;
      default:
        v21 = 0;
        goto LABEL_6;
    }
    objc_msgSend(v24, "_speakableTextForDialog:mode:", v25, v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "setText:", v21);
  objc_msgSend(v13, "setSpeakableText:", v22);

  return v13;
}

+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0uLL:
    case 3uLL:
      v7 = (void *)*MEMORY[0x24BE08FB0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      v8 = v7;
      objc_msgSend(v6, "dialogIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v24 = 136315394;
      *(_QWORD *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
      *(_WORD *)&v24[12] = 2112;
      *(_QWORD *)&v24[14] = v9;
      v10 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for VoiceOnly Mode";
      goto LABEL_4;
    case 1uLL:
      objc_msgSend(v5, "caption");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)*MEMORY[0x24BE08FB0];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          v17 = v15;
          objc_msgSend(v6, "dialogIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v24 = 136315394;
          *(_QWORD *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v24[12] = 2112;
          *(_QWORD *)&v24[14] = v18;
          _os_log_impl(&dword_215D0F000, v17, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) CAPTION into speakable text for DisplayForward Mode", v24, 0x16u);

        }
        objc_msgSend(v6, "caption");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "speakableTextOverride");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
LABEL_11:
          a4 = v12;
          goto LABEL_19;
        }
        objc_msgSend(v6, "caption");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v16)
        {
          v8 = v15;
          objc_msgSend(v6, "dialogIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v24 = 136315394;
          *(_QWORD *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v24[12] = 2112;
          *(_QWORD *)&v24[14] = v9;
          v10 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for DisplayForward Mode (Caption is nil)";
LABEL_4:
          _os_log_impl(&dword_215D0F000, v8, OS_LOG_TYPE_DEFAULT, v10, v24, 0x16u);

        }
LABEL_5:
        objc_msgSend(v6, "content", *(_OWORD *)v24, *(_QWORD *)&v24[16], v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "speakableTextOverride");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_11;
        objc_msgSend(v6, "content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v22 = v13;
      objc_msgSend(v13, "text");
      a4 = objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_20:

      return (id)a4;
    case 2uLL:
      v19 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        objc_msgSend(v6, "dialogIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v24 = 136315394;
        *(_QWORD *)&v24[4] = "+[MDDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v24[12] = 2112;
        *(_QWORD *)&v24[14] = v21;
        _os_log_impl(&dword_215D0F000, v20, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) speakable text for DisplayOnly Mode", v24, 0x16u);

      }
      a4 = 0;
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

+ (id)_sayItForDialog:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "dialogIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136315394;
    v24 = "+[MDDialogTransformer _sayItForDialog:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_215D0F000, v5, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into a SayIt", (uint8_t *)&v23, 0x16u);

  }
  v7 = objc_alloc_init(MEMORY[0x24BE81990]);
  objc_msgSend(v3, "aceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAceId:", v8);

  objc_msgSend(v3, "refId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRefId:", v9);

  objc_msgSend(v7, "setCanUseServerTTS:", objc_msgSend(v3, "canUseServerTTS"));
  objc_msgSend(v3, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v11);

  objc_msgSend(v3, "dialogIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDialogIdentifier:", v12);

  objc_msgSend(v3, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "gender");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGender:", v14);

  objc_msgSend(v3, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "languageCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLanguageCode:", v16);

  objc_msgSend(v3, "content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "speakableTextOverride");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v7, "setMessage:", v18);
  }
  else
  {
    objc_msgSend(v3, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessage:", v20);

  }
  objc_msgSend(v3, "metricsContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMetricsContext:", v21);

  return v7;
}

+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "aceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "+[MDDialogTransformer _addViewsForAddDialogs:views:]";
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_215D0F000, v8, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming AddDialog (aceId = %@) into an AddViews", (uint8_t *)&v20, 0x16u);

  }
  v10 = objc_alloc_init(MEMORY[0x24BE81858]);
  objc_msgSend(v5, "aceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAceId:", v11);

  objc_msgSend(v5, "refId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRefId:", v12);

  objc_msgSend(v5, "metricsContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMetricsContext:", v13);

  objc_msgSend(v5, "listenAfterSpeaking");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listenAfterSpeaking");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setListenAfterSpeaking:", v16);

    objc_msgSend(v6, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listenAfterSpeakingBehavior");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setListenAfterSpeakingBehavior:", v18);

  }
  objc_msgSend(v10, "setViews:", v6);

  return v10;
}

+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("aceId"));

    MDModeGetNameForAnalytics(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("mode"));

    objc_msgSend(v12, "encodedClassName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("aceClass"));

    objc_msgSend(a1, "_analytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEventWithType:context:", 5602, v7);

  }
}

+ (id)_analytics
{
  return (id)objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
}

+ (void)transformAddViews:(void *)a1 forMode:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_215D0F000, v3, v5, "%s #modes Invalid AddViews (aceId = %@). Both AssistantUtteranceView and Dialog on the same AddViews is unsupported.", (uint8_t *)v6);

}

void __47__MDDialogTransformer__configurationDictionary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_215D0F000, v0, v1, "%s #modes Failed to load configuration file: %@", (uint8_t *)v2);
}

@end
