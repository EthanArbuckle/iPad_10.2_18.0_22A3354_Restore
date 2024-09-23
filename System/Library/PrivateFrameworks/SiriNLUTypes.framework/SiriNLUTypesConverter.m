@implementation SiriNLUTypesConverter

+ (id)convertRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2D18]);
    objc_msgSend(v4, "requestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRequestID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTurnInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertTurnInput:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousTurnInputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertTurnInputs:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "initWithRequestId:currentTurnInput:previousTurnInputs:", v7, v9, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)convertResponse:(id)a3
{
  id v4;
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

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2D28]);
    objc_msgSend(v4, "requestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRequestID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUserParses:](SiriNLUTypesConverter, "convertUserParses:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repetitionResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertRepetitionResults:](SiriNLUTypesConverter, "convertRepetitionResults:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "initWithRequestId:parses:repetitionResults:", v7, v9, v11);

    objc_msgSend(v4, "responseStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertResponseStatus:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResponseStatus:", v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)convertResponseStatus:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v5 = objc_msgSend(v3, "code");
  if (v5 > 299)
  {
    switch(v5)
    {
      case 300:
        v6 = objc_alloc(MEMORY[0x1E0DA2D30]);
        objc_msgSend(v4, "descriptionA");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "initStatusCode:statusDescription:", 300, v7);
        goto LABEL_16;
      case 301:
        v12 = objc_alloc(MEMORY[0x1E0DA2D30]);
        objc_msgSend(v4, "descriptionA");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "initStatusCode:statusDescription:", 301, v7);
        goto LABEL_16;
      case 302:
        v13 = objc_alloc(MEMORY[0x1E0DA2D30]);
        objc_msgSend(v4, "descriptionA");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "initStatusCode:statusDescription:", 302, v7);
        goto LABEL_16;
      case 303:
        v14 = objc_alloc(MEMORY[0x1E0DA2D30]);
        objc_msgSend(v4, "descriptionA");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v14, "initStatusCode:statusDescription:", 303, v7);
        goto LABEL_16;
      default:
        if (v5 != 500)
          goto LABEL_17;
        v10 = objc_alloc(MEMORY[0x1E0DA2D30]);
        objc_msgSend(v4, "descriptionA");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v10, "initStatusCode:statusDescription:", 500, v7);
        break;
    }
    goto LABEL_16;
  }
  if (!v5)
  {
    v11 = objc_alloc(MEMORY[0x1E0DA2D30]);
    objc_msgSend(v4, "descriptionA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "initStatusCode:statusDescription:", 0, v7);
    goto LABEL_16;
  }
  if (v5 == 100)
  {
    v15 = objc_alloc(MEMORY[0x1E0DA2D30]);
    objc_msgSend(v4, "descriptionA");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v15, "initStatusCode:statusDescription:", 100, v7);
    goto LABEL_16;
  }
  if (v5 != 101)
  {
LABEL_17:
    loggerContext(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 136315394;
      v20 = "+[SiriNLUTypesConverter convertResponseStatus:]";
      v21 = 1024;
      v22 = objc_msgSend(v4, "code");
      _os_log_impl(&dword_1C1D3C000, v17, OS_LOG_TYPE_INFO, "%s [WARN]: Unknown status code: %d", (uint8_t *)&v19, 0x12u);
    }

    goto LABEL_20;
  }
  v9 = objc_alloc(MEMORY[0x1E0DA2D30]);
  objc_msgSend(v4, "descriptionA");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "initStatusCode:statusDescription:", 101, v7);
LABEL_16:
  v16 = (void *)v8;

LABEL_21:
  return v16;
}

