@implementation SearchUICommandHandler

+ (BOOL)hasValidHandlerForCommand:(id)a3 rowModel:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "_searchUICommandHandlerClass");
  if (!v10 || v10 == objc_opt_class())
  {
    objc_msgSend(v9, "commandDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "canPerformCommand:", v7) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v8, "cardSection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "commands");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14 != 0;

    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (BOOL)hasValidHandlerForRowModel:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "tapCommandForRowModel:environment:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "hasValidHandlerForCommand:rowModel:environment:", v8, v7, v6);

  return (char)a1;
}

+ (BOOL)hasCustomViewControllerForRowModel:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "commandDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "commandDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifyingResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hasCustomViewControllerForResult:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)hasValidCommandForResult:(id)a3 feedbackListener:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFeedbackDelegate:", v6);
  v8 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v8, "buildRowModelsFromResult:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if (+[SearchUICommandHandler hasValidHandlerForRowModel:environment:](SearchUICommandHandler, "hasValidHandlerForRowModel:environment:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v7))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

+ (id)tapCommandForRowModel:(id)a3 environment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[19];

  v21[18] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "cardSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    v21[5] = objc_opt_class();
    v21[6] = objc_opt_class();
    v21[7] = objc_opt_class();
    v21[8] = objc_opt_class();
    v21[9] = objc_opt_class();
    v21[10] = objc_opt_class();
    v21[11] = objc_opt_class();
    v21[12] = objc_opt_class();
    v21[13] = objc_opt_class();
    v21[14] = objc_opt_class();
    v21[15] = objc_opt_class();
    v21[16] = objc_opt_class();
    v21[17] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 18);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "fallbackCommandForRowModel:environment:", v5, v6, (_QWORD)v16);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v8 = (void *)v14;
            goto LABEL_12;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_12:

  }
  return v8;
}

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  return 0;
}

+ (id)handlerForRowModel:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "tapCommandForRowModel:environment:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "handlerForCommand:rowModel:button:environment:", v8, v7, 0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)previewHandlerForRowModel:(id)a3 environment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(a1, "tapCommandForRowModel:environment:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "handlerForCommand:rowModel:button:environment:", v9, v6, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)revealHandlerForRowModel:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v28 = a1;
  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v30 = v5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v5, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v11 = 0x1E0D8C000uLL;
    v12 = 0x1E0D8C000uLL;
LABEL_3:
    v13 = 0;
    v31 = v9;
    while (1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(v7);
      v14 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "command");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "punchout");
          v16 = v10;
          v17 = v11;
          v18 = v7;
          v19 = v12;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "preferredOpenableURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isFileURL");

          v12 = v19;
          v7 = v18;
          v11 = v17;
          v10 = v16;
          v9 = v31;
          if ((v22 & 1) != 0)
          {

            v24 = v29;
            v23 = v30;
            v25 = v28;
            if (v15)
              goto LABEL_15;
            goto LABEL_14;
          }
        }

      }
      if (v9 == ++v13)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  v24 = v29;
  v23 = v30;
  v25 = v28;
