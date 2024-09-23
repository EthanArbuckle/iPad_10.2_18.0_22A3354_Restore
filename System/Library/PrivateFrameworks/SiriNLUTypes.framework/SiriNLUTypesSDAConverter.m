@implementation SiriNLUTypesSDAConverter

+ (id)convertSystemDialogAct:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "hasGaveOptions"))
  {
    objc_msgSend(v5, "gaveOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertSystemGaveOptions:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "hasInformed"))
  {
    objc_msgSend(v5, "informed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertSystemInformed:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "hasOffered"))
  {
    objc_msgSend(v5, "offered");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertSystemOffered:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "hasPrompted"))
  {
    objc_msgSend(v5, "prompted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertSystemPrompted:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "hasReportedFailure"))
  {
    objc_msgSend(v5, "reportedFailure");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertSystemReportedFailure:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "hasReportedSuccess"))
    {
LABEL_17:
      loggerContext(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 136315394;
        v14 = "+[SiriNLUTypesSDAConverter convertSystemDialogAct:]";
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1C1D3C000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: Encountered an unknown SDA %@", (uint8_t *)&v13, 0x16u);
      }

      goto LABEL_20;
    }
    objc_msgSend(v5, "reportedSuccess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertSystemReportedSuccess:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  if (!v8)
    goto LABEL_17;
  if (objc_msgSend(v5, "hasRenderedText"))
  {
    objc_msgSend(v5, "renderedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRenderedText:", v10);

  }
LABEL_21:

  return v8;
}

+ (id)convertSystemDialogActs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertSystemDialogAct:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v5, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  return v5;
}

+ (id)convertSystemGaveOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2D48]);
    objc_msgSend(v3, "choices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUDAConverter convertUserDialogActs:](SiriNLUTypesUDAConverter, "convertUserDialogActs:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithChoices:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertSystemInformed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "entities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "entities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraphs:](SiriNLUTypesUsoGraphConverter, "convertUsoGraphs:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2D50]), "initWithEntities:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertSystemOffered:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2D58]);
    objc_msgSend(v3, "offeredAct");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUDAConverter convertUserDialogAct:](SiriNLUTypesUDAConverter, "convertUserDialogAct:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithOfferedAct:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertSystemPrompted:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "target");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2D60]), "initWithReference:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertSystemReportedFailure:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "reason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "task");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = objc_alloc(MEMORY[0x1E0DA2D68]);
    objc_msgSend(v4, "taskId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithTaskId:reason:task:", v11, v5, v7);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)convertSystemReportedSuccess:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "task");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = objc_alloc(MEMORY[0x1E0DA2D70]);
    objc_msgSend(v4, "taskId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTaskId:task:", v9, v5);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