+ (id)convertUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v7[1] = objc_msgSend(v3, "highInt", objc_msgSend(v3, "lowInt"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)convertRequestID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2D20]);
    objc_msgSend(v3, "idA");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nluRequestId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connectionId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithIdAsString:nluRequestId:connectionID:", v5, v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertTurnInput:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "hasLocale") & 1) != 0)
    {
      objc_msgSend(v5, "locale");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      loggerContext(1);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 136315138;
        v18 = "+[SiriNLUTypesConverter convertTurnInput:]";
        _os_log_impl(&dword_1C1D3C000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: Not expecting nil locale, defaulting to en_US", (uint8_t *)&v17, 0xCu);
      }

      v6 = CFSTR("en_US");
    }
    loggerContext(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v17 = 136315138;
      v18 = "+[SiriNLUTypesConverter convertTurnInput:]";
      _os_log_impl(&dword_1C1D3C000, v9, OS_LOG_TYPE_INFO, "%s [WARN]: SIRINLUEXTERNALTurnInput doesn't have EntityCandidates", (uint8_t *)&v17, 0xCu);
    }

    v10 = objc_alloc(MEMORY[0x1E0DA2D88]);
    objc_msgSend(v5, "asrOutputs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertAsrOutputs:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    objc_msgSend(v5, "turnContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertTurnContext:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v10, "initWithAsrOutputs:salientEntities:turnContext:locale:tapToEdit:startTimestamp:", v12, v13, v15, v6, objc_msgSend(v5, "tapToEdit"), objc_msgSend(v5, "startTimestamp"));

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DA2D88]);
  }

  return v7;
}