LABEL_14:
  objc_msgSend(v25, "tapCommandForRowModel:environment:", v23, v24, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  objc_msgSend(v25, "handlerForCommand:rowModel:button:environment:", v15, v23, 0, v24, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)handlerForButton:(id)a3 rowModel:(id)a4 environment:(id)a5
{
  return (id)objc_msgSend(a1, "handlerForButton:rowModel:sectionModel:environment:", a3, a4, 0, a5);
}

+ (id)handlerForButton:(id)a3 rowModel:(id)a4 sectionModel:(id)a5 environment:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "command");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewButtonItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") != 0;

    if (v14)
      goto LABEL_10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = (void *)objc_opt_new();
    else
      v14 = 0;
    v16 = 0;
    if (v14)
      goto LABEL_10;
  }
  if (v16)
  {
LABEL_10:
    objc_msgSend(a1, "handlerForCommand:rowModel:button:sectionModel:environment:", v14, v11, v10, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

+ (id)handlerForCommand:(id)a3 environment:(id)a4
{
  return (id)objc_msgSend(a1, "handlerForCommand:rowModel:button:environment:", a3, 0, 0, a4);
}

+ (id)handlerForCommand:(id)a3 rowModel:(id)a4 button:(id)a5 environment:(id)a6
{
  return (id)objc_msgSend(a1, "handlerForCommand:rowModel:button:sectionModel:environment:", a3, a4, a5, 0, a6);
}

+ (id)handlerForCommand:(id)a3 rowModel:(id)a4 button:(id)a5 sectionModel:(id)a6 environment:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  objc_class *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_msgSend(v11, "_searchUICommandHandlerClass");
  if (!v16
    || (v17 = (objc_class *)v16,
        objc_msgSend(v12, "commandDelegate"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "canPerformCommand:", v11),
        v18,
        v19))
  {
    v17 = (objc_class *)objc_opt_class();
  }
  SearchUITapLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = v11;
    v25 = 2112;
    v26 = v17;
    _os_log_impl(&dword_1DAD39000, v20, OS_LOG_TYPE_DEFAULT, "Command handler for %@ resolved to: %@", (uint8_t *)&v23, 0x16u);
  }

  v21 = (void *)objc_msgSend([v17 alloc], "initWithCommand:rowModel:button:sectionModel:environment:", v11, v15, v14, v13, v12);
  return v21;
}

+ (BOOL)isDestructiveButtonItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if ((objc_msgSend(v6, "isDestructive") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(v6, "command");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "previewButtonItems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v9);
        v12 += objc_msgSend(a1, "isDestructiveButtonItem:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v6, "previewButtonItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v6, "previewButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12 == objc_msgSend(v16, "count");

  }
  else
  {
    v17 = 0;
  }

  return (isKindOfClass | v17) & 1;
}

- (SearchUICommandHandler)initWithCommand:(id)a3 rowModel:(id)a4 button:(id)a5 environment:(id)a6
{
  return -[SearchUICommandHandler initWithCommand:rowModel:button:sectionModel:environment:](self, "initWithCommand:rowModel:button:sectionModel:environment:", a3, a4, a5, 0, a6);
}

- (SearchUICommandHandler)initWithCommand:(id)a3 rowModel:(id)a4 button:(id)a5 sectionModel:(id)a6 environment:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SearchUICommandHandler *v17;
  SearchUICommandHandler *v18;
  uint64_t v19;
  SearchUICommandEnvironment *environment;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SearchUICommandHandler;
  v17 = -[SearchUICommandHandler init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_command, a3);
    objc_storeStrong((id *)&v18->_rowModel, a4);
    objc_storeStrong((id *)&v18->_buttonItem, a5);
    objc_storeStrong((id *)&v18->_sectionModel, a6);
    v19 = objc_msgSend(v16, "copy");
    environment = v18->_environment;
    v18->_environment = (SearchUICommandEnvironment *)v19;

  }
  return v18;
}

- (void)executeWithTriggerEvent:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  SearchUICommandHandler *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SearchUITapLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Performing command handler: %@", (uint8_t *)&v12, 0xCu);
  }

  v6 = -[SearchUICommandHandler destination](self, "destination");
  -[SearchUICommandHandler destinationPunchout](self, "destinationPunchout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler sendFeedbackWithTriggerEvent:destination:punchout:](self, "sendFeedbackWithTriggerEvent:destination:punchout:", a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUICommandHandler environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "feedbackDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v10, "shouldHandleCardSectionEngagement:", v8))
  {
    -[SearchUICommandHandler command](self, "command");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICommandHandler performCommand:triggerEvent:environment:](self, "performCommand:triggerEvent:environment:", v11, a3, v9);

  }
}

