@implementation SiriNLUTypesUDAConverter

+ (id)convertUserDialogAct:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_26;
  if (objc_msgSend(v4, "hasAlignment"))
  {
    objc_msgSend(v5, "alignment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertUtteranceAlignment:", v6);

  }
  if (!objc_msgSend(v5, "hasAccepted"))
  {
    if (objc_msgSend(v5, "hasRejected"))
    {
      objc_msgSend(v5, "rejected");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserRejected:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasCancelled"))
    {
      objc_msgSend(v5, "cancelled");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserCancelled:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasWantedToRepeat"))
    {
      objc_msgSend(v5, "wantedToRepeat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserWantedToRepeat:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasAcknowledged"))
    {
      objc_msgSend(v5, "acknowledged");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserAcknowledged:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasWantedToProceed"))
    {
      objc_msgSend(v5, "wantedToProceed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserWantedToProceed:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasWantedToPause"))
    {
      objc_msgSend(v5, "wantedToPause");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserWantedToPause:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasDelegated"))
    {
      objc_msgSend(v5, "delegated");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertDelegatedUserDialogAct:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "hasUserStatedTask"))
    {
      objc_msgSend(v5, "userStatedTask");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "convertUserStatedTask:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    loggerContext(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 136315394;
      v13 = "+[SiriNLUTypesUDAConverter convertUserDialogAct:]";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C1D3C000, v10, OS_LOG_TYPE_INFO, "%s [WARN]: Encountered an unknown UDA %@", (uint8_t *)&v12, 0x16u);
    }

LABEL_26:
    v9 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v5, "accepted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "convertUserAccepted:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v9 = (void *)v8;

LABEL_27:
  return v9;
}

+ (id)convertUserDialogActs:(id)a3
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
          objc_msgSend(a1, "convertUserDialogAct:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertUserAccepted:(id)a3
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
    v4 = objc_alloc(MEMORY[0x1E0DA2D90]);
    objc_msgSend(v3, "offerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithOfferId:reference:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertUserRejected:(id)a3
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
    v4 = objc_alloc(MEMORY[0x1E0DA2DB0]);
    objc_msgSend(v3, "offerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithOfferId:reference:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertUserCancelled:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasTaskId") & 1) != 0)
    {
      v5 = objc_alloc(MEMORY[0x1E0DA2DA0]);
      objc_msgSend(v4, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v5, "initWithTaskId:reference:", v7, v9);

    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0DA2DA0]);
      objc_msgSend(v4, "reference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithReference:", v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUserWantedToRepeat:(id)a3
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
    v4 = objc_alloc(MEMORY[0x1E0DA2DD0]);
    objc_msgSend(v3, "systemDialogActId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithSystemDialogActId:reference:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertUserAcknowledged:(id)a3
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
    v4 = objc_alloc(MEMORY[0x1E0DA2D98]);
    objc_msgSend(v3, "systemDialogActId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithSystemDialogActId:reference:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)convertUserWantedToProceed:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasTaskId") & 1) != 0)
    {
      v5 = objc_alloc(MEMORY[0x1E0DA2DC8]);
      objc_msgSend(v4, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v5, "initWithTaskId:reference:", v7, v9);

    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0DA2DC8]);
      objc_msgSend(v4, "reference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithReference:", v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUserWantedToPause:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "hasTaskId") & 1) != 0)
    {
      v5 = objc_alloc(MEMORY[0x1E0DA2DC0]);
      objc_msgSend(v4, "taskId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesConverter convertUUID:](SiriNLUTypesConverter, "convertUUID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v5, "initWithTaskId:reference:", v7, v9);

    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0DA2DC0]);
      objc_msgSend(v4, "reference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithReference:", v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertRewriteMessages:(id)a3
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
          objc_msgSend(a1, "convertRewriteMessage:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
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

+ (id)convertRewriteMessage:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2D38]);
    v5 = objc_msgSend(v3, "rewriteType");
    objc_msgSend(v3, "rewrittenUtterance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithType:utterance:", v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)convertReferenceContext:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA2D08]), "initWithContextualReference:DisambiguationNeeded:", objc_msgSend(v3, "contextualReference"), objc_msgSend(v3, "disambiguationNeeded"));
  else
    v4 = 0;

  return v4;
}

+ (id)convertDelegatedUserDialogAct:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "hasRewrittenUtterance"))
    {
      objc_msgSend(v5, "rewrittenUtterance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v5, "hasAsrHypothesisIndex"))
      v9 = objc_msgSend(v5, "asrHypothesisIndex");
    else
      v9 = 0;
    objc_msgSend(v5, "matchingSpans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "matchingSpans");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SiriNLUTypesConverter convertMatchingSpans:](SiriNLUTypesConverter, "convertMatchingSpans:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(v5, "rewrite");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertRewriteMessage:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "referenceContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertReferenceContext:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0DA2CD0]);
    objc_msgSend(v5, "externalParserId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v17, "initWithAsrHypothesisIndex:rewrittenUtterace:externalParserId:spans:rewriteMessage:referenceContext:", v9, v7, v18, v12, v14, v16);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)convertUserStatedTask:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DA2DB8]);
    objc_msgSend(v3, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUTypesUsoGraphConverter convertUsoGraph:](SiriNLUTypesUsoGraphConverter, "convertUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithTask:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)convertUtteranceAlignment:(id)a3
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
    v5 = "+[SiriNLUTypesUDAConverter convertUtteranceAlignment:]";
    _os_log_impl(&dword_1C1D3C000, v3, OS_LOG_TYPE_INFO, "%s [WARN]: UtteranceAlignment was recently and doesn't have a hand-crafted SIRINLU equivalent", (uint8_t *)&v4, 0xCu);
  }

}

@end