+ (id)convertTurnInputs:(id)a3
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
          objc_msgSend(a1, "convertTurnInput:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertAsrHypothesis:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2CC0]);
    objc_msgSend(v4, "utterance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "probability");
    v8 = v7;
    objc_msgSend(v4, "asrTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertAsrTokens:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "idA");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v5, "initWithUtterance:probability:asrTokens:uuid:", v6, v10, v12, v8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)convertAsrOutputs:(id)a3
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
          objc_msgSend(a1, "convertAsrHypothesis:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertAsrTokenInformation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v13;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2CC8]);
    objc_msgSend(v3, "postItnText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneSequence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ipaPhoneSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "addSpaceAfter");
    v8 = objc_msgSend(v3, "removeSpaceAfter");
    v9 = objc_msgSend(v3, "removeSpaceBefore");
    objc_msgSend(v3, "confidenceScore");
    v11 = (void *)objc_msgSend(v4, "initWithPostITNText:phoneSequence:ipaPhoneSequence:addSpaceAfter:removeSpaceAfter:removeSpaceBefore:confidenceScore:beginIndex:endIndex:startMilliSeconds:endMilliSeconds:", v13, v5, v6, v7, v8, v9, v10, __PAIR64__(objc_msgSend(v3, "endIndex"), objc_msgSend(v3, "beginIndex")), __PAIR64__(objc_msgSend(v3, "endMilliSeconds"), objc_msgSend(v3, "startMilliSeconds")));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)convertAsrTokens:(id)a3
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
          objc_msgSend(a1, "convertAsrTokenInformation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (void)convertRewrittenUtterance:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  loggerContext(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "+[SiriNLUTypesConverter convertRewrittenUtterance:]";
    _os_log_impl(&dword_1C1D3C000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: RewrittenUtterance was added on Nov 9 It doesn't have a hand-crafted SIRINLU equivalent", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)convertTask:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasTask"))
    {
      objc_msgSend(v4, "task");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    v8 = 0.0;
    if (objc_msgSend(v4, "hasScore"))
    {
      objc_msgSend(v4, "score");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v8 = v10;

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2D78]), "initWithTask:score:", v6, v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertTasks:(id)a3
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
          objc_msgSend(a1, "convertTask:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertRRAnnotation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2CF8]);
    objc_msgSend(v3, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithKey:value:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertRRAnnotations:(id)a3
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
          objc_msgSend(a1, "convertRRAnnotation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
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

+ (id)convertRRGroupIdentifer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2D00]);
    objc_msgSend(v3, "groupId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithGroupId:seq:", v6, objc_msgSend(v3, "seq"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertEntityCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "entity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "entity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
    v9 = 0.0;
    if (objc_msgSend(v5, "hasScore"))
    {
      objc_msgSend(v5, "score");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v9 = v11;

    }
    v12 = objc_alloc(MEMORY[0x1E0DA2CD8]);
    objc_msgSend(v5, "entityId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRRGroupIdentifer:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "annotations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRRAnnotations:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v12, "initWithEntity:score:entityId:appBundleId:groupId:annotations:", v22, v13, v15, v17, v19, v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)convertEntityCandidates:(id)a3
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
          objc_msgSend(a1, "convertEntityCandidate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertParser:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DA2CF0]);
    v5 = objc_msgSend(v3, "algorithm");
    if (v5 < 3)
      objc_msgSend(v4, "setAlgorithmType:", v5);
    v6 = objc_msgSend(v3, "parserId", v5);
    if (v6 <= 7)
      objc_msgSend(v4, "setParserIdentifier:", v6);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertUserParse:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2DA8]);
    objc_msgSend(v4, "userDialogActs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUDAConverter convertUserDialogActs:](SiriNLUTypesUDAConverter, "convertUserDialogActs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "probability");
    v9 = v8;
    objc_msgSend(v4, "idA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parserId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repetitionResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRepetitionResult:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "comparableProbability");
    v16 = (void *)objc_msgSend(v5, "initWithUserDialogActs:probability:nsUUID:parserId:repetitionResult:comparableProbability:", v7, v11, v12, v14, v9, v15);

    objc_msgSend(v4, "parser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertParser:](SiriNLUTypesConverter, "convertParser:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setParser:", v18);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)convertUserParses:(id)a3
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
          objc_msgSend(a1, "convertUserParse:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertRepetitionResult:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2D10]), "initWithAsrHypothesisIndex:repetitionType:", objc_msgSend(v3, "asrHypothesisIndex"), objc_msgSend(v3, "repetitionType"));
  else
    v4 = objc_alloc_init(MEMORY[0x1E0DA2D10]);
  v5 = v4;

  return v5;
}

+ (id)convertRepetitionResults:(id)a3
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
          objc_msgSend(a1, "convertRepetitionResult:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertTurnContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2D80]);
    objc_msgSend(v4, "nlContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertNLContext:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legacyNlContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertLegacyNLContext:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "initWithNLContext:legacyNLContext:", v7, v9);

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DA2D80]);
  }

  return v10;
}

+ (id)convertNLContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DA2CE8]);
    objc_msgSend(v4, "systemDialogActs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesSDAConverter convertSystemDialogActs:](SiriNLUTypesSDAConverter, "convertSystemDialogActs:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeTasks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertTasks:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executedTasks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertTasks:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "salientEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertEntityCandidates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v5, "initWithSystemDialogActs:activeTasks:executedTasks:salientEntities:", v6, v8, v10, v12);

  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DA2CE8]);
  }

  return v13;
}

+ (id)convertLegacyNLContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "renderedTexts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v9, "value");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (!v11)
          {
            objc_msgSend(v9, "value");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }

    v13 = objc_msgSend(v3, "legacyContextSource");
    if (v13 - 1 >= 3)
      v14 = 0;
    else
      v14 = v13;
    v15 = objc_alloc(MEMORY[0x1E0DA2CE0]);
    v16 = objc_msgSend(v3, "dictationPrompt");
    v17 = objc_msgSend(v3, "strictPrompt");
    objc_msgSend(v3, "previousDomainName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v15, "initWithDictationPrompt:strictPrompt:previousDomainName:listenAfterSpeaking:renderedTexts:legacyContextSource:", v16, v17, v18, objc_msgSend(v3, "listenAfterSpeaking"), v4, v14);

  }
  else
  {
    v19 = objc_alloc_init(MEMORY[0x1E0DA2CE0]);
  }

  return v19;
}

+ (id)convertMatchingSpan:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  unint64_t i;
  void *v16;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasLabel"))
    {
      objc_msgSend(v4, "label");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &stru_1E7BB3508;
    }
    if (objc_msgSend(v4, "hasInput"))
    {
      objc_msgSend(v4, "input");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_1E7BB3508;
    }
    if (objc_msgSend(v4, "hasStartTokenIndex"))
      v8 = objc_msgSend(v4, "startTokenIndex");
    else
      v8 = 0;
    if (objc_msgSend(v4, "hasEndTokenIndex"))
      v9 = objc_msgSend(v4, "endTokenIndex");
    else
      v9 = 0;
    objc_msgSend(v4, "usoGraph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "usoGraph");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0.0;
    if (objc_msgSend(v4, "hasScore"))
    {
      objc_msgSend(v4, "score");
      v12 = v13;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; objc_msgSend(v4, "matcherNamesCount") > i; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "matcherNamesAtIndex:", i));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2D40]), "initWithLabel:input:startTokenIndex:endTokenIndex:usoGraph:score:matcherNames:", v5, v7, v8, v9, v10, v14, v12);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)convertMatchingSpans:(id)a3
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
          objc_msgSend(a1, "convertMatchingSpan:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

@end