- (id)sendFeedbackWithTriggerEvent:(unint64_t)a3 destination:(unint64_t)a4 punchout:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v7 = a5;
  -[SearchUICommandHandler environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "feedbackDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifyingResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler command](self, "command");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "queryId");
  if (!v14)
    v14 = objc_msgSend(v8, "queryId");
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:", v11, a3, a4);
    objc_msgSend(v9, "didEngageResult:", v15);

  }
  if (!v12)
  {
    v16 = 0;
    if (!v13)
      goto LABEL_14;
    goto LABEL_12;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C220]), "initWithCardSection:destination:triggerEvent:actionCardType:", v12, v7, a3, 1);
  objc_msgSend(v16, "setQueryId:", v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "didEngageCardSection:", v16);
  if (v13)
  {
LABEL_12:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = v7;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:", v13, v12);
      objc_msgSend(v17, "setQueryId:", v14);
      objc_msgSend(v17, "setResult:", v11);
      objc_msgSend(v17, "setTriggerEvent:", a3);
      -[SearchUICommandHandler buttonItem](self, "buttonItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setButton:", v18);

      objc_msgSend(v8, "section");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setResultSection:", v19);

      objc_msgSend(v9, "didPerformCommand:", v17);
      v7 = v21;
    }
  }
LABEL_14:

  return v16;
}

- (unint64_t)destination
{
  return 2;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SearchUINavigationController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a5;
  objc_msgSend(v8, "commandDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "canPerformCommand:", v25))
  {
    -[SearchUICommandHandler viewController](self, "viewController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_15;
    v11 = (void *)v10;
    -[SearchUICommandHandler prepareViewController:forTriggerEvent:](self, "prepareViewController:forTriggerEvent:", v10, a4);
    objc_msgSend(v8, "feedbackDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardViewDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SearchUICommandHandler prefersModalPresentation](self, "prefersModalPresentation"))
    {
      v24 = v13;
      objc_msgSend(v8, "presentingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "topViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rightBarButtonItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRightBarButtonItem:", v18);

      if (!v15)
      {
        v20 = -[SearchUINavigationController initWithRootViewController:]([SearchUINavigationController alloc], "initWithRootViewController:", v11);
        -[SearchUINavigationController setFeedbackDelegate:](v20, "setFeedbackDelegate:", v12);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, v20, sel_close);
        objc_msgSend(v11, "navigationItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setRightBarButtonItem:", v21);

        v11 = v20;
      }
      v13 = v24;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = v12;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        -[SearchUICommandHandler requestAuthIfNecessaryAndPresentViewController:animated:](self, "requestAuthIfNecessaryAndPresentViewController:animated:", v11, 1);
        goto LABEL_14;
      }
      v23 = v13;
    }
    objc_msgSend(v23, "presentViewController:", v11);
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v9, "performCommand:", v25);
LABEL_15:

}

- (UIViewController)viewController
{
  UIViewController *viewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIViewController *v8;
  UIViewController *v9;
  NSObject *v10;
  UIViewController *v11;
  void *v12;
  UIViewController *v13;
  UIViewController *v14;
  int v16;
  UIViewController *v17;
  __int16 v18;
  SearchUICommandHandler *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  viewController = self->_viewController;
  if (!viewController)
  {
    -[SearchUICommandHandler environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commandDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUICommandHandler command](self, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICommandHandler environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICommandHandler createViewControllerForCommand:environment:](self, "createViewControllerForCommand:environment:", v6, v7);
    v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_viewController;
    self->_viewController = v8;

    if (self->_viewController)
    {
      SearchUITapLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_viewController;
        v16 = 138412546;
        v17 = v11;
        v18 = 2112;
        v19 = self;
        _os_log_impl(&dword_1DAD39000, v10, OS_LOG_TYPE_DEFAULT, "View controller (%@) created for command handler: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_8:

        viewController = self->_viewController;
        return viewController;
      }
      -[SearchUICommandHandler rowModel](self, "rowModel");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject identifyingResult](v10, "identifyingResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "customViewControllerForResult:", v12);
      v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      v14 = self->_viewController;
      self->_viewController = v13;

    }
    goto LABEL_8;
  }
  return viewController;
}

- (BOOL)prefersContextMenu
{
  return 0;
}

- (UIMenu)contextMenu
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (NSItemProvider)itemProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastCopyCommandForRowModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "copyableItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIItemProviderUtilities itemProviderForItem:](SearchUIItemProviderUtilities, "itemProviderForItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSItemProvider *)v7;
}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  return 0;
}

