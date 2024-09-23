@implementation WFHomeWorkflow

- (WFHomeWorkflow)initWithData:(id)a3
{
  id v4;
  WFHomeWorkflow *v5;
  NSObject *v6;
  uint64_t v7;
  NSData *data;
  WFHomeWorkflow *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFHomeWorkflow;
  v5 = -[WFHomeWorkflow init](&v11, sel_init);
  if (v5)
  {
    if (!v4)
    {
      getWFHomeLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[WFHomeWorkflow initWithData:]";
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s WFHomeWorkflow was initialized with nil data", buf, 0xCu);
      }

    }
    v7 = objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = v5;
  }

  return v5;
}

- (NSString)summaryString
{
  void *v2;
  void *v3;

  -[WFHomeWorkflow actionSetsSummary](self, "actionSetsSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)summaryIconNames
{
  void *v2;
  void *v3;

  -[WFHomeWorkflow actionSetsSummary](self, "actionSetsSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryIcons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)summaryIconDescriptors
{
  void *v2;
  void *v3;

  -[WFHomeWorkflow actionSetsSummary](self, "actionSetsSummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summaryIconDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSUUID)homeIdentifier
{
  NSUUID *homeIdentifier;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  WFHomeWorkflow *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier)
    return homeIdentifier;
  v14 = 0;
  -[WFHomeWorkflow workflowWithEnvironment:error:](self, "workflowWithEnvironment:error:", 1, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v5)
  {
    objc_msgSend(v5, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_4423);
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v8, "count"))
    {
      -[NSObject if_compactMap:](v8, "if_compactMap:", &__block_literal_global_112);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");

      getWFHomeLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "-[WFHomeWorkflow homeIdentifier]";
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = self;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Got home identifier: %@ for workflow: %@", buf, 0x20u);
      }

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
      goto LABEL_11;
    }
  }
  else
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFHomeWorkflow homeIdentifier]";
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from home workflow. %@", buf, 0x16u);
    }
  }
  v13 = 0;
LABEL_11:

  return (NSUUID *)v13;
}

- (NSArray)shortcutsDictionaryRepresentations
{
  NSArray *shortcutsDictionaryRepresentations;
  void *v5;
  NSArray *v6;
  void *v7;
  NSObject *v8;
  NSArray *v9;
  NSArray *v10;
  NSObject *v11;
  NSArray *v12;
  NSArray *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  NSArray *v19;
  __int16 v20;
  WFHomeWorkflow *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  shortcutsDictionaryRepresentations = self->_shortcutsDictionaryRepresentations;
  if (shortcutsDictionaryRepresentations)
    return shortcutsDictionaryRepresentations;
  v15 = 0;
  -[WFHomeWorkflow workflowWithEnvironment:error:](self, "workflowWithEnvironment:error:", 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)v15;
  if (v5)
  {
    objc_msgSend(v5, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_114);
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v8, "count"))
    {
      -[NSObject if_flatMap:](v8, "if_flatMap:", &__block_literal_global_117);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_shortcutsDictionaryRepresentations;
      self->_shortcutsDictionaryRepresentations = v9;

      getWFHomeLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_shortcutsDictionaryRepresentations;
        *(_DWORD *)buf = 136315650;
        v17 = "-[WFHomeWorkflow shortcutsDictionaryRepresentations]";
        v18 = 2112;
        v19 = v12;
        v20 = 2112;
        v21 = self;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s Got dictionary representations: %@ for workflow: %@", buf, 0x20u);
      }

      v13 = self->_shortcutsDictionaryRepresentations;
      goto LABEL_14;
    }
    getWFHomeLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFHomeWorkflow shortcutsDictionaryRepresentations]";
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "%s Found no home actions", buf, 0xCu);
    }

  }
  else
  {
    getWFHomeLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFHomeWorkflow shortcutsDictionaryRepresentations]";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from home workflow. %@", buf, 0x16u);
    }
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)requiresDeviceUnlock
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[WFHomeWorkflow triggerActionSetsBuilders](self, "triggerActionSetsBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHomeWorkflow actionSetsFromTriggerActionSetsBuilders:](self, "actionSetsFromTriggerActionSetsBuilders:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getWFHomeLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFHomeWorkflow requiresDeviceUnlock]";
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Retrieved action sets: %@", buf, 0x16u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "requiresDeviceUnlock", (_QWORD)v12))
        {
          getWFHomeLogObject();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v18 = "-[WFHomeWorkflow requiresDeviceUnlock]";
            v19 = 2112;
            v20 = v10;
            _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEBUG, "%s Action set: %@ requires device unlock", buf, 0x16u);
          }

          LOBYTE(v7) = 1;
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v7;
}

