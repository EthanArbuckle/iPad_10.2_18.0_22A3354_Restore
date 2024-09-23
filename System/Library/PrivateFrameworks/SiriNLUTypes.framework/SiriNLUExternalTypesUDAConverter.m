@implementation SiriNLUExternalTypesUDAConverter

+ (id)convertFromUserDialogAct:(id)a3
{
  id v4;
  SIRINLUEXTERNALUserDialogAct *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(SIRINLUEXTERNALUserDialogAct);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromDelegatedUserDialogAct:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setDelegated:](v5, "setDelegated:", v6);
LABEL_21:

      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserAccepted:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setAccepted:](v5, "setAccepted:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserAcknowledged:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setAcknowledged:](v5, "setAcknowledged:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserCancelled:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setCancelled:](v5, "setCancelled:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserRejected:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setRejected:](v5, "setRejected:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserStatedTask:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setUserStatedTask:](v5, "setUserStatedTask:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserWantedToPause:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setWantedToPause:](v5, "setWantedToPause:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserWantedToProceed:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setWantedToProceed:](v5, "setWantedToProceed:", v6);
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "convertFromUserWantedToRepeat:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALUserDialogAct setWantedToRepeat:](v5, "setWantedToRepeat:", v6);
      goto LABEL_21;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_22:

  return v5;
}

+ (id)convertFromUserDialogActs:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromUserDialogAct:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (id)convertFromUserAccepted:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserAccepted *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserAccepted);
    objc_msgSend(v3, "offerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserAccepted setOfferId:](v4, "setOfferId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserAccepted setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUserRejected:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserRejected *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserRejected);
    objc_msgSend(v3, "offerId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserRejected setOfferId:](v4, "setOfferId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserRejected setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUserCancelled:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserCancelled *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserCancelled);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserCancelled setTaskId:](v4, "setTaskId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserCancelled setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUserWantedToRepeat:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserWantedToRepeat *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserWantedToRepeat);
    objc_msgSend(v3, "systemDialogActId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserWantedToRepeat setSystemDialogActId:](v4, "setSystemDialogActId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserWantedToRepeat setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUserAcknowledged:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserAcknowledged *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserAcknowledged);
    objc_msgSend(v3, "systemDialogActId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserAcknowledged setSystemDialogActId:](v4, "setSystemDialogActId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserAcknowledged setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUserWantedToProceed:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserWantedToProceed *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserWantedToProceed);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserWantedToProceed setTaskId:](v4, "setTaskId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserWantedToProceed setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromUserWantedToPause:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserWantedToPause *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserWantedToPause);
    objc_msgSend(v3, "taskId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromUUID:](SiriNLUExternalTypesConverter, "convertFromUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserWantedToPause setTaskId:](v4, "setTaskId:", v6);

    objc_msgSend(v3, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserWantedToPause setReference:](v4, "setReference:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromRewriteMessages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "convertFromRewriteMessage:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

+ (id)convertFromRewriteMessage:(id)a3
{
  id v3;
  SIRINLUEXTERNALRewriteMessage *v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALRewriteMessage);
    -[SIRINLUEXTERNALRewriteMessage setRewriteType:](v4, "setRewriteType:", objc_msgSend(v3, "rewriteType"));
    objc_msgSend(v3, "rewrittenUtterance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SIRINLUEXTERNALRewriteMessage setRewrittenUtterance:](v4, "setRewrittenUtterance:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromReferenceContext:(id)a3
{
  id v3;
  SIRINLUEXTERNALReferenceContext *v4;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALReferenceContext);
    -[SIRINLUEXTERNALReferenceContext setContextualReference:](v4, "setContextualReference:", objc_msgSend(v3, "contextualReference"));
    v5 = objc_msgSend(v3, "disambiguationNeeded");

    -[SIRINLUEXTERNALReferenceContext setDisambiguationNeeded:](v4, "setDisambiguationNeeded:", v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromDelegatedUserDialogAct:(id)a3
{
  id v4;
  SIRINLUEXTERNALDelegatedUserDialogAct *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(SIRINLUEXTERNALDelegatedUserDialogAct);
    -[SIRINLUEXTERNALDelegatedUserDialogAct setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", objc_msgSend(v4, "asrHypothesisIndex"));
    objc_msgSend(v4, "externalParserId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALDelegatedUserDialogAct setExternalParserId:](v5, "setExternalParserId:", v6);

    objc_msgSend(v4, "rewrittenUtterance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromString:](SiriNLUExternalTypesConverter, "convertFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALDelegatedUserDialogAct setRewrittenUtterance:](v5, "setRewrittenUtterance:", v8);

    objc_msgSend(v4, "spans");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriNLUExternalTypesConverter convertFromMatchingSpans:](SiriNLUExternalTypesConverter, "convertFromMatchingSpans:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALDelegatedUserDialogAct setMatchingSpans:](v5, "setMatchingSpans:", v10);

    objc_msgSend(v4, "rewrite");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "convertFromRewriteMessage:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALDelegatedUserDialogAct setRewrite:](v5, "setRewrite:", v12);

    objc_msgSend(v4, "referenceContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "convertFromReferenceContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALDelegatedUserDialogAct setReferenceContext:](v5, "setReferenceContext:", v14);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)convertFromUserStatedTask:(id)a3
{
  id v3;
  SIRINLUEXTERNALUserStatedTask *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALUserStatedTask);
    objc_msgSend(v3, "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:](SiriNLUExternalTypesUsoGraphConverter, "convertFromUsoGraph:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALUserStatedTask setTask:](v4, "setTask:", v6);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