- (BOOL)shouldDeselectAfterExecution
{
  char isKindOfClass;
  void *v4;

  if (-[SearchUICommandHandler prefersModalPresentation](self, "prefersModalPresentation"))
  {
    isKindOfClass = 1;
  }
  else
  {
    -[SearchUICommandHandler command](self, "command");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void)wasPerformedWithTriggerEvent:(unint64_t)a3
{
  -[SearchUICommandHandler wasPerformedWithTriggerEvent:punchout:](self, "wasPerformedWithTriggerEvent:punchout:", a3, 0);
}

- (void)wasPerformedWithTriggerEvent:(unint64_t)a3 punchout:(id)a4
{
  -[SearchUICommandHandler wasPerformedWithTriggerEvent:punchout:destination:](self, "wasPerformedWithTriggerEvent:punchout:destination:", a3, a4, 3);
}

- (void)wasPerformedWithTriggerEvent:(unint64_t)a3 punchout:(id)a4 destination:(unint64_t)a5
{
  id v5;

  v5 = -[SearchUICommandHandler sendFeedbackWithTriggerEvent:destination:punchout:](self, "sendFeedbackWithTriggerEvent:destination:punchout:", a3, a5, a4);
}

- (id)menuForRowModel:(id)a3 buttonItem:(id)a4 commandEnvironment:(id)a5
{
  return -[SearchUICommandHandler menuForRowModel:buttonItem:commandEnvironment:doesFallbackToCardSectionButtonItems:](self, "menuForRowModel:buttonItem:commandEnvironment:doesFallbackToCardSectionButtonItems:", a3, a4, a5, 1);
}

+ (id)lastCopyCommandForRowModel:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = a3;
  objc_msgSend(v15, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "command");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v10, "command");
            v13 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v13;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)menuForRowModel:(id)a3 buttonItem:(id)a4 commandEnvironment:(id)a5 doesFallbackToCardSectionButtonItems:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  SearchUICopyItemHandler *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  SearchUIShareItemHandler *v62;
  void *v63;
  SearchUIRequestUserReportHandler *v64;
  void *v65;
  void *v66;
  void *v67;
  SearchUIRequestUserReportHandler *v68;
  SearchUISymbolImage *v69;
  void *v70;
  SearchUISymbolImage *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t j;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  SearchUISymbolImage *v89;
  SearchUISymbolImage *v90;
  void *v91;
  int v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _BOOL8 v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  id v126;
  id obj;
  int v128;
  void *v129;
  uint64_t v131;
  void *v132;
  int v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  unsigned int v140;
  void *v141;
  uint64_t v142;
  _QWORD v143[5];
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  uint64_t v165;

  v6 = a6;
  v165 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v135 = a5;
  v136 = v9;
  objc_msgSend(v9, "cardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
LABEL_5:
    if (v6)
    {
      objc_msgSend(v11, "previewButtonItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_7;
  }
  objc_msgSend(v10, "previewButtonItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_5;
LABEL_7:
  v141 = (void *)objc_opt_new();
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
  v119 = v10;
  v121 = v11;
  obj = v13;
  if (!v14)
  {
    LOBYTE(v133) = 0;
    LOBYTE(v16) = 0;
    goto LABEL_29;
  }
  v15 = v14;
  v133 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v158;
  v122 = *(_QWORD *)v158;
  do
  {
    v18 = 0;
    v123 = v15;
    do
    {
      if (*(_QWORD *)v158 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v18);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v19;
        objc_msgSend(v20, "command");
        v21 = v19;
        v22 = v18;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v16 |= objc_opt_isKindOfClass();

        objc_msgSend(v20, "command");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v133 |= objc_opt_isKindOfClass();

        v18 = v22;
        v19 = v21;
        objc_msgSend(v141, "addObject:", v20);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        v131 = v18;
        v25 = v19;
        objc_msgSend(v25, "applicationBundleIdentifier");
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "coreSpotlightIdentifier");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v26, 1, 0);
        v29 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v28, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bundleWithURL:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        objc_msgSend(v28, "spotlightActions");
        v137 = (id)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
        if (v32)
        {
          v33 = v32;
          v124 = v28;
          v125 = v19;
          v128 = v16;
          v34 = 0;
          v35 = *(_QWORD *)v154;
          do
          {
            v36 = 0;
            v37 = v34;
            do
            {
              if (*(_QWORD *)v154 != v35)
                objc_enumerationMutation(v137);
              v38 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * v36);
              v39 = (void *)objc_opt_new();
              objc_msgSend(v39, "setApplicationBundleIdentifier:", v27);
              objc_msgSend(v39, "setCoreSpotlightIdentifier:", v139);
              objc_msgSend(v38, "identifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setActionIdentifier:", v40);

              v41 = (void *)objc_opt_new();
              objc_msgSend(v38, "symbolImageName");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setSymbolName:", v42);

              objc_msgSend(v41, "setIsTemplate:", 1);
              v34 = (void *)objc_opt_new();

              objc_msgSend(v38, "unlocalizedTitle");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "localizedStringForKey:value:table:", v43, 0, CFSTR("InfoPlist"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setTitle:", v44);

              objc_msgSend(v34, "setImage:", v41);
              objc_msgSend(v34, "setCommand:", v39);
              objc_msgSend(v141, "addObject:", v34);

              ++v36;
              v37 = v34;
            }
            while (v33 != v36);
            v33 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
          }
          while (v33);

          v16 = v128;
          v17 = v122;
          v15 = v123;
          v28 = v124;
          v19 = v125;
        }

        v18 = v131;
      }

LABEL_25:
      ++v18;
    }
    while (v18 != v15);
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
  }
  while (v15);
