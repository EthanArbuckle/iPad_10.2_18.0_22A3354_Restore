@implementation SiriNLUExternalTypesConverter

+ (id)convertFromUUID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  SIRINLUEXTERNALUUID *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v9 = 0;
    v10 = 0;
    objc_msgSend(v3, "getUUIDBytes:", &v9);
    v6 = v9;
    v5 = v10;
    v7 = objc_alloc_init(SIRINLUEXTERNALUUID);
    -[SIRINLUEXTERNALUUID setLowInt:](v7, "setLowInt:", v6);
    -[SIRINLUEXTERNALUUID setHighInt:](v7, "setHighInt:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertFromNluRequest:(id)a3
{
  id v4;
  SIRINLUEXTERNALCDMNluRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALCDMNluRequest);
    objc_msgSend(v4, "requestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertfromRequestID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALCDMNluRequest setRequestId:](v5, "setRequestId:", v7);

    objc_msgSend(v4, "currentTurnInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromNluTurnInput:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALCDMNluRequest setCurrentTurnInput:](v5, "setCurrentTurnInput:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "previousTurnInputs", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(a1, "convertFromNluTurnInput:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    -[SIRINLUEXTERNALCDMNluRequest setPreviousTurnInputs:](v5, "setPreviousTurnInputs:", v10);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromNluResponse:(id)a3
{
  id v4;
  SIRINLUEXTERNALCDMNluResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALCDMNluResponse);
    objc_msgSend(v4, "requestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertfromRequestID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALCDMNluResponse setRequestId:](v5, "setRequestId:", v7);

    objc_msgSend(v4, "parses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromUserParses:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALCDMNluResponse setParses:](v5, "setParses:", v9);

    objc_msgSend(v4, "repetitionResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromRepetitionResults:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALCDMNluResponse setRepetitionResults:](v5, "setRepetitionResults:", v11);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertfromRequestID:(id)a3
{
  id v3;
  SIRINLUEXTERNALRequestID *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALRequestID);
    objc_msgSend(v3, "idAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALRequestID setIdA:](v4, "setIdA:", v5);

    objc_msgSend(v3, "connectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALRequestID setConnectionId:](v4, "setConnectionId:", v6);

    objc_msgSend(v3, "nluRequestId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALRequestID setNluRequestId:](v4, "setNluRequestId:", v8);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromNluTurnInput:(id)a3
{
  id v4;
  SIRINLUEXTERNALTurnInput *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SIRINLUEXTERNALSystemDialogActGroup *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALTurnInput);
    objc_msgSend(v4, "asrOutputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromAsrOutputs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnInput setAsrOutputs:](v5, "setAsrOutputs:", v7);

    objc_msgSend(v4, "turnContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromNluTurnContext:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnInput setTurnContext:](v5, "setTurnContext:", v9);

    objc_msgSend(v4, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnInput setLocale:](v5, "setLocale:", v10);

    -[SIRINLUEXTERNALTurnInput setTapToEdit:](v5, "setTapToEdit:", objc_msgSend(v4, "tapToEdit"));
    -[SIRINLUEXTERNALTurnInput setStartTimestamp:](v5, "setStartTimestamp:", objc_msgSend(v4, "startTimestamp"));
    objc_msgSend(v4, "systemDialogActs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 1)
    {
      objc_msgSend(v4, "systemDialogActs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUExternalTypesSDAConverter convertFromSystemDialogActs:](SiriNLUExternalTypesSDAConverter, "convertFromSystemDialogActs:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc_init(SIRINLUEXTERNALSystemDialogActGroup);
      -[SIRINLUEXTERNALTurnInput setSystemDialogActGroup:](v5, "setSystemDialogActGroup:", v15);

      objc_msgSend(v14, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALTurnInput systemDialogActGroup](v5, "systemDialogActGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSystemDialogAct:", v16);

    }
    else
    {
      objc_msgSend(v4, "systemDialogActs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 >= 2)
      {
        loggerContext(1);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = 136315138;
          v23 = "+[SiriNLUExternalTypesConverter convertFromNluTurnInput:]";
          _os_log_impl(&dword_1C1D3C000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: The SIRINLUTurnInput contains multiple system dialog act, we are not converting them to SIRINLUEXTERNALTurnInput", (uint8_t *)&v22, 0xCu);
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromNluTurnContext:(id)a3
{
  id v4;
  SIRINLUEXTERNALTurnContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_13;
  }
  v5 = objc_alloc_init(SIRINLUEXTERNALTurnContext);
  objc_msgSend(v4, "legacyNLContextNullable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "legacyNLContextNullable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromNluLegacyNLContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnContext setLegacyNlContext:](v5, "setLegacyNlContext:", v8);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v4, "legacyNLContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "legacyNLContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromNluLegacyNLContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnContext setLegacyNlContext:](v5, "setLegacyNlContext:", v8);
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v4, "nlContextNullable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "nlContextNullable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromContext:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnContext setNlContext:](v5, "setNlContext:", v12);
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "nlContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "nlContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromContext:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTurnContext setNlContext:](v5, "setNlContext:", v12);
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

+ (id)convertFromNluLegacyNLContext:(id)a3
{
  id v4;
  SIRINLUEXTERNALLegacyNLContext *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
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

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALLegacyNLContext);
    -[SIRINLUEXTERNALLegacyNLContext setListenAfterSpeaking:](v5, "setListenAfterSpeaking:", objc_msgSend(v4, "listenAfterSpeaking"));
    objc_msgSend(v4, "previousDomainName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALLegacyNLContext setPreviousDomainName:](v5, "setPreviousDomainName:", v6);

    -[SIRINLUEXTERNALLegacyNLContext setStrictPrompt:](v5, "setStrictPrompt:", objc_msgSend(v4, "strictPrompt"));
    -[SIRINLUEXTERNALLegacyNLContext setDictationPrompt:](v5, "setDictationPrompt:", objc_msgSend(v4, "dictationPrompt"));
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[SIRINLUEXTERNALLegacyNLContext setRenderedTexts:](v5, "setRenderedTexts:", v7);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "renderedTexts", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[SIRINLUEXTERNALLegacyNLContext renderedTexts](v5, "renderedTexts");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "convertFromString:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    switch(objc_msgSend(v4, "legacyContextSource"))
    {
      case 0u:
      case 1u:
      case 3u:
        goto LABEL_12;
      case 2u:
        -[SIRINLUEXTERNALLegacyNLContext setLegacyContextSource:](v5, "setLegacyContextSource:", 2);
LABEL_12:
        -[SIRINLUEXTERNALLegacyNLContext setLegacyContextSource:](v5, "setLegacyContextSource:");
        break;
      default:
        break;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromContext:(id)a3
{
  id v4;
  SIRINLUEXTERNALNLContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALNLContext);
    objc_msgSend(v4, "activeTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromTasks:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALNLContext setActiveTasks:](v5, "setActiveTasks:", v7);

    objc_msgSend(v4, "executedTasks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromTasks:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALNLContext setExecutedTasks:](v5, "setExecutedTasks:", v9);

    objc_msgSend(v4, "systemDialogActs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesSDAConverter convertFromSystemDialogActs:](SiriNLUExternalTypesSDAConverter, "convertFromSystemDialogActs:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALNLContext setSystemDialogActs:](v5, "setSystemDialogActs:", v11);

    objc_msgSend(v4, "salientEntities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromEntityCandidates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALNLContext setSalientEntities:](v5, "setSalientEntities:", v13);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromRRAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKey:", v7);

    objc_msgSend(v4, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromRRAnnotations:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromRRAnnotation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromRRGroupIdentifer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "groupId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroupId:", v7);

    objc_msgSend(v5, "setSeq:", objc_msgSend(v4, "seq"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromEntityCandidate:(id)a3
{
  id v4;
  SIRINLUEXTERNALEntityCandidate *v5;
  void *v6;
  void *v7;
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

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALEntityCandidate);
    objc_msgSend(v4, "score");
    objc_msgSend(a1, "convertFromDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALEntityCandidate setScore:](v5, "setScore:", v6);

    objc_msgSend(v4, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALEntityCandidate setEntity:](v5, "setEntity:", v8);

    objc_msgSend(v4, "appBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALEntityCandidate setAppBundleId:](v5, "setAppBundleId:", v10);

    objc_msgSend(v4, "annotations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(a1, "convertFromRRAnnotations:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALEntityCandidate setAnnotations:](v5, "setAnnotations:", v13);

    objc_msgSend(v4, "groupId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromRRGroupIdentifer:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALEntityCandidate setGroupId:](v5, "setGroupId:", v15);

    objc_msgSend(v4, "entityId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALEntityCandidate setEntityId:](v5, "setEntityId:", v17);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromEntityCandidates:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromEntityCandidate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromTask:(id)a3
{
  id v4;
  SIRINLUEXTERNALTask *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALTask);
    objc_msgSend(v4, "score");
    objc_msgSend(a1, "convertFromDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTask setScore:](v5, "setScore:", v6);

    objc_msgSend(v4, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALTask setTask:](v5, "setTask:", v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromTasks:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromTask:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromNumber:(id)a3
{
  id v3;
  SIRICOMMONInt64Value *v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRICOMMONInt64Value);
    -[SIRICOMMONInt64Value setValue:](v4, "setValue:", (int)objc_msgSend(v3, "intValue"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromDouble:(double)a3
{
  SIRICOMMONDoubleValue *v4;

  v4 = objc_alloc_init(SIRICOMMONDoubleValue);
  -[SIRICOMMONDoubleValue setValue:](v4, "setValue:", a3);
  return v4;
}

+ (id)convertFromString:(id)a3
{
  id v3;
  SIRICOMMONStringValue *v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRICOMMONStringValue);
    -[SIRICOMMONStringValue setValue:](v4, "setValue:", v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromAsrHypothesis:(id)a3
{
  id v4;
  SIRINLUEXTERNALAsrHypothesis *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALAsrHypothesis);
    objc_msgSend(v4, "utterance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALAsrHypothesis setUtterance:](v5, "setUtterance:", v6);

    objc_msgSend(v4, "probability");
    -[SIRINLUEXTERNALAsrHypothesis setProbability:](v5, "setProbability:");
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALAsrHypothesis setIdA:](v5, "setIdA:", v8);

    objc_msgSend(v4, "asrTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromAsrTokens:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALAsrHypothesis setAsrTokens:](v5, "setAsrTokens:", v10);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromAsrTokens:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromAsrTokenInformation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromAsrTokenInformation:(id)a3
{
  id v3;
  SIRINLUEXTERNALAsrTokenInformation *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALAsrTokenInformation);
    objc_msgSend(v3, "phoneSequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALAsrTokenInformation setPhoneSequence:](v4, "setPhoneSequence:", v5);

    objc_msgSend(v3, "confidenceScore");
    -[SIRINLUEXTERNALAsrTokenInformation setConfidenceScore:](v4, "setConfidenceScore:");
    -[SIRINLUEXTERNALAsrTokenInformation setBeginIndex:](v4, "setBeginIndex:", objc_msgSend(v3, "beginIndex"));
    -[SIRINLUEXTERNALAsrTokenInformation setEndIndex:](v4, "setEndIndex:", objc_msgSend(v3, "endIndex"));
    objc_msgSend(v3, "ipaPhoneSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALAsrTokenInformation setIpaPhoneSequence:](v4, "setIpaPhoneSequence:", v6);

    objc_msgSend(v3, "postITNText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALAsrTokenInformation setPostItnText:](v4, "setPostItnText:", v7);

    -[SIRINLUEXTERNALAsrTokenInformation setAddSpaceAfter:](v4, "setAddSpaceAfter:", objc_msgSend(v3, "addSpaceAfter"));
    -[SIRINLUEXTERNALAsrTokenInformation setRemoveSpaceAfter:](v4, "setRemoveSpaceAfter:", objc_msgSend(v3, "removeSpaceAfter"));
    -[SIRINLUEXTERNALAsrTokenInformation setRemoveSpaceBefore:](v4, "setRemoveSpaceBefore:", objc_msgSend(v3, "removeSpaceBefore"));
    -[SIRINLUEXTERNALAsrTokenInformation setStartMilliSeconds:](v4, "setStartMilliSeconds:", objc_msgSend(v3, "startMilliSeconds"));
    -[SIRINLUEXTERNALAsrTokenInformation setEndMilliSeconds:](v4, "setEndMilliSeconds:", objc_msgSend(v3, "endMilliSeconds"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromAsrOutputs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromAsrHypothesis:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertParser:(id)a3
{
  id v3;
  SIRINLUEXTERNALParser *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALParser);
    v5 = objc_msgSend(v3, "algorithmType");
    if (v5 < 3)
      -[SIRINLUEXTERNALParser setAlgorithm:](v4, "setAlgorithm:", v5);
    v6 = objc_msgSend(v3, "parserIdentifier", v5);
    if (v6 <= 7)
      -[SIRINLUEXTERNALParser setParserId:](v4, "setParserId:", v6);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromUserParse:(id)a3
{
  id v4;
  SIRINLUEXTERNALUserParse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALUserParse);
    objc_msgSend(v4, "userDialogActs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesUDAConverter convertFromUserDialogActs:](SiriNLUExternalTypesUDAConverter, "convertFromUserDialogActs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserParse setUserDialogActs:](v5, "setUserDialogActs:", v7);

    objc_msgSend(v4, "probability");
    -[SIRINLUEXTERNALUserParse setProbability:](v5, "setProbability:");
    objc_msgSend(v4, "nsUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserParse setIdA:](v5, "setIdA:", v9);

    objc_msgSend(v4, "parserId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserParse setParserId:](v5, "setParserId:", v10);

    objc_msgSend(v4, "parser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertParser:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserParse setParser:](v5, "setParser:", v12);

    objc_msgSend(v4, "repetitionResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromRepetitionResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserParse setRepetitionResult:](v5, "setRepetitionResult:", v14);

    objc_msgSend(v4, "comparableProbability");
    -[SIRINLUEXTERNALUserParse setComparableProbability:](v5, "setComparableProbability:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertFromUserParses:(id)a3
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
          objc_msgSend(a1, "convertFromUserParse:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
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

+ (id)convertFromRepetitionResult:(id)a3
{
  id v3;
  SIRINLUEXTERNALRepetitionResult *v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALRepetitionResult);
    -[SIRINLUEXTERNALRepetitionResult setAsrHypothesisIndex:](v4, "setAsrHypothesisIndex:", objc_msgSend(v3, "asrHypothesisIndex"));
    -[SIRINLUEXTERNALRepetitionResult setRepetitionType:](v4, "setRepetitionType:", objc_msgSend(v3, "repetitionType"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromRepetitionResults:(id)a3
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
          objc_msgSend(a1, "convertFromRepetitionResult:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
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

+ (id)convertFromMatchingSpan:(id)a3
{
  id v3;
  SIRINLUEXTERNALSpan *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSpan);
    objc_msgSend(v3, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSpan setInput:](v4, "setInput:", v5);

    objc_msgSend(v3, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSpan setLabel:](v4, "setLabel:", v6);

    -[SIRINLUEXTERNALSpan setStartTokenIndex:](v4, "setStartTokenIndex:", objc_msgSend(v3, "startTokenIndex"));
    -[SIRINLUEXTERNALSpan setEndTokenIndex:](v4, "setEndTokenIndex:", objc_msgSend(v3, "endTokenIndex"));
    objc_msgSend(v3, "score");
    -[SIRINLUEXTERNALSpan setScore:](v4, "setScore:");
    objc_msgSend(v3, "usoGraph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSpan setUsoGraph:](v4, "setUsoGraph:", v8);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "matcherNames", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v13, "intValue") == 1)
          {
            v14 = 1;
          }
          else if (objc_msgSend(v13, "intValue") == 2)
          {
            v14 = 2;
          }
          else if (objc_msgSend(v13, "intValue") == 3)
          {
            v14 = 3;
          }
          else
          {
            v14 = 0;
          }
          -[SIRINLUEXTERNALSpan addMatcherNames:](v4, "addMatcherNames:", v14);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromMatchingSpans:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromMatchingSpan:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