- (BOOL)requiresDeviceUnlockEnsuringHomesAreLoaded
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  getWFHomeLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFHomeWorkflow requiresDeviceUnlockEnsuringHomesAreLoaded]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEBUG, "%s Attempting to load homes", buf, 0xCu);
  }

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__WFHomeWorkflow_requiresDeviceUnlockEnsuringHomesAreLoaded__block_invoke;
  v9[3] = &unk_1E7AF8A80;
  v11 = &v12;
  v9[4] = self;
  v6 = v3;
  v10 = v6;
  objc_msgSend(v5, "ensureHomesAreLoadedWithCompletionHandler:", v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *((_BYTE *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (HFTriggerActionsSetsUISummary)actionSetsSummary
{
  HFTriggerActionsSetsUISummary *actionSetsSummary;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFTriggerActionsSetsUISummary *v9;
  HFTriggerActionsSetsUISummary *v10;

  actionSetsSummary = self->_actionSetsSummary;
  if (!actionSetsSummary)
  {
    -[WFHomeWorkflow triggerActionSetsBuilders](self, "triggerActionSetsBuilders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFHomeWorkflow actionSetsFromTriggerActionSetsBuilders:](self, "actionSetsFromTriggerActionSetsBuilders:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(getHFTriggerActionSetsBuilderClass()), "initWithActionSets:inHome:", v7, v6);
    objc_msgSend(v8, "actionSetsSummary");
    v9 = (HFTriggerActionsSetsUISummary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_actionSetsSummary;
    self->_actionSetsSummary = v9;

    actionSetsSummary = self->_actionSetsSummary;
  }
  return actionSetsSummary;
}

- (id)triggerActionSetsBuilders
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  -[WFHomeWorkflow workflowWithEnvironment:error:](self, "workflowWithEnvironment:error:", 1, &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (!v2)
  {
    getWFGeneralLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFHomeWorkflow triggerActionSetsBuilders]";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from home workflow. %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  objc_msgSend(v2, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_119_4410);
  v5 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject count](v5, "count"))
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  -[NSObject if_compactMap:](v5, "if_compactMap:", &__block_literal_global_121);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (id)actionSetsFromTriggerActionSetsBuilders:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "if_map:", &__block_literal_global_123);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)workflowRecordWithEnvironment:(int64_t)a3 error:(id *)a4
{
  WFWorkflowRecord *cachedWorkflowRecord;
  WFWorkflowFile *v7;
  void *v8;
  WFWorkflowFile *v9;
  WFWorkflowRecord *v10;
  WFWorkflowRecord *v11;
  WFWorkflowRecord *v12;

  cachedWorkflowRecord = self->_cachedWorkflowRecord;
  if (!cachedWorkflowRecord)
  {
    v7 = [WFWorkflowFile alloc];
    -[WFHomeWorkflow data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFWorkflowFile initWithFileData:name:error:](v7, "initWithFileData:name:error:", v8, 0, a4);

    if (!v9)
    {
      v12 = 0;
      return v12;
    }
    -[WFWorkflowFile recordRepresentationWithError:](v9, "recordRepresentationWithError:", a4);
    v10 = (WFWorkflowRecord *)objc_claimAutoreleasedReturnValue();
    v11 = self->_cachedWorkflowRecord;
    self->_cachedWorkflowRecord = v10;

    cachedWorkflowRecord = self->_cachedWorkflowRecord;
  }
  v12 = cachedWorkflowRecord;
  return v12;
}

- (WFHomeWorkflow)workflowWithEnvironment:(int64_t)a3 error:(id *)a4
{
  WFWorkflow *cachedWorkflow;
  WFWorkflow *v8;
  WFWorkflow *v9;
  WFWorkflow *v10;
  WFWorkflow *v11;

  cachedWorkflow = self->_cachedWorkflow;
  if (cachedWorkflow)
    goto LABEL_4;
  -[WFHomeWorkflow workflowRecordWithEnvironment:error:](self, "workflowRecordWithEnvironment:error:");
  v8 = (WFWorkflow *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    v10 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v8, 0, 0, 1, a3, a4);
    v11 = self->_cachedWorkflow;
    self->_cachedWorkflow = v10;

    cachedWorkflow = self->_cachedWorkflow;
LABEL_4:
    v8 = cachedWorkflow;
  }
  return (WFHomeWorkflow *)v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WFHomeWorkflow data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("data length = %lu"), objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p %@>"), v8, self, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void)setActionSetsSummary:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetsSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetsSummary, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_shortcutsDictionaryRepresentations, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedWorkflow, 0);
  objc_storeStrong((id *)&self->_cachedWorkflowRecord, 0);
}

uint64_t __58__WFHomeWorkflow_actionSetsFromTriggerActionSetsBuilders___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createActionSetsForShortcuts");
}

id __43__WFHomeWorkflow_triggerActionSetsBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(getHFTriggerActionSetsBuilderClass());
    objc_msgSend(v2, "actionSets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithActionSets:inHome:", v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __43__WFHomeWorkflow_triggerActionSetsBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

intptr_t __60__WFHomeWorkflow_requiresDeviceUnlockEnsuringHomesAreLoaded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFHomeLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[WFHomeWorkflow requiresDeviceUnlockEnsuringHomesAreLoaded]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEBUG, "%s Homes loaded", (uint8_t *)&v4, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "requiresDeviceUnlock");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __52__WFHomeWorkflow_shortcutsDictionaryRepresentations__block_invoke_115(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortcutsDictionaryRepresentations");
}

id __52__WFHomeWorkflow_shortcutsDictionaryRepresentations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

uint64_t __32__WFHomeWorkflow_homeIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeIdentifier");
}

id __32__WFHomeWorkflow_homeIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

+ (void)setCachedHomes:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHomes:", v3);

}

@end