LABEL_29:

  v45 = (void *)objc_opt_new();
  v129 = (void *)objc_opt_new();
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v126 = v141;
  v46 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v150;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v150 != v48)
          objc_enumerationMutation(v126);
        v50 = *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * i);
        +[SearchUICommandHandler handlerForButton:rowModel:sectionModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:sectionModel:environment:", v50, v136, 0, v135, v119);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          if (objc_msgSend((id)objc_opt_class(), "isDestructiveButtonItem:", v50))
            v52 = v129;
          else
            v52 = v45;
          objc_msgSend(v52, "addObject:", v51);
        }

      }
      v47 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
    }
    while (v47);
  }

  if ((v16 & 1) == 0 && -[SearchUICommandHandler supportsCopy](self, "supportsCopy"))
  {
    v53 = (void *)objc_opt_new();
    v54 = (void *)objc_opt_new();
    objc_msgSend(v53, "setCommand:", v54);
    v55 = -[SearchUICommandHandler initWithCommand:rowModel:button:environment:]([SearchUICopyItemHandler alloc], "initWithCommand:rowModel:button:environment:", v54, v136, v53, v135);
    -[SearchUICopyItemHandler setHandlerForCopying:](v55, "setHandlerForCopying:", self);
    objc_msgSend(v45, "addObject:", v55);

  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v119);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "scale");
  v58 = v57;

  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForSystem");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v59, "isDark");

  if ((v133 & 1) == 0 && -[SearchUICommandHandler supportsShare](self, "supportsShare"))
  {
    v60 = (void *)objc_opt_new();
    v61 = (void *)objc_opt_new();
    objc_msgSend(v60, "setCommand:", v61);
    v62 = -[SearchUICommandHandler initWithCommand:rowModel:button:environment:]([SearchUIShareItemHandler alloc], "initWithCommand:rowModel:button:environment:", v61, v136, v60, v135);
    -[SearchUIShareItemHandler setHandlerForSharing:](v62, "setHandlerForSharing:", self);
    objc_msgSend(v45, "addObject:", v62);

  }
  objc_msgSend(v45, "addObjectsFromArray:", v129);
  v132 = (void *)objc_opt_new();
  if ((objc_msgSend(v136, "supportsCustomUserReportRequestAfforance") & 1) == 0)
  {
    objc_msgSend(v121, "userReportRequest");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      v64 = [SearchUIRequestUserReportHandler alloc];
      v65 = (void *)objc_opt_new();
      -[SearchUICommandHandler sectionModel](self, "sectionModel");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUICommandHandler environment](self, "environment");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[SearchUICommandHandler initWithCommand:rowModel:button:sectionModel:environment:](v64, "initWithCommand:rowModel:button:sectionModel:environment:", v65, v136, 0, v66, v67);

      v69 = [SearchUISymbolImage alloc];
      -[SearchUIRequestUserReportHandler defaultSymbolName](v68, "defaultSymbolName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[SearchUISymbolImage initWithSymbolName:](v69, "initWithSymbolName:", v70);

      -[SearchUISymbolImage loadImageWithScale:isDarkStyle:](v71, "loadImageWithScale:isDarkStyle:", v140, v58);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "userReportRequest");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "affordanceText");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      -[SearchUIRequestUserReportHandler contextMenu](v68, "contextMenu");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)MEMORY[0x1E0DC39D0];
      objc_msgSend(v75, "children");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)objc_msgSend(v77, "copy");
      objc_msgSend(v76, "menuWithTitle:image:identifier:options:children:", v74, v72, 0, 0, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v132, "addObject:", v79);
    }
  }
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v134 = v45;
  v142 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
  if (v142)
  {
    v138 = *(id *)v146;
    do
    {
      for (j = 0; j != v142; ++j)
      {
        if (*(id *)v146 != v138)
          objc_enumerationMutation(v134);
        v81 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * j);
        objc_msgSend(v81, "buttonItem");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "title");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v83;
        if (v83)
        {
          v85 = v83;
        }
        else
        {
          objc_msgSend(v81, "defaultTitle");
          v85 = (id)objc_claimAutoreleasedReturnValue();
        }
        v86 = v85;

        objc_msgSend(v82, "image");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        if (v87)
        {
          objc_msgSend(v82, "image");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v88);
          v89 = (SearchUISymbolImage *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v81, "defaultSymbolName");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v88, "length"))
          {
            v90 = [SearchUISymbolImage alloc];
            objc_msgSend(v81, "defaultSymbolName");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = -[SearchUISymbolImage initWithSymbolName:](v90, "initWithSymbolName:", v91);

          }
          else
          {
            v89 = 0;
          }
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v92 = objc_msgSend(v82, "useDefaultSymbolFillStyle");
        else
          v92 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v92)
          -[SearchUISymbolImage setPreferredFill:](v89, "setPreferredFill:", 0);
        -[SearchUISymbolImage loadImageWithScale:isDarkStyle:](v89, "loadImageWithScale:isDarkStyle:", v140, v58);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "command");
        v94 = objc_claimAutoreleasedReturnValue();
        if (v94
          && (v95 = (void *)v94,
              objc_msgSend(v81, "command"),
              v96 = (void *)objc_claimAutoreleasedReturnValue(),
              v97 = objc_msgSend(v96, "isMemberOfClass:", objc_opt_class()),
              v96,
              v95,
              !v97))
        {
          v103 = (void *)MEMORY[0x1E0DC3428];
          v143[0] = MEMORY[0x1E0C809B0];
          v143[1] = 3221225472;
          v143[2] = __109__SearchUICommandHandler_menuForRowModel_buttonItem_commandEnvironment_doesFallbackToCardSectionButtonItems___block_invoke;
          v143[3] = &unk_1EA1F69D8;
          v143[4] = v81;
          v104 = v82;
          v144 = v104;
          objc_msgSend(v103, "actionWithTitle:image:identifier:handler:", v86, v93, 0, v143);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v104, "isDestructive"))
            objc_msgSend(v105, "setAttributes:", objc_msgSend(v105, "attributes") | 2);
          objc_msgSend(v132, "addObject:", v105);

        }
        else
        {
          objc_msgSend(v81, "rowModel");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "buttonItem");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "environment");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "menuForRowModel:buttonItem:commandEnvironment:", v98, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          if (v101)
          {
            if (objc_msgSend(v134, "count") == 1)
            {
              v102 = 1;
            }
            else
            {
              objc_msgSend(v101, "children");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = objc_msgSend(v106, "count") == 1;

            }
            if (objc_msgSend(v82, "isDestructive"))
              v107 = v102 | 2;
            else
              v107 = v102;
            v108 = (void *)MEMORY[0x1E0DC39D0];
            objc_msgSend(v101, "children");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = (void *)objc_msgSend(v109, "copy");
            objc_msgSend(v108, "menuWithTitle:image:identifier:options:children:", v86, v93, 0, v107, v110);
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v132, "addObject:", v111);
          }

        }
      }
      v142 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v145, v161, 16);
    }
    while (v142);
  }

  -[SearchUICommandHandler additionalActionMenuItems](self, "additionalActionMenuItems");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "addObjectsFromArray:", v112);

  if (objc_msgSend(v132, "count"))
  {
    v113 = (void *)MEMORY[0x1E0DC39D0];
    v114 = v121;
    objc_msgSend(v121, "previewButtonItemsTitle");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "menuWithTitle:image:identifier:options:children:", v115, 0, 0, 1, v132);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = v120;
  }
  else
  {
    v116 = 0;
    v117 = v120;
    v114 = v121;
  }

  return v116;
}

