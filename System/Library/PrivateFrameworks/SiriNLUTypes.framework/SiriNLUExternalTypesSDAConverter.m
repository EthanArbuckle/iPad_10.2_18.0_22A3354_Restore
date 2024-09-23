@implementation SiriNLUExternalTypesSDAConverter

+ (id)convertFromSystemDialogActs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromSystemDialogAct:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromSystemDialogAct:(id)a3
{
  id v4;
  SIRINLUEXTERNALSystemDialogAct *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALSystemDialogAct);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromSystemGaveOptions:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALSystemDialogAct setGaveOptions:](v5, "setGaveOptions:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "convertFromSystemInformed:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SIRINLUEXTERNALSystemDialogAct setInformed:](v5, "setInformed:", v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "convertFromSystemOffered:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[SIRINLUEXTERNALSystemDialogAct setOffered:](v5, "setOffered:", v6);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "convertFromSystemPrompted:", v4);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            -[SIRINLUEXTERNALSystemDialogAct setPrompted:](v5, "setPrompted:", v6);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(a1, "convertFromSystemReportedFailure:", v4);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              -[SIRINLUEXTERNALSystemDialogAct setReportedFailure:](v5, "setReportedFailure:", v6);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
LABEL_16:
                objc_msgSend(v4, "renderedText");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                +[SiriNLUExternalTypesConverter convertFromString:](SiriNLUExternalTypesConverter, "convertFromString:", v7);
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                -[SIRINLUEXTERNALSystemDialogAct setRenderedText:](v5, "setRenderedText:", v8);

                goto LABEL_17;
              }
              objc_msgSend(a1, "convertFromSystemReportedSuccess:", v4);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              -[SIRINLUEXTERNALSystemDialogAct setReportedSuccess:](v5, "setReportedSuccess:", v6);
            }
          }
        }
      }
    }

    goto LABEL_16;
  }
  v5 = 0;
LABEL_17:

  return v5;
}

+ (id)convertFromSystemGaveOptions:(id)a3
{
  id v3;
  SIRINLUEXTERNALSystemGaveOptions *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemGaveOptions);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "choices", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          +[SiriNLUExternalTypesUDAConverter convertFromUserDialogAct:](SiriNLUExternalTypesUDAConverter, "convertFromUserDialogAct:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[SIRINLUEXTERNALSystemGaveOptions setChoices:](v4, "setChoices:", v5);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemInformed:(id)a3
{
  id v3;
  SIRINLUEXTERNALSystemInformed *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemInformed);
    objc_msgSend(v3, "entities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "entities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraphs:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraphs:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SIRINLUEXTERNALSystemInformed setEntities:](v4, "setEntities:", v5);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemOffered:(id)a3
{
  id v3;
  SIRINLUEXTERNALSystemOffered *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemOffered);
    objc_msgSend(v3, "offeredAct");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUDAConverter convertFromUserDialogAct:](SiriNLUExternalTypesUDAConverter, "convertFromUserDialogAct:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSystemOffered setOfferedAct:](v4, "setOfferedAct:", v6);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromSystemPrompted:(id)a3
{
  id v3;
  SIRINLUEXTERNALSystemPrompted *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemPrompted);
    objc_msgSend(v3, "reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "reference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SIRINLUEXTERNALSystemPrompted setTarget:](v4, "setTarget:", v5);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemReportedFailure:(id)a3
{
  id v3;
  SIRINLUEXTERNALSystemReportedFailure *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemReportedFailure);
    objc_msgSend(v3, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "reason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SIRINLUEXTERNALSystemReportedFailure setReason:](v4, "setReason:", v5);
    objc_msgSend(v3, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "task");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SIRINLUEXTERNALSystemReportedFailure setTask:](v4, "setTask:", v7);
    objc_msgSend(v3, "taskId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSystemReportedFailure setTaskId:](v4, "setTaskId:", v10);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemReportedSuccess:(id)a3
{
  id v3;
  SIRINLUEXTERNALSystemReportedSuccess *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemReportedSuccess);
    objc_msgSend(v3, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "task");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SIRINLUEXTERNALSystemReportedSuccess setTask:](v4, "setTask:", v5);
    objc_msgSend(v3, "taskId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSystemReportedSuccess setTaskId:](v4, "setTaskId:", v8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
