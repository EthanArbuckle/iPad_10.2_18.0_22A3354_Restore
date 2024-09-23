@implementation SiriSharedUICompactHostingInstrumentationSupplement

- (SiriSharedUICompactHostingInstrumentationSupplement)initWithInstrumentationManager:(id)a3
{
  id v5;
  SiriSharedUICompactHostingInstrumentationSupplement *v6;
  SiriSharedUICompactHostingInstrumentationSupplement *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUICompactHostingInstrumentationSupplement;
  v6 = -[SiriSharedUICompactHostingInstrumentationSupplement init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_instrumentationManager, a3);

  return v7;
}

- (int)viewRegionForPresentedAceObject:(id)a3 resultTrasncriptItems:(id)a4 conversationTranscriptItems:(id)a5 serverUtterances:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "aceObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "aceId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "aceId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if ((v21 & 1) != 0)
        {
          LODWORD(v31) = 2;
          v22 = v13;
          goto LABEL_29;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v15)
        continue;
      break;
    }
  }
  v38 = v12;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = v11;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v44;
LABEL_11:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v25)
        objc_enumerationMutation(v22);
      objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v26), "aceObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "aceId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "aceId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToString:", v29);

      if ((v30 & 1) != 0)
        break;
      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v24)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = v38;
    v22 = v38;
    v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (!v31)
      goto LABEL_29;
    v32 = *(_QWORD *)v40;
LABEL_19:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v32)
        objc_enumerationMutation(v22);
      objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v33), "aceId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "aceId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      if ((v36 & 1) != 0)
        break;
      if (v31 == ++v33)
      {
        v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v31)
          goto LABEL_19;
        goto LABEL_28;
      }
    }
  }
  LODWORD(v31) = 1;
LABEL_28:
  v12 = v38;
LABEL_29:

  return v31;
}

- (void)logDrillInInteractionForSnippetViewControllerIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SiriSharedUICompactHostingInstrumentationSupplement _shouldCreateNewTurnForSiriViewControllerInteraction:sashItem:](self, "_shouldCreateNewTurnForSiriViewControllerInteraction:sashItem:", v4, 0))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D9A448]);
    objc_msgSend(v5, "setInvocationSource:", 11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "instrumentationTurnIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CFE7E8], "newTurnBasedContextWithPreviousTurnID:", v6);
    v8 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "turnIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[SiriSharedUICompactHostingInstrumentationSupplement logDrillInInteractionForSnippetViewControllerIfNecessary:]";
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1DE0BF000, v9, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v11, 0x20u);

    }
    -[SRUIFInstrumentationManager storeCurrentInstrumentationTurnContext:](self->_instrumentationManager, "storeCurrentInstrumentationTurnContext:", v7);
    -[SRUIFInstrumentationManager emitInstrumentation:](self->_instrumentationManager, "emitInstrumentation:", v5);

  }
}

- (void)configureSiriViewControllerWithCurrentTurn:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SRUIFInstrumentationManager currentInstrumentationTurnContext](self->_instrumentationManager, "currentInstrumentationTurnContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInstrumentationTurnIdentifier:", v5);

  }
}

- (void)logPunchOutEventForSiriViewController:(id)a3 aceCommands:(id)a4 sashItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  SiriSharedUICompactHostingInstrumentationSupplement *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = -[SiriSharedUICompactHostingInstrumentationSupplement _shouldCreateNewTurnForSiriViewControllerInteraction:sashItem:](self, "_shouldCreateNewTurnForSiriViewControllerInteraction:sashItem:", v8, v10);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v17;
          objc_msgSend(v18, "punchOutUri");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bundleId");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          -[SiriSharedUICompactHostingInstrumentationSupplement _logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:shouldCreateNewTurn:](v11, "_logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:shouldCreateNewTurn:", v8, v18, v19, v20, v10, v12);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v20 = v17;
          objc_msgSend(v20, "appId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriSharedUICompactHostingInstrumentationSupplement _logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:shouldCreateNewTurn:](v11, "_logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:shouldCreateNewTurn:", v8, v20, 0, v19, v10, v12);
        }

        v12 = 0;
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

}

- (void)logPunchOutEventForSiriViewController:(id)a3 aceCommand:(id)a4 URL:(id)a5 appID:(id)a6 sashItem:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[SiriSharedUICompactHostingInstrumentationSupplement _logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:shouldCreateNewTurn:](self, "_logPunchOutEventForSiriViewController:aceCommand:URL:appID:sashItem:shouldCreateNewTurn:", v16, v15, v14, v13, v12, -[SiriSharedUICompactHostingInstrumentationSupplement _shouldCreateNewTurnForSiriViewControllerInteraction:sashItem:](self, "_shouldCreateNewTurnForSiriViewControllerInteraction:sashItem:", v16, v12));

}

- (void)_logPunchOutEventForSiriViewController:(id)a3 aceCommand:(id)a4 URL:(id)a5 appID:(id)a6 sashItem:(id)a7 shouldCreateNewTurn:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v8 = a8;
  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "instrumentationTurnIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CFE7E8], "newTurnBasedContextWithPreviousTurnID:", v17);
    v19 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v18, "turnIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 136315650;
      v27 = "-[SiriSharedUICompactHostingInstrumentationSupplement _logPunchOutEventForSiriViewController:aceCommand:URL:"
            "appID:sashItem:shouldCreateNewTurn:]";
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1DE0BF000, v20, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v26, 0x20u);

    }
    -[SRUIFInstrumentationManager storeCurrentInstrumentationTurnContext:](self->_instrumentationManager, "storeCurrentInstrumentationTurnContext:", v18);
    v22 = objc_alloc_init(MEMORY[0x1E0D9A448]);
    objc_msgSend(v22, "setInvocationSource:", 11);
    -[SRUIFInstrumentationManager emitInstrumentation:](self->_instrumentationManager, "emitInstrumentation:", v22);

  }
  objc_msgSend(v16, "applicationBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (v24)
    v25 = 2;
  else
    v25 = 0;
  -[SRUIFInstrumentationManager emitPunchOutEventWithURL:appID:punchoutOrigin:](self->_instrumentationManager, "emitPunchOutEventWithURL:appID:punchoutOrigin:", v14, v15, v25);

}

- (BOOL)_shouldCreateNewTurnForSiriViewControllerInteraction:(id)a3 sashItem:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  BOOL v9;
  void *v10;
  char v11;
  char v12;

  v5 = a3;
  objc_msgSend(v5, "aceObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v5, "aceObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    v9 = a4 != 0;
    objc_msgSend(v5, "aceObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
    {
      v12 = v9 | isKindOfClass ^ 1;
      goto LABEL_6;
    }
  }
  v12 = 0;
LABEL_6:

  return v12 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationManager, 0);
}

@end