uint64_t __109__SearchUICommandHandler_menuForRowModel_buttonItem_commandEnvironment_doesFallbackToCardSectionButtonItems___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "executeWithTriggerEvent:", 2);
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 40), "buttonPressed");
  return result;
}

+ (id)swipeActionsForRowModel:(id)a3 isLeading:(BOOL)a4 environment:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  SearchUISymbolImage *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  id obj;
  unsigned int v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  void *v64;
  BOOL v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v58 = a5;
  v59 = v7;
  objc_msgSend(v7, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v55 = a4;
  v51 = v8;
  if (a4)
    objc_msgSend(v8, "leadingSwipeButtonItems");
  else
    objc_msgSend(v8, "trailingSwipeButtonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[SearchUICommandHandler handlerForButton:rowModel:sectionModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:sectionModel:environment:", v15, v7, 0, v58);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v12);
  }

  v56 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForSystem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v20, "isDark");

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v9;
  v21 = v58;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v57)
  {
    v54 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v57; ++j)
      {
        if (*(_QWORD *)v67 != v54)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(v23, "buttonItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          v27 = v25;
        }
        else
        {
          objc_msgSend(v23, "defaultTitle");
          v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        v28 = v27;

        objc_msgSend(v21, "feedbackDelegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_opt_respondsToSelector();

        if ((v30 & 1) != 0)
        {
          objc_msgSend(v21, "feedbackDelegate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31 = 0;
        }
        if (objc_msgSend(v24, "isDestructive"))
        {
          objc_msgSend(v24, "previewButtonItems");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "count") == 0;

        }
        else
        {
          v33 = 0;
        }
        v34 = (void *)MEMORY[0x1E0DC36C8];
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke;
        v60[3] = &unk_1EA1F6A28;
        v35 = v24;
        v61 = v35;
        v65 = v55;
        v36 = v31;
        v62 = v36;
        v37 = v59;
        v63 = v37;
        v64 = v23;
        objc_msgSend(v34, "contextualActionWithStyle:title:handler:", v33, v28, v60);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "isDestructive"))
        {
          objc_msgSend(v35, "previewButtonItems");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setBackgroundColor:", v40);

          }
        }
        objc_msgSend(v35, "image");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v35, "image");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
          {
            objc_msgSend(v35, "image");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v43);
            v44 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v45 = [SearchUISymbolImage alloc];
            objc_msgSend(v23, "defaultSymbolName");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[SearchUISymbolImage initWithSymbolName:](v45, "initWithSymbolName:", v43);
          }
          v46 = (void *)v44;

          objc_msgSend(v46, "loadImageWithScale:isDarkStyle:", v53, v19);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setImage:", v47);

          v21 = v58;
        }
        objc_msgSend(v23, "menuForRowModel:buttonItem:commandEnvironment:doesFallbackToCardSectionButtonItems:", v37, v35, v21, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "_setMenu:", v48);

        objc_msgSend(v56, "addObject:", v38);
      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v57);
  }

  objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v56);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

void __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "previewButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    if (*(_BYTE *)(a1 + 64))
      v8 = 16;
    else
      v8 = 15;
    if (objc_msgSend(*(id *)(a1 + 32), "isDestructive") && (v9 = *(void **)(a1 + 40)) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke_2;
      v11[3] = &unk_1EA1F6A00;
      v10 = *(_QWORD *)(a1 + 48);
      v11[4] = *(_QWORD *)(a1 + 56);
      v13 = v8;
      v12 = v5;
      objc_msgSend(v9, "removeRowModel:completion:", v10, v11);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "executeWithTriggerEvent:", v8);
      (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    }
  }

}

uint64_t __72__SearchUICommandHandler_swipeActionsForRowModel_isLeading_environment___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "executeWithTriggerEvent:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)prefersModalPresentation
{
  return 0;
}

- (void)requestAuthIfNecessaryAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  v4 = a4;
  v6 = a3;
  if (+[SearchUIUtilities canShowViewController:](SearchUIUtilities, "canShowViewController:", v6))
  {
    -[SearchUICommandHandler presentViewController:animated:](self, "presentViewController:animated:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__SearchUICommandHandler_requestAuthIfNecessaryAndPresentViewController_animated___block_invoke;
    v7[3] = &unk_1EA1F63B8;
    v7[4] = self;
    v8 = v6;
    v9 = v4;
    +[SearchUIUtilities requestDeviceUnlockWithSuccessHandler:](SearchUIUtilities, "requestDeviceUnlockWithSuccessHandler:", v7);

  }
}

uint64_t __82__SearchUICommandHandler_requestAuthIfNecessaryAndPresentViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a4;
  v14 = a3;
  if (-[SearchUICommandHandler prefersModalPresentation](self, "prefersModalPresentation"))
  {
    -[SearchUICommandHandler environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "sourceView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(v6, "presentingViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "view");
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v7, "setSourceView:", v10);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v7, "setSourceRect:");

    }
    -[SearchUICommandHandler presentingViewControllerForEnvironment:](self, "presentingViewControllerForEnvironment:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v14, v4, 0);

  }
  else if (v4)
  {
    -[SearchUICommandHandler showViewController:](self, "showViewController:", v14);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SearchUICommandHandler_presentViewController_animated___block_invoke;
    v15[3] = &unk_1EA1F6210;
    v15[4] = self;
    v16 = v14;
    objc_msgSend(v11, "performWithoutAnimation:", v15);

  }
}

uint64_t __57__SearchUICommandHandler_presentViewController_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:", *(_QWORD *)(a1 + 40));
}

- (void)showViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SearchUICommandHandler environment](self, "environment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler presentingViewControllerForEnvironment:](self, "presentingViewControllerForEnvironment:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showViewController:sender:", v4, 0);

}

- (id)presentingViewControllerForEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "sourceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)actionProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  -[SearchUICommandHandler rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler buttonItem](self, "buttonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__SearchUICommandHandler_actionProvider__block_invoke;
  v11[3] = &unk_1EA1F6A50;
  v11[4] = self;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = _Block_copy(v11);

  return v9;
}

uint64_t __40__SearchUICommandHandler_actionProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "menuForRowModel:buttonItem:commandEnvironment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)additionalActionMenuItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)supportsCopy
{
  return 0;
}

- (BOOL)supportsShare
{
  return 0;
}

- (void)didPreview
{
  void *v3;
  uint64_t v4;
  id v5;

  -[SearchUICommandHandler viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = 3;

  v5 = -[SearchUICommandHandler sendFeedbackWithTriggerEvent:destination:punchout:](self, "sendFeedbackWithTriggerEvent:destination:punchout:", 5, v4, 0);
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (SFCommand)command
{
  return (SFCommand *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SearchUIRowModel)rowModel
{
  return (SearchUIRowModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRowModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SearchUISectionModel)sectionModel
{
  return (SearchUISectionModel *)objc_getProperty(self, a2, 40, 1);
}

- (SearchUICommandEnvironment)environment
{
  return (SearchUICommandEnvironment *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnvironment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (SFButtonItem)buttonItem
{
  return (SFButtonItem *)objc_getProperty(self, a2, 56, 1);
}

- (void)setButtonItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)useSourceViewAsPreviewForDragging
{
  return self->_useSourceViewAsPreviewForDragging;
}

- (NSString)defaultTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)defaultSymbolName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (SFPunchout)destinationPunchout
{
  return (SFPunchout *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPunchout, 0);
  objc_storeStrong((id *)&self->_defaultSymbolName, 0);
  objc_storeStrong((id *)&self->_defaultTitle, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sectionModel, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
