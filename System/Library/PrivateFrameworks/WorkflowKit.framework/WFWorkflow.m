@implementation WFWorkflow

+ (id)localizedSubtitleWithActionCount:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)localizedSubtitleActionCountCache;
  if (!localizedSubtitleActionCountCache)
  {
    v5 = objc_opt_new();
    v6 = (void *)localizedSubtitleActionCountCache;
    localizedSubtitleActionCountCache = v5;

    v4 = (void *)localizedSubtitleActionCountCache;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a3)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedPluralString(CFSTR("%lu actions"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WFLocalizedString(CFSTR("No actions"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)localizedSubtitleActionCountCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v12);

  }
  v13 = v8;

  return v13;
}

- (WFWorkflow)initWithActionDonation:(id)a3 error:(id *)a4
{
  void *v6;
  WFWorkflow *v7;

  objc_msgSend(a3, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFWorkflow initWithShortcut:error:](self, "initWithShortcut:error:", v6, a4);

  return v7;
}

- (WFWorkflow)initWithShortcut:(id)a3 error:(id *)a4
{
  id v7;
  WFWorkflow *v8;
  void *v9;
  void *v10;
  void *v11;
  WFWorkflow *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFStandaloneShortcutRepresentation *v19;
  void *v21;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflow+INShortcut.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcut"));

  }
  v8 = -[WFWorkflow init](self, "init");
  if (!v8)
  {
    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v7, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestedInvocationPhrase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "intent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "userActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestedInvocationPhrase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v16 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "userActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v11;
  objc_msgSend(v11, "suggestedInvocationPhrase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (objc_msgSend(v16, "length"))
    -[WFWorkflow setName:](v8, "setName:", v16);
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createActionWithShortcut:error:", v7, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WFWorkflow addAction:](v8, "addAction:", v18);
    v19 = -[WFStandaloneShortcutRepresentation initWithINShortcut:]([WFStandaloneShortcutRepresentation alloc], "initWithINShortcut:", v7);
    -[WFWorkflow configureWithStandaloneShortcutRepresentation:homeSummaryText:](v8, "configureWithStandaloneShortcutRepresentation:homeSummaryText:", v19, 0);
    v12 = v8;

  }
  else
  {
    v12 = 0;
  }

LABEL_16:
  return v12;
}

- (void)generateShortcutRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[WFWorkflow actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF71C0A0))
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "generateShortcutRepresentation:", v9);
  else
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

}

- (WFWorkflow)initWithName:(id)a3 description:(id)a4 associatedAppBundleIdentifier:(id)a5 actions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFWorkflow *v14;
  WFWorkflow *v15;
  void *v16;
  void *v17;
  void *v18;
  WFWorkflow *v19;
  WFWorkflow *v20;
  _QWORD v22[4];
  id v23;
  WFWorkflow *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[WFWorkflow init](self, "init");
  v15 = v14;
  if (v14)
  {
    if (v10)
    {
      -[WFWorkflow setName:](v14, "setName:", v10);
    }
    else
    {
      +[WFWorkflow defaultName](WFWorkflow, "defaultName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflow setName:](v15, "setName:", v16);

    }
    -[WFWorkflow record](v15, "record");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWorkflowSubtitle:", v11);

    -[WFWorkflow record](v15, "record");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAssociatedAppBundleIdentifier:", v12);

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __95__WFWorkflow_WFLCompatibility__initWithName_description_associatedAppBundleIdentifier_actions___block_invoke;
    v22[3] = &unk_1E7AF92C0;
    v23 = v13;
    v19 = v15;
    v24 = v19;
    -[WFWorkflow performBatchOperation:](v19, "performBatchOperation:", v22);
    v20 = v19;

  }
  return v15;
}

void __95__WFWorkflow_WFLCompatibility__initWithName_description_associatedAppBundleIdentifier_actions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addAction:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addWatchWorkflowType
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFWorkflow *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[WFWorkflow workflowTypes](self, "workflowTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", *MEMORY[0x1E0DC8510]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow setWorkflowTypes:](self, "setWorkflowTypes:", v4);

  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[WFWorkflow(WatchEligibility) addWatchWorkflowType]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Added watch workflow type to workflow %@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)addWatchWorkflowTypeIfEligible
{
  NSObject *v3;
  void *v4;
  char v5;
  _BOOL4 v6;
  int v8;
  const char *v9;
  __int16 v10;
  WFWorkflow *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  getWFGeneralLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFWorkflow(WatchEligibility) addWatchWorkflowTypeIfEligible]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Adding watch workflow type to workflow %@", (uint8_t *)&v8, 0x16u);
  }

  -[WFWorkflow workflowTypes](self, "workflowTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DC8510]);

  if ((v5 & 1) != 0)
    goto LABEL_6;
  v6 = -[WFWorkflow isEligibleForWatch](self, "isEligibleForWatch");
  if (v6)
  {
    -[WFWorkflow addWatchWorkflowType](self, "addWatchWorkflowType");
LABEL_6:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)isEligibleForWatch
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFWorkflow actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_firstObjectPassingTest:", &__block_literal_global_17130);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

uint64_t __50__WFWorkflow_WatchEligibility__isEligibleForWatch__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "disabledOnPlatforms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("Watch"));

  return v3;
}

- (NSString)attributionTitle
{
  if (-[WFWorkflow hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"))
    WFLocalizedString(CFSTR("Shortcuts"));
  else
    -[WFWorkflow name](self, "name");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (WFIcon)attributionIcon
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  if (-[WFWorkflow hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC7978]);
    v4 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
  }
  else
  {
    -[WFWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC7978]);
      -[WFWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:", v8);

    }
    else
    {
      -[WFWorkflow icon](self, "icon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "icon");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (WFIcon *)v4;
}

- (WFWorkflow)init
{
  WFWorkflowRecord *v3;
  WFWorkflow *v4;

  v3 = objc_alloc_init(WFWorkflowRecord);
  v4 = -[WFWorkflow initWithRecord:reference:storageProvider:error:](self, "initWithRecord:reference:storageProvider:error:", v3, 0, 0, 0);

  return v4;
}

- (WFWorkflow)initWithRecord:(id)a3 reference:(id)a4 storageProvider:(id)a5 error:(id *)a6
{
  return -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:](self, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", a3, a4, a5, 1, 0, a6);
}

- (WFWorkflow)initWithRecord:(id)a3 reference:(id)a4 storageProvider:(id)a5 migrateIfNecessary:(BOOL)a6 environment:(int64_t)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  char v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  WFWorkflowRecord *v35;
  WFWorkflowRecord *record;
  WFDebouncer *v37;
  WFDebouncer *v38;
  WFDebouncer *saveDebouncer;
  void *v40;
  void *v41;
  WFWorkflow *v42;
  WFWorkflow *v43;
  void *v45;
  os_signpost_id_t spid;
  id v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v9 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v49 = a4;
  v48 = a5;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflow.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record"));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumClientVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[WFWorkflow checkClientVersion:currentVersion:error:](WFWorkflow, "checkClientVersion:currentVersion:error:", v17, v16, a8);

  if (v18)
  {
    objc_msgSend(v14, "lastMigratedClientVersion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = WFCompareBundleVersions(v16, v19);
    v21 = WFCompareBundleVersions(CFSTR("985"), v19);
    if (!v19 || v21 == 2 || (v22 = (v20 & 1) == 0, objc_msgSend(v19, "isEqualToString:", CFSTR("0"))))
    {
      objc_msgSend(v14, "setLastMigratedClientVersion:", CFSTR("899"));
      v22 = 1;
    }
    if (v9 && v22)
    {
      getWFGeneralLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "lastMigratedClientVersion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v52 = "-[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]";
        v53 = 2114;
        v54 = v24;
        v55 = 2114;
        v56 = v16;
        _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_DEFAULT, "%s Migrating workflow before opening, since it's last migrated version is %{public}@ and the current version is %{public}@", buf, 0x20u);

      }
      getWFWorkflowLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_signpost_id_generate(v25);

      getWFWorkflowLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      spid = v26;
      v29 = v26 - 1;
      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        objc_msgSend(v14, "actions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 134349056;
        v52 = (const char *)v31;
        _os_signpost_emit_with_name_impl(&dword_1C15B3000, v28, OS_SIGNPOST_INTERVAL_BEGIN, spid, "WorkflowMigration", " enableTelemetry=YES actionCount=%{public,signpost.telemetry:number1}lu", buf, 0xCu);

      }
      objc_msgSend(v14, "fileRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "migrateRootObject"))
        objc_msgSend(v14, "loadFromStorage:", v32);
      getWFWorkflowLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C15B3000, v34, OS_SIGNPOST_INTERVAL_END, spid, "WorkflowMigration", " enableTelemetry=YES ", buf, 2u);
      }

    }
    v50.receiver = self;
    v50.super_class = (Class)WFWorkflow;
    self = -[WFWorkflow init](&v50, sel_init);
    if (self)
    {
      v35 = (WFWorkflowRecord *)objc_msgSend(v14, "copy");
      record = self->_record;
      self->_record = v35;

      objc_storeStrong((id *)&self->_reference, a4);
      objc_storeStrong((id *)&self->_storageProvider, a5);
      self->_environment = a7;
      v37 = [WFDebouncer alloc];
      v38 = -[WFDebouncer initWithDelay:maximumDelay:queue:](v37, "initWithDelay:maximumDelay:queue:", MEMORY[0x1E0C80D38], 0.5, 2.0);
      saveDebouncer = self->_saveDebouncer;
      self->_saveDebouncer = v38;

      -[WFDebouncer addTarget:action:](self->_saveDebouncer, "addTarget:action:", self, sel_saveFromDebouncer_);
      -[WFWorkflow loadFromRecord](self, "loadFromRecord");
      -[WFWorkflow database](self, "database");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40)
        objc_msgSend(v40, "addObjectObserver:", self);
      v42 = self;

    }
    v43 = self;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_actions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "removeEventObserver:", self);
        objc_msgSend(v8, "wasRemovedFromWorkflow:", self);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[WFWorkflow database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "removeObjectObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)WFWorkflow;
  -[WFWorkflow dealloc](&v11, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name: %@, actions: %lu>"), v5, self, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)hasStorageProvider
{
  void *v2;
  BOOL v3;

  -[WFWorkflow storageProvider](self, "storageProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)workflowID
{
  void *v2;
  void *v3;

  -[WFWorkflow reference](self, "reference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = objc_msgSend(v10, "isEqualToString:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("name"));
    -[WFWorkflow record](self, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v10);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("name"));
  }
LABEL_9:

}

- (NSString)legacyName
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legacyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (WFWorkflowIcon)icon
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFWorkflowIcon *)v3;
}

- (void)setIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v7 = v6;
  if (v7 == v10)
  {

  }
  else
  {
    if (v10 && v7)
    {
      v8 = objc_msgSend(v10, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("icon"));
    -[WFWorkflow record](self, "record");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIcon:", v10);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("icon"));
  }
LABEL_9:

}

- (NSString)workflowSubtitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[WFWorkflow record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "actionCount");
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflowSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflowRecord workflowSubtitleForActionCount:savedSubtitle:](WFWorkflowRecord, "workflowSubtitleForActionCount:savedSubtitle:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[WFWorkflow localizedSubtitle](self, "localizedSubtitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return (NSString *)v10;
}

- (NSString)actionsDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFWorkflow record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFWorkflow localizedActionsSummary](self, "localizedActionsSummary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedAppBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  WFWorkflow *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("associatedAppBundleIdentifier"));
  -[WFWorkflow resolvedAssociatedAppBundleIdentifier](self, "resolvedAssociatedAppBundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    {
      getWFWorkflowLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315650;
        v12 = "-[WFWorkflow setAssociatedAppBundleIdentifier:]";
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Mismatch associated app bundle identifier %@ with resolved associated app bundle identifier %@", (uint8_t *)&v11, 0x20u);
      }

    }
    v8 = self;
    v9 = 1;
    goto LABEL_9;
  }
  if (v5)
  {
    v8 = self;
    v9 = 0;
LABEL_9:
    -[WFWorkflow setShouldAutoUpdateAssociatedAppBundleIdentifier:](v8, "setShouldAutoUpdateAssociatedAppBundleIdentifier:", v9);
  }
  -[WFWorkflow record](self, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAssociatedAppBundleIdentifier:", v4);

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("associatedAppBundleIdentifier"));
}

- (BOOL)shouldAutoUpdateAssociatedAppBundleIdentifier
{
  void *v2;
  char v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAutoUpdateAssociatedAppBundleIdentifier");

  return v3;
}

- (void)setShouldAutoUpdateAssociatedAppBundleIdentifier:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WFWorkflow record](self, "record");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldAutoUpdateAssociatedAppBundleIdentifier:", v3);

}

- (NSString)resolvedAssociatedAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E40];
  -[WFWorkflow actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_250);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)galleryIdentifier
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "galleryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)source
{
  NSString *source;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  source = self->_source;
  if (source)
  {
    v3 = source;
  }
  else
  {
    -[WFWorkflow record](self, "record");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v3 = v6;
    }
    else
    {
      -[WFWorkflow reference](self, "reference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "source");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (NSArray)workflowTypes
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workflowTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setWorkflowTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFWorkflow workflowTypes](self, "workflowTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v5;
  if (v6 == v9)
  {

  }
  else
  {
    if (v9 && v6)
    {
      v7 = objc_msgSend(v9, "isEqualToArray:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("workflowTypes"));
    -[WFWorkflow record](self, "record");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWorkflowTypes:", v9);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("workflowTypes"));
    -[WFWorkflow updateInputAction](self, "updateInputAction");
  }
LABEL_9:

}

- (BOOL)hiddenFromLibraryAndSync
{
  void *v2;
  char v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hiddenFromLibraryAndSync");

  return v3;
}

- (void)setHiddenFromLibraryAndSync:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hiddenFromLibraryAndSync");

  if (v6 != v3)
  {
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hiddenFromLibraryAndSync"));
    -[WFWorkflow record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHiddenFromLibraryAndSync:", v3);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hiddenFromLibraryAndSync"));
  }
}

- (BOOL)disabledOnLockScreen
{
  void *v2;
  char v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disabledOnLockScreen");

  return v3;
}

- (void)setDisabledOnLockScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disabledOnLockScreen");

  if (v6 != v3)
  {
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("disabledOnLockScreen"));
    -[WFWorkflow record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisabledOnLockScreen:", v3);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("disabledOnLockScreen"));
  }
}

- (void)setInputClasses:(id)a3
{
  id v4;
  NSArray *inputClasses;
  NSArray *v6;
  BOOL v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;

  v4 = a3;
  inputClasses = self->_inputClasses;
  v13 = (NSArray *)v4;
  v6 = inputClasses;
  if (v6 == v13)
  {

  }
  else
  {
    if (v13 && v6)
    {
      v7 = -[NSArray isEqualToArray:](v13, "isEqualToArray:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputClasses"));
    v8 = (NSArray *)-[NSArray copy](v13, "copy");
    v9 = self->_inputClasses;
    self->_inputClasses = v8;

    -[WFWorkflow inputClasses](self, "inputClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_map:", &__block_literal_global_270_34383);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflow record](self, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInputClasses:", v11);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputClasses"));
  }
LABEL_9:

}

- (void)setNoInputBehavior:(id)a3
{
  WFWorkflowNoInputBehavior *v4;
  WFWorkflowNoInputBehavior *noInputBehavior;
  WFWorkflowNoInputBehavior *v6;
  void *v7;
  void *v8;

  v4 = (WFWorkflowNoInputBehavior *)a3;
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("noInputBehavior"));
  noInputBehavior = self->_noInputBehavior;
  self->_noInputBehavior = v4;
  v6 = v4;

  -[WFWorkflowNoInputBehavior serializedRepresentation](v6, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflow record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNoInputBehavior:", v7);

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("noInputBehavior"));
}

- (void)setOutputClasses:(id)a3
{
  id v4;
  NSArray *outputClasses;
  NSArray *v6;
  BOOL v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;

  v4 = a3;
  outputClasses = self->_outputClasses;
  v13 = (NSArray *)v4;
  v6 = outputClasses;
  if (v6 == v13)
  {

  }
  else
  {
    if (v13 && v6)
    {
      v7 = -[NSArray isEqualToArray:](v13, "isEqualToArray:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputClasses"));
    v8 = (NSArray *)-[NSArray copy](v13, "copy");
    v9 = self->_outputClasses;
    self->_outputClasses = v8;

    -[WFWorkflow outputClasses](self, "outputClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_map:", &__block_literal_global_275);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflow record](self, "record");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOutputClasses:", v11);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputClasses"));
  }
LABEL_9:

}

- (BOOL)hasShortcutInputVariables
{
  void *v2;
  char v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasShortcutInputVariables");

  return v3;
}

- (void)setHasShortcutInputVariables:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasShortcutInputVariables");

  if (v6 != v3)
  {
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasShortcutInputVariables"));
    -[WFWorkflow record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasShortcutInputVariables:", v3);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasShortcutInputVariables"));
  }
}

- (BOOL)hasOutputFallback
{
  void *v2;
  char v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOutputFallback");

  return v3;
}

- (void)setHasOutputFallback:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOutputFallback");

  if (v6 != v3)
  {
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasOutputFallback"));
    -[WFWorkflow record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasOutputFallback:", v3);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasOutputFallback"));
  }
}

- (WFWorkflowQuarantine)quarantine
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quarantine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFWorkflowQuarantine *)v3;
}

- (int64_t)remoteQuarantineStatus
{
  void *v2;
  int64_t v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "remoteQuarantineStatus");

  return v3;
}

- (void)setRemoteQuarantineStatus:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "remoteQuarantineStatus");

  if (v6 != a3)
  {
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("remoteQuarantineStatus"));
    -[WFWorkflow record](self, "record");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteQuarantineStatus:", a3);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("remoteQuarantineStatus"));
  }
}

- (NSData)remoteQuarantineHash
{
  void *v2;
  void *v3;

  -[WFWorkflow record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteQuarantineHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setRemoteQuarantineHash:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFWorkflow remoteQuarantineHash](self, "remoteQuarantineHash");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v9 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("remoteQuarantineStatus"));
    -[WFWorkflow record](self, "record");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteQuarantineHash:", v9);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("remoteQuarantineStatus"));
  }
LABEL_9:

}

- (BOOL)isDeleted
{
  void *v3;
  BOOL v4;

  -[WFWorkflow record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isDeleted") & 1) != 0 || -[WFWorkflow deletedFromDatabase](self, "deletedFromDatabase");

  return v4;
}

- (id)validImportQuestions
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFWorkflow importQuestions](self, "importQuestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__WFWorkflow_validImportQuestions__block_invoke;
  v6[3] = &unk_1E7AF1A90;
  v6[4] = self;
  objc_msgSend(v3, "if_objectsPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)prepareForSharingWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[WFWorkflow copy](self, "copy");
  objc_msgSend(v5, "setStorageProvider:", 0);
  if (objc_msgSend(v4, "clearsImportQuestionData"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v5, "importQuestions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "action");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "defaultState");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "parameter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "key");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setParameterState:forKey:", v13, v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

  }
  objc_msgSend(v5, "record");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickActionSurfaces");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setQuickActionSurfacesForSharing:", v18);

  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFWorkflow *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFWorkflow *v9;

  v4 = +[WFWorkflow allocWithZone:](WFWorkflow, "allocWithZone:", a3);
  -[WFWorkflow record](self, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[WFWorkflow reference](self, "reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow storageProvider](self, "storageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFWorkflow initWithRecord:reference:storageProvider:error:](v4, "initWithRecord:reference:storageProvider:error:", v6, v7, v8, 0);

  return v9;
}

- (WFDatabase)database
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[WFWorkflow storageProvider](self, "storageProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFDatabase *)v5;
}

- (void)save
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  WFWorkflow *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[WFWorkflow saveDisabled](self, "saveDisabled")
    && !-[WFWorkflow ignoreModifications](self, "ignoreModifications"))
  {
    -[WFWorkflow database](self, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      getWFWorkflowLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = 136315394;
        v7 = "-[WFWorkflow save]";
        v8 = 2112;
        v9 = self;
        _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Poking the save debouncer for workflow: %@", (uint8_t *)&v6, 0x16u);
      }

      -[WFWorkflow setRetainedSelf:](self, "setRetainedSelf:", self);
      -[WFWorkflow saveDebouncer](self, "saveDebouncer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "poke");

    }
    else
    {
      -[WFWorkflow saveWithCompletionBlock:](self, "saveWithCompletionBlock:", 0);
    }
  }
}

- (void)saveWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  WFWorkflow *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWorkflowLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[WFWorkflow saveWithCompletionBlock:]";
    v31 = 2112;
    v32 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Saving workflow: %@", buf, 0x16u);
  }

  getWFWorkflowLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  getWFWorkflowLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Save", ", buf, 2u);
  }

  if (-[WFWorkflow serializeActionsWhenSaving](self, "serializeActionsWhenSaving"))
  {
    getWFWorkflowLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    getWFWorkflowLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SerializeActions", ", buf, 2u);
    }

    -[WFWorkflow actions](self, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "if_map:", &__block_literal_global_284);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWorkflow record](self, "record");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToArray:", v15);

    if ((v18 & 1) == 0)
    {
      -[WFWorkflow record](self, "record");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActions:", v15);

    }
    -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 0);
    getWFWorkflowLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v21, OS_SIGNPOST_INTERVAL_END, v11, "SerializeActions", ", buf, 2u);
    }

  }
  buf[0] = 0;
  -[WFWorkflow inferOutputTypesWithHasOutputFallback:](self, "inferOutputTypesWithHasOutputFallback:", buf);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow setOutputClasses:](self, "setOutputClasses:", v23);

  -[WFWorkflow variableAvailability](self, "variableAvailability");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow setHasShortcutInputVariables:](self, "setHasShortcutInputVariables:", objc_msgSend(v24, "isShortcutInputVariableUsed"));

  -[WFWorkflow setHasOutputFallback:](self, "setHasOutputFallback:", buf[0]);
  -[WFWorkflow updateMinimumClientVersion](self, "updateMinimumClientVersion");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __38__WFWorkflow_saveWithCompletionBlock___block_invoke_285;
  v26[3] = &unk_1E7AF1AF8;
  v26[4] = self;
  v27 = v4;
  v28 = v7;
  v25 = v4;
  -[WFWorkflow configureAsSingleStepShortcutIfNecessary:](self, "configureAsSingleStepShortcutIfNecessary:", v26);

}

- (void)saveFromDebouncer:(id)a3
{
  void *v5;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflow.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("debouncer"));

  }
  -[WFWorkflow saveWithCompletionBlock:](self, "saveWithCompletionBlock:", 0);
}

- (void)reloadFromRecord
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  WFWorkflow *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  BOOL v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _QWORD v52[10];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  WFWorkflow *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[WFWorkflow storageProvider](self, "storageProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v35 = (id)v3;
    -[WFWorkflow reference](self, "reference");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[WFWorkflow serializeActionsWhenSaving](self, "serializeActionsWhenSaving");

      if (!v6)
      {
        getWFWorkflowLogObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[WFWorkflow storageProvider](self, "storageProvider");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v54 = "-[WFWorkflow reloadFromRecord]";
          v55 = 2114;
          v56 = self;
          v57 = 2114;
          v58 = v8;
          _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Reloading workflow: %{public}@ from storage provider: %{public}@", buf, 0x20u);

        }
        v52[0] = CFSTR("name");
        v52[1] = CFSTR("legacyName");
        v52[2] = CFSTR("icon");
        v52[3] = CFSTR("workflowTypes");
        v52[4] = CFSTR("workflowSubtitle");
        v52[5] = CFSTR("actionsDescription");
        v52[6] = CFSTR("associatedAppBundleIdentifier");
        v52[7] = CFSTR("quarantine");
        v52[8] = CFSTR("remoteQuarantineStatus");
        v52[9] = CFSTR("deleted");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 10);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v46 != v12)
                objc_enumerationMutation(v9);
              -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          }
          while (v11);
        }

        -[WFWorkflow record](self, "record");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copy");

        -[WFWorkflow storageProvider](self, "storageProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflow record](self, "record");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflow reference](self, "reference");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        v19 = objc_msgSend(v16, "reloadRecord:withReference:error:", v17, v18, &v44);
        v20 = (WFWorkflow *)v44;

        if ((v19 & 1) == 0)
        {
          getWFGeneralLogObject();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v54 = "-[WFWorkflow reloadFromRecord]";
            v55 = 2114;
            v56 = v20;
            _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_ERROR, "%s Failed to reload workflow from record. Error: %{public}@", buf, 0x16u);
          }

        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v22 = v9;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v41 != v25)
                objc_enumerationMutation(v22);
              -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          }
          while (v24);
        }

        -[WFWorkflow record](self, "record");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[WFWorkflow record:isEquivalentToRecord:](self, "record:isEquivalentToRecord:", v27, v15);

        if (!v28)
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v29 = self->_actions;
          v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v37;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v37 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
                objc_msgSend(v34, "removeEventObserver:", self);
                objc_msgSend(v34, "wasRemovedFromWorkflow:", self);
              }
              v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
            }
            while (v31);
          }

          -[WFWorkflow setGroupingCache:](self, "setGroupingCache:", 0);
          -[WFWorkflow setVariableAvailability:](self, "setVariableAvailability:", 0);
          -[WFWorkflow loadFromRecord](self, "loadFromRecord");
        }

      }
    }
    else
    {

    }
  }
}

- (void)loadFromRecord
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSArray *v10;
  NSArray *inputClasses;
  void *v12;
  WFWorkflowNoInputBehavior *v13;
  WFWorkflowNoInputBehavior *noInputBehavior;
  void *v15;
  NSArray *v16;
  NSArray *outputClasses;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *actions;
  void *v23;
  NSArray *v24;
  NSArray *importQuestions;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  NSObject *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[WFWorkflow record](self, "record");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getWFWorkflowLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[WFWorkflow loadFromRecord]";
    v41 = 2114;
    v42 = v3;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Loading workflow from record: %{public}@", buf, 0x16u);
  }

  getWFWorkflowLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  getWFWorkflowLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadFromRecord", ", buf, 2u);
  }

  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputClasses"));
  objc_msgSend(v3, "inputClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_300);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputClasses = self->_inputClasses;
  self->_inputClasses = v10;

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputClasses"));
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("noInputBehavior"));
  objc_msgSend(v3, "noInputBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WFWorkflowNoInputBehaviorFromSerializedRepresentation(v12);
  v13 = (WFWorkflowNoInputBehavior *)objc_claimAutoreleasedReturnValue();
  noInputBehavior = self->_noInputBehavior;
  self->_noInputBehavior = v13;

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("noInputBehavior"));
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputClasses"));
  objc_msgSend(v3, "outputClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "if_compactMap:", &__block_literal_global_301);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputClasses = self->_outputClasses;
  self->_outputClasses = v16;

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputClasses"));
  objc_msgSend(v3, "actions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFAction actionsFromSerializedRepresentations:actionRegistry:](WFAction, "actionsFromSerializedRepresentations:actionRegistry:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actions"));
  v21 = (NSArray *)objc_msgSend(v20, "copy");
  actions = self->_actions;
  self->_actions = v21;

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actions"));
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("importQuestions"));
  objc_msgSend(v3, "importQuestions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __28__WFWorkflow_loadFromRecord__block_invoke_3;
  v37[3] = &unk_1E7AF1B80;
  v37[4] = self;
  objc_msgSend(v23, "if_compactMap:", v37);
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  importQuestions = self->_importQuestions;
  self->_importQuestions = v24;

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("importQuestions"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v20;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        -[WFWorkflow initializeAddedAction:](self, "initializeAddedAction:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), (_QWORD)v33);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }

  -[WFWorkflow updateInputAction](self, "updateInputAction");
  -[WFWorkflow fixControlFlowActionLayout](self, "fixControlFlowActionLayout");
  getWFWorkflowLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v32, OS_SIGNPOST_INTERVAL_END, v6, "LoadFromRecord", ", buf, 2u);
  }

}

- (void)performBatchOperation:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[WFWorkflow setSaveDisabled:](self, "setSaveDisabled:", 1);
  v4[2](v4);

  -[WFWorkflow setSaveDisabled:](self, "setSaveDisabled:", 0);
  -[WFWorkflow save](self, "save");
}

- (void)updateMinimumClientVersion
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("900");
  v4 = CFSTR("900");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WFWorkflow actions](self, "actions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      v10 = v3;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "minimumSupportedClientVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WFMaximumBundleVersion(v11, v10);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v3;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[WFWorkflow inputAction](self, "inputAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFWorkflow inputAction](self, "inputAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "minimumSupportedClientVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WFMaximumBundleVersion(v3, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v15;
  }
  -[WFWorkflow record](self, "record");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minimumClientVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = WFCompareBundleVersions(v3, v17);

  if (v18 != 1)
  {
    -[WFWorkflow record](self, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMinimumClientVersion:", v3);

  }
}

- (BOOL)reloadReferenceFromStorage
{
  char v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    return -[WFWorkflow queue_reloadReferenceFromStorage](self, "queue_reloadReferenceFromStorage");
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__WFWorkflow_reloadReferenceFromStorage__block_invoke;
  v5[3] = &unk_1E7AF92E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(MEMORY[0x1E0C80D38], v5);
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (BOOL)queue_reloadReferenceFromStorage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  WFWorkflowReference *v11;
  WFWorkflowReference *reference;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  WFWorkflow *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[WFWorkflow storageProvider](self, "storageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  -[WFWorkflow reference](self, "reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reference"));
    objc_msgSend(v5, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referenceForWorkflowID:", v7);
    v11 = (WFWorkflowReference *)objc_claimAutoreleasedReturnValue();
    reference = self->_reference;
    self->_reference = v11;

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reference"));
    goto LABEL_23;
  }
  if (v5)
  {
    if (v7)
      goto LABEL_23;
    goto LABEL_20;
  }
  getWFWorkflowLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315394;
    v17 = "-[WFWorkflow queue_reloadReferenceFromStorage]";
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEBUG, "%s Asked to reload reference from storage, but missing storage: %@", (uint8_t *)&v16, 0x16u);
  }

  if (!v7)
  {
LABEL_20:
    getWFWorkflowLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315394;
      v17 = "-[WFWorkflow queue_reloadReferenceFromStorage]";
      v18 = 2112;
      v19 = self;
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEBUG, "%s Asked to reload reference from storage, but missing identifier: %@", (uint8_t *)&v16, 0x16u);
    }

  }
LABEL_23:

  return v9;
}

- (void)clearOutReference
{
  WFWorkflowReference *reference;

  reference = self->_reference;
  self->_reference = 0;

}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a3;
  -[WFWorkflow actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
    goto LABEL_6;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF71C0A0) & 1) == 0)
  {

LABEL_6:
    v8[2](v8, 0);
    goto LABEL_7;
  }
  v7 = v6;

  objc_msgSend(v7, "generateStandaloneShortcutRepresentation:", v8);
LABEL_7:

}

- (void)configureAsSingleStepShortcutIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  os_signpost_id_t v12;
  uint8_t buf[16];

  v4 = a3;
  getWFWorkflowLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  getWFWorkflowLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "GenerateStandaloneRepresentation", ", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke;
  v10[3] = &unk_1E7AF1BD0;
  v11 = v4;
  v12 = v6;
  v10[4] = self;
  v9 = v4;
  -[WFWorkflow generateStandaloneShortcutRepresentation:](self, "generateStandaloneShortcutRepresentation:", v10);

}

- (void)configureWithStandaloneShortcutRepresentation:(id)a3 homeSummaryText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  WFWorkflow *v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  WFWorkflow *v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  WFWorkflow *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFWorkflow record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getWFWorkflowLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[WFWorkflow configureWithStandaloneShortcutRepresentation:homeSummaryText:]";
      v42 = 2114;
      v43 = self;
      v44 = 2114;
      v45 = v6;
      v11 = "%s Configuring workflow %{public}@ as single step shortcut with representation: %{public}@";
      v12 = v9;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[WFWorkflow configureWithStandaloneShortcutRepresentation:homeSummaryText:]";
    v42 = 2114;
    v43 = self;
    v11 = "%s Updating subtitle and actions summary of workflow: %{public}@";
    v12 = v9;
    v13 = 22;
    goto LABEL_6;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__WFWorkflow_configureWithStandaloneShortcutRepresentation_homeSummaryText___block_invoke;
  aBlock[3] = &unk_1E7AF55D0;
  v14 = v6;
  v37 = v14;
  v38 = self;
  v15 = v8;
  v39 = v15;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFWorkflow resolvedAssociatedAppBundleIdentifier](self, "resolvedAssociatedAppBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || (-[WFWorkflow associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier"),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v14, "associatedAppBundleIdentifier"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CBD960], "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v19, v16);

    if (v7)
    {
LABEL_11:
      v20 = v7;
      goto LABEL_14;
    }
  }
  else
  {
    v16[2](v16);
    if (v7)
      goto LABEL_11;
  }
  -[WFWorkflow localizedActionsSummary](self, "localizedActionsSummary");
  v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v21 = v20;
  objc_msgSend(v15, "actionsDescription");
  v22 = objc_claimAutoreleasedReturnValue();
  if ((void *)v22 == v21)
  {

  }
  else
  {
    v23 = (void *)v22;
    objc_msgSend(v15, "actionsDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", v21);

    if ((v25 & 1) == 0)
    {
      -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actionsDescription"));
      objc_msgSend(v15, "setActionsDescription:", v21);
      -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actionsDescription"));
    }
  }
  -[WFWorkflow resolvedAssociatedAppBundleIdentifier](self, "resolvedAssociatedAppBundleIdentifier");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (id)v26;
  if (v6 && !v26)
  {
    objc_msgSend(v14, "associatedAppBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(v14, "launchIdForCurrentPlatform");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        objc_msgSend(v14, "activityBundleIdentifier");
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v30 = v33;

    }
    if ((VCIsShortcutsAppBundleIdentifier() & 1) != 0)
      v27 = 0;
    else
      v27 = v30;

  }
  if (!v27)
  {
    v34 = self;
    v35 = 0;
    goto LABEL_34;
  }
  if (-[WFWorkflow shouldAutoUpdateAssociatedAppBundleIdentifier](self, "shouldAutoUpdateAssociatedAppBundleIdentifier"))
  {
    v34 = self;
    v35 = v27;
LABEL_34:
    -[WFWorkflow setAssociatedAppBundleIdentifier:](v34, "setAssociatedAppBundleIdentifier:", v35);
  }

}

- (void)getHomeSummaryTextWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, _QWORD);

  v10 = (void (**)(id, _QWORD))a3;
  -[WFWorkflow actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[WFWorkflow actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1 && v7)
    objc_msgSend(v7, "localizedParameterSummaryWithCompletion:", v10);
  else
    v10[2](v10, 0);

}

- (void)initializeAddedAction:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWorkflowLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  getWFWorkflowLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "InitializeAddedAction", "identifier=%{signpost.description:attribute}@,class=%{signpost.description:attribute}@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v4, "willBeAddedToWorkflow:", self);
  -[WFWorkflow groupingCache](self, "groupingCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow actions](self, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:sortingWithWorkflowActions:", v4, v13);

  objc_msgSend(v4, "wasAddedToWorkflow:", self);
  objc_msgSend(v4, "addEventObserver:", self);
  getWFWorkflowLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v15, OS_SIGNPOST_INTERVAL_END, v6, "InitializeAddedAction", ", (uint8_t *)&v16, 2u);
  }

}

- (NSArray)actions
{
  NSArray *actions;
  NSArray *v4;
  NSArray *v5;

  actions = self->_actions;
  if (!actions)
  {
    v4 = (NSArray *)objc_opt_new();
    v5 = self->_actions;
    self->_actions = v4;

    actions = self->_actions;
  }
  return (NSArray *)(id)-[NSArray copy](actions, "copy");
}

- (void)addAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSArray *v7;
  NSArray *actions;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  WFWorkflow *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWorkflowLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[WFWorkflow addAction:]";
    v12 = 2114;
    v13 = v4;
    v14 = 2114;
    v15 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Adding action: %{public}@ to workflow: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actions"));
  -[WFWorkflow actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actions = self->_actions;
  self->_actions = v7;

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actions"));
  -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1);
  -[WFWorkflow save](self, "save");
  -[WFWorkflow initializeAddedAction:](self, "initializeAddedAction:", v4);
  -[WFWorkflow variableAvailability](self, "variableAvailability");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionDidChange:moved:removed:", v4, 0, 0);

}

- (void)removeAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflow removeActions:](self, "removeActions:", v6, v7, v8);
}

- (void)removeActions:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  id obj;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  WFWorkflow *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWorkflowLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[WFWorkflow removeActions:]";
    v59 = 2114;
    v60 = v4;
    v61 = 2114;
    v62 = self;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Removing actions: %{public}@ to workflow: %{public}@", buf, 0x20u);
  }

  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actions"));
  v37 = (void *)objc_opt_new();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v4;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v51;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v51 != v38)
          objc_enumerationMutation(obj);
        v41 = v6;
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v6);
        objc_msgSend(v7, "removeEventObserver:", self);
        -[WFWorkflow actions](self, "actions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        objc_msgSend(v9, "removeObject:", v7);
        v40 = v9;
        objc_storeStrong((id *)&self->_actions, v9);
        -[WFWorkflow groupingCache](self, "groupingCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeAction:", v7);

        objc_msgSend(v7, "wasRemovedFromWorkflow:", self);
        objc_msgSend(v7, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          objc_msgSend(v7, "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v13);

        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[WFWorkflow importQuestions](self, "importQuestions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v47 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(v19, "action");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqual:", v7);

              if (v21)
              {
                -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("importQuestions"));
                -[WFWorkflow importQuestions](self, "importQuestions");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "if_arrayByRemovingObject:", v19);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWorkflow setImportQuestions:](self, "setImportQuestions:", v23);

                -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("importQuestions"));
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v16);
        }

        v6 = v41 + 1;
      }
      while (v41 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v39);
  }

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actions"));
  -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1);
  -[WFWorkflow save](self, "save");
  if (objc_msgSend(v37, "count"))
  {
    -[WFWorkflow database](self, "database");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      -[WFWorkflow reference](self, "reference");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[WFWorkflow database](self, "database");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "allObjects");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflow reference](self, "reference");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deleteSmartPromptStatesForDeletedActionUUIDs:forReference:", v28, v29);

      }
    }
  }
  -[WFWorkflow variableAvailability](self, "variableAvailability");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = obj;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(v30, "actionDidChange:moved:removed:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j), 0, 1);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v33);
  }

}

- (void)insertAction:(id)a3 atIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actions"));
  -[WFWorkflow _insertAction:atIndex:](self, "_insertAction:atIndex:", v6, a4);

  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actions"));
  -[WFWorkflow save](self, "save");
}

- (void)_insertAction:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSArray *v9;
  NSArray *actions;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  WFWorkflow *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFWorkflowLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "-[WFWorkflow _insertAction:atIndex:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    v18 = 2114;
    v19 = self;
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Inserting action: %{public}@ at index: %lu to workflow: %{public}@", (uint8_t *)&v12, 0x2Au);
  }

  -[WFWorkflow actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSArray *)objc_msgSend(v8, "mutableCopy");

  -[NSArray insertObject:atIndex:](v9, "insertObject:atIndex:", v6, a4);
  actions = self->_actions;
  self->_actions = v9;

  -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1);
  -[WFWorkflow initializeAddedAction:](self, "initializeAddedAction:", v6);
  -[WFWorkflow variableAvailability](self, "variableAvailability");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionDidChange:moved:removed:", v6, 1, 0);

}

- (void)insertActions:(id)a3 atIndexes:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WFWorkflow *v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflow.m"), 925, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions.count == indexes.count"));

  }
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actions"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__WFWorkflow_insertActions_atIndexes___block_invoke;
  v13[3] = &unk_1E7AF55D0;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  -[WFWorkflow performBatchOperation:](self, "performBatchOperation:", v13);
  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actions"));

}

- (void)moveActionsAtIndexes:(id)a3 toIndexes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  WFWorkflow *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    getWFWorkflowLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[WFWorkflow moveActionsAtIndexes:toIndexes:]";
      v31 = 2114;
      v32 = v6;
      v33 = 2114;
      v34 = v7;
      v35 = 2114;
      v36 = self;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Moving actions from indexes: %{public}@ to indexes: %{public}@ in workflow: %{public}@", buf, 0x2Au);
    }

    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("actions"));
    -[WFWorkflow actions](self, "actions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v23 = v6;
    objc_msgSend(v10, "objectsAtIndexes:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsInArray:", v11);
    v22 = v7;
    objc_msgSend(v10, "insertObjects:atIndexes:", v11, v7);
    objc_storeStrong((id *)&self->_actions, v10);
    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("actions"));
    -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1);
    -[WFWorkflow save](self, "save");
    -[WFWorkflow variableAvailability](self, "variableAvailability");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "actionDidChange:moved:removed:", v18, 1, 0);
          -[WFWorkflow groupingCache](self, "groupingCache");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "groupingIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflow actions](self, "actions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sortActionsForGroupingIdentifier:withWorkflowActions:", v20, v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    v7 = v22;
    v6 = v23;
  }

}

- (WFActionGroupingCache)groupingCache
{
  WFActionGroupingCache *groupingCache;
  WFActionGroupingCache *v4;
  WFActionGroupingCache *v5;

  groupingCache = self->_groupingCache;
  if (!groupingCache)
  {
    v4 = (WFActionGroupingCache *)objc_opt_new();
    v5 = self->_groupingCache;
    self->_groupingCache = v4;

    groupingCache = self->_groupingCache;
  }
  return groupingCache;
}

- (id)actionsGroupedWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFWorkflow groupingCache](self, "groupingCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionsForGroupingIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFWorkflow actions](self, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      v11[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hasActions
{
  void *v2;
  BOOL v3;

  -[WFWorkflow actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[WFWorkflow variableAvailability](self, "variableAvailability");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateContentClassCache");
  objc_msgSend(v6, "invalidateActionOutputProviderCache");
  objc_msgSend(v6, "updateShortcutInputVariableUsageForChangeInAction:removed:", v5, 0);

  -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1);
  -[WFWorkflow save](self, "save");
  -[WFWorkflow updateInputAction](self, "updateInputAction");

}

- (void)action:(id)a3 supplementalParameterValueDidChangeForKey:(id)a4
{
  -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1, a4);
  -[WFWorkflow save](self, "save");
}

- (void)actionNameDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[WFWorkflow actions](self, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(obj);
          v21 = v6;
          v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v7, "containedVariables");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v23;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v23 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v13, "outputUUID");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v14, "isEqualToString:", v5);

                  if (v15)
                  {
                    objc_msgSend(v13, "variableProvider");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "outputName");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "variableProvider:variableNameDidChangeTo:", v16, v17);

                  }
                }
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v10);
          }

          v6 = v21 + 1;
        }
        while (v21 + 1 != v20);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }

  }
}

- (void)actionOutputDetailsDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[WFWorkflow actions](self, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v18)
    {
      v17 = *(_QWORD *)v24;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v5);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v6, "containedVariables");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v20;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v20 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v12, "outputUUID");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = objc_msgSend(v13, "isEqualToString:", v4);

                  if (v14)
                  {
                    objc_msgSend(v12, "variableProvider");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "variableProviderDidInvalidateOutputDetails:", v15);

                  }
                }
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v9);
          }

          ++v5;
        }
        while (v5 != v18);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v18);
    }

  }
}

- (WFVariableAvailability)variableAvailability
{
  WFVariableAvailability *variableAvailability;
  WFVariableAvailability *v4;
  WFVariableAvailability *v5;

  variableAvailability = self->_variableAvailability;
  if (!variableAvailability)
  {
    v4 = -[WFVariableAvailability initWithWorkflow:]([WFVariableAvailability alloc], "initWithWorkflow:", self);
    v5 = self->_variableAvailability;
    self->_variableAvailability = v4;

    variableAvailability = self->_variableAvailability;
  }
  return variableAvailability;
}

- (void)action:(id)a3 didChangeVariableName:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  WFWorkflow *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[WFWorkflow variableAvailability](self, "variableAvailability");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "renameVariable:to:fromAction:", v9, v10, v8);
    v28 = v11;
    v30 = v8;
    objc_msgSend(v11, "availableVariableNamesExcludingThoseProvidedByAction:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v27, "containsObject:", v9);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = self;
    -[WFWorkflow actions](self, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (!v33)
      goto LABEL_23;
    v32 = *(_QWORD *)v41;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(obj);
        v34 = v12;
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v13, "containedVariablesOfClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v19, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v9);

              if (!v21)
              {
                objc_msgSend(v19, "name");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", v10);

                if (!v26)
                  continue;
                v22 = v19;
                v23 = v13;
                v24 = v10;
                goto LABEL_17;
              }
              if (v35)
              {
                v22 = v19;
                v23 = v13;
                v24 = v9;
LABEL_17:
                objc_msgSend(v22, "variableProvider:variableWasMoved:", v23, v24);
                continue;
              }
              objc_msgSend(v19, "variableProvider:variableNameDidChangeTo:", v13, v10);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v16);
        }

        v12 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (!v33)
      {
LABEL_23:

        -[WFWorkflow setSerializeActionsWhenSaving:](v29, "setSerializeActionsWhenSaving:", 1);
        -[WFWorkflow save](v29, "save");

        v8 = v30;
        break;
      }
    }
  }

}

- (void)actionGroupingIdentifierWillChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflow groupingCache](self, "groupingCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAction:", v4);

}

- (void)actionGroupingIdentifierDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFWorkflow groupingCache](self, "groupingCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:sortingWithWorkflowActions:", v4, v5);

}

- (void)fixControlFlowActionLayout
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[WFWorkflow groupingCache](self, "groupingCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsByGroupingIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__WFWorkflow_fixControlFlowActionLayout__block_invoke;
  v5[3] = &unk_1E7AF1C88;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

- (id)effectiveInputClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;

  -[WFWorkflow inputClasses](self, "inputClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflow workflowTypes](self, "workflowTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflow effectiveInputClassesFromInputClasses:workflowTypes:](WFWorkflow, "effectiveInputClassesFromInputClasses:workflowTypes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[WFWorkflow database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFWorkflow database](self, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflow workflowID](self, "workflowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuredTriggersForWorkflowID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflow workflowID](self, "workflowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuredTriggersForWorkflowID:error:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (objc_msgSend(v11, "count"))
  {
    -[WFWorkflow additionalEffectiveInputClassesForTriggers:](self, "additionalEffectiveInputClassesForTriggers:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflow workflowTypes](self, "workflowTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = WFWorkflowTypesContainsInputType(v13);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v6);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v12;
    }
    v16 = v15;

  }
  else
  {
    v16 = v6;
  }

  return v16;
}

- (id)additionalEffectiveInputClassesForTriggers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "trigger", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "shortcutInputContentItemClass");

        if (v11)
          objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)localizedActionsSummary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[WFWorkflow actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[WFWorkflow actions](self, "actions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if (WFActionShouldBeIncludedInSummary(v11))
        {
          objc_msgSend(v11, "parameterSummaryString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 || (objc_msgSend(v11, "localizedName"), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend(v5, "addObject:", v12);

          }
          if ((unint64_t)objc_msgSend(v5, "count") > 9)
            break;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    if (objc_msgSend(v5, "count"))
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "stringForObjectValue:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[WFWorkflow localizedSubtitle](self, "localizedSubtitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v14;
  }
  else
  {
    WFLocalizedString(CFSTR("No actions"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)localizedSubtitle
{
  void *v2;
  void *v3;

  -[WFWorkflow actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflow localizedSubtitleWithActionCount:](WFWorkflow, "localizedSubtitleWithActionCount:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setImportQuestions:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSArray *importQuestions;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  BOOL v12;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v5 = a3;
  objc_msgSend(v5, "objectsNotMatchingClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflow.m"), 1305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![[importQuestions objectsNotMatchingClass:[WFWorkflowImportQuestion class]] count]"));

  }
  importQuestions = self->_importQuestions;
  v9 = (NSArray *)v5;
  v10 = importQuestions;
  if (v10 == v9)
  {

  }
  else
  {
    v11 = v10;
    if (v9 && v10)
    {
      v12 = -[NSArray isEqualToArray:](v9, "isEqualToArray:", v10);

      if (v12)
        goto LABEL_14;
    }
    else
    {

    }
    -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("importQuestions"));
    v13 = (NSArray *)-[NSArray copy](v9, "copy");
    v14 = self->_importQuestions;
    self->_importQuestions = v13;

    -[WFWorkflow importQuestions](self, "importQuestions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33__WFWorkflow_setImportQuestions___block_invoke;
    v21[3] = &unk_1E7AF1CD0;
    v21[4] = self;
    objc_msgSend(v15, "if_compactMap:", v21);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = v16;
    else
      v18 = MEMORY[0x1E0C9AA60];
    -[WFWorkflow record](self, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImportQuestions:", v18);

    -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("importQuestions"));
  }
LABEL_14:

}

- (BOOL)isUntitled
{
  void *v2;
  void *v3;
  char v4;

  -[WFWorkflow name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFWorkflow defaultName](WFWorkflow, "defaultName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hasPrefix:", v3);

  return v4;
}

- (BOOL)shouldShowInputAction
{
  void *v3;
  char v4;
  void *v5;

  -[WFWorkflow workflowTypes](self, "workflowTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((WFWorkflowTypesContainsInputType(v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[WFWorkflow variableAvailability](self, "variableAvailability");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isShortcutInputVariableUsed");

  }
  return v4;
}

- (void)updateInputAction
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id *p_inputAction;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v3 = -[WFWorkflow shouldShowInputAction](self, "shouldShowInputAction");
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[WFWorkflow workflowTypes](self, "workflowTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  p_inputAction = (id *)&self->_inputAction;
  -[WFInputAction inputSurfaces](self->_inputAction, "inputSurfaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  v11 = *p_inputAction;
  if (v3)
  {
    if (!v11)
    {
      v12 = 0;
LABEL_11:
      +[WFInputAction inputActionForWorkflow:](WFInputAction, "inputActionForWorkflow:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  else if (v11)
  {
    v12 = v11;
    goto LABEL_12;
  }
  if ((objc_msgSend(v10, "isEqualToSet:", v14) & 1) != 0)
    goto LABEL_17;
  v12 = *p_inputAction;
  if (v3)
    goto LABEL_11;
LABEL_12:
  v13 = 0;
LABEL_13:
  -[WFWorkflow willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputAction"));
  objc_storeStrong((id *)&self->_inputAction, v13);
  -[WFWorkflow didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputAction"));
  if (v12 && !v13)
    objc_msgSend(v12, "removedFromWorkflow");

LABEL_17:
}

- (id)inferOutputTypesWithHasOutputFallback:(BOOL *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  BOOL *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[WFWorkflow actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_450);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v23 = a3;
    v6 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((v10 & 1) != 0)
            v10 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "hasOutputFallback");
          else
            v10 = 0;
          v13 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v12, "outputContentClasses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setWithArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v27 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v18);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1;
    }

    if (v23)
      *v23 = v10;
    v21 = (void *)objc_msgSend(v6, "copy");

    v5 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  uint64_t (*v27)(uint64_t);
  uint64_t *p_block;
  uint64_t block;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  if (-[WFWorkflow isSaving](self, "isSaving"))
  {
    -[WFWorkflow setSaving:](self, "setSaving:", 0);
  }
  else if (!-[WFWorkflow ignoreModifications](self, "ignoreModifications"))
  {
    -[WFWorkflow reference](self, "reference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (!objc_msgSend(v17, "objectType"))
          {
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v11);

            if (v19)
            {
              v34 = MEMORY[0x1E0C809B0];
              v27 = __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke;
              p_block = &v34;
LABEL_25:
              p_block[1] = 3221225472;
              p_block[2] = (uint64_t)v27;
              p_block[3] = (uint64_t)&unk_1E7AF94B0;
              p_block[4] = (uint64_t)self;
              dispatch_async(MEMORY[0x1E0C80D38], p_block);
              goto LABEL_26;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v14)
          continue;
        break;
      }
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v8;
    v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      while (2)
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v12);
          v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if (!objc_msgSend(v24, "objectType"))
          {
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v11);

            if (v26)
            {
              block = MEMORY[0x1E0C809B0];
              v27 = __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke_2;
              p_block = &block;
              goto LABEL_25;
            }
          }
        }
        v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_26:

  }
}

- (BOOL)record:(id)a3 isEquivalentToRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  int v97;
  int v98;
  uint64_t v99;
  int v100;
  int v101;
  id v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  LOBYTE(v12) = 0;
  v13 = v10;
  v14 = v9;
  if (!v9 || !v10)
    goto LABEL_117;
  v15 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v15)
  {
LABEL_7:
    objc_msgSend(v5, "legacyName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "legacyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_116;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_117:

        goto LABEL_118;
      }
    }
    objc_msgSend(v5, "workflowSubtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workflowSubtitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    if (v20 == v24)
    {
      v130 = v13;

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      v26 = v20;
      if (!v20 || !v24)
        goto LABEL_115;
      v130 = v13;
      v27 = objc_msgSend(v20, "isEqualToString:", v24);

      if (!v27)
      {
        LOBYTE(v12) = 0;
        v13 = v130;
LABEL_116:

        goto LABEL_117;
      }
    }
    objc_msgSend(v5, "actionsDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionsDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v28;
    v30 = v29;
    v129 = v30;
    if (v26 != v30)
    {
      LOBYTE(v12) = 0;
      if (v26)
      {
        v31 = v30;
        v32 = v26;
        if (v30)
        {
          v33 = objc_msgSend(v26, "isEqualToString:", v30);

          if (!v33)
          {
            LOBYTE(v12) = 0;
LABEL_114:
            v25 = v129;
            v13 = v130;
LABEL_115:

            goto LABEL_116;
          }
LABEL_25:
          v128 = v26;
          objc_msgSend(v5, "associatedAppBundleIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "associatedAppBundleIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v34;
          v37 = v35;
          v126 = v37;
          v127 = v36;
          if (v36 != v37)
          {
            LOBYTE(v12) = 0;
            if (v36)
            {
              v38 = v37;
              v39 = v36;
              v26 = v128;
              if (v37)
              {
                v40 = objc_msgSend(v127, "isEqualToString:", v37);

                if (!v40)
                {
                  LOBYTE(v12) = 0;
                  v26 = v128;
LABEL_112:
                  v31 = v126;
                  v32 = v127;
                  goto LABEL_113;
                }
LABEL_31:
                objc_msgSend(v5, "icon");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "icon");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v41;
                v44 = v42;
                v124 = v44;
                v125 = v43;
                if (v43 != v44)
                {
                  LOBYTE(v12) = 0;
                  if (v43)
                  {
                    v45 = v44;
                    v26 = v128;
                    if (v44)
                    {
                      v46 = objc_msgSend(v43, "isEqual:", v44);

                      if (!v46)
                      {
                        LOBYTE(v12) = 0;
                        v26 = v128;
LABEL_110:
                        v38 = v124;
                        v39 = v125;
                        goto LABEL_111;
                      }
LABEL_38:
                      v47 = (void *)MEMORY[0x1E0C99E60];
                      objc_msgSend(v5, "workflowTypes");
                      v121 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "setWithArray:", v121);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = (void *)MEMORY[0x1E0C99E60];
                      objc_msgSend(v6, "workflowTypes");
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "setWithArray:");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = v48;
                      v52 = v50;
                      v122 = v52;
                      v123 = v51;
                      if (v51 != v52)
                      {
                        LOBYTE(v12) = 0;
                        if (v51)
                        {
                          v53 = v52;
                          v54 = v51;
                          v26 = v128;
                          if (v52)
                          {
                            v55 = objc_msgSend(v123, "isEqual:", v52);

                            if (!v55)
                            {
                              LOBYTE(v12) = 0;
                              v26 = v128;
LABEL_108:

                              v43 = (id)v121;
                              v45 = v123;
                              goto LABEL_109;
                            }
LABEL_45:
                            v56 = (void *)MEMORY[0x1E0C99E60];
                            objc_msgSend(v5, "inputClasses");
                            v117 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v56, "setWithArray:", v117);
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            v58 = (void *)MEMORY[0x1E0C99E60];
                            objc_msgSend(v6, "inputClasses");
                            v116 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v58, "setWithArray:");
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            v60 = v57;
                            v61 = v59;
                            v118 = v61;
                            v119 = v60;
                            if (v60 != v61)
                            {
                              LOBYTE(v12) = 0;
                              if (v60)
                              {
                                v62 = v61;
                                v63 = v60;
                                v26 = v128;
                                if (v61)
                                {
                                  v64 = objc_msgSend(v119, "isEqual:", v61);

                                  if (!v64)
                                  {
                                    LOBYTE(v12) = 0;
                                    v26 = v128;
LABEL_106:

                                    v54 = (void *)v117;
                                    v53 = v119;
                                    goto LABEL_107;
                                  }
LABEL_52:
                                  objc_msgSend(v5, "noInputBehavior");
                                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v6, "noInputBehavior");
                                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                                  v67 = v65;
                                  v68 = v66;
                                  v114 = v68;
                                  v115 = v67;
                                  if (v67 != v68)
                                  {
                                    LOBYTE(v12) = 0;
                                    if (v67)
                                    {
                                      v69 = v68;
                                      v26 = v128;
                                      if (v68)
                                      {
                                        v70 = objc_msgSend(v67, "isEqualToDictionary:", v68);

                                        if (!v70)
                                        {
                                          LOBYTE(v12) = 0;
                                          v26 = v128;
LABEL_104:
                                          v62 = v114;
                                          v63 = v115;
                                          goto LABEL_105;
                                        }
LABEL_59:
                                        v71 = (void *)MEMORY[0x1E0C99E60];
                                        objc_msgSend(v5, "outputClasses");
                                        v111 = objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v71, "setWithArray:");
                                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                                        v73 = (void *)MEMORY[0x1E0C99E60];
                                        objc_msgSend(v6, "outputClasses");
                                        v110 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v73, "setWithArray:");
                                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                                        v75 = v72;
                                        v76 = v74;
                                        v112 = v76;
                                        v113 = v75;
                                        if (v75 != v76)
                                        {
                                          LOBYTE(v12) = 0;
                                          if (v75)
                                          {
                                            v77 = v76;
                                            v78 = v75;
                                            v26 = v128;
                                            if (v76)
                                            {
                                              v79 = objc_msgSend(v113, "isEqual:", v76);

                                              if (!v79)
                                              {
                                                LOBYTE(v12) = 0;
                                                v26 = v128;
LABEL_102:

                                                v69 = v113;
                                                v67 = (id)v111;
                                                goto LABEL_103;
                                              }
LABEL_66:
                                              objc_msgSend(v5, "actions");
                                              v80 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v6, "actions");
                                              v81 = (void *)objc_claimAutoreleasedReturnValue();
                                              v82 = v80;
                                              v83 = v81;
                                              v108 = v83;
                                              v109 = v82;
                                              if (v82 != v83)
                                              {
                                                LOBYTE(v12) = 0;
                                                if (v82)
                                                {
                                                  v84 = v83;
                                                  v26 = v128;
                                                  if (v83)
                                                  {
                                                    v85 = objc_msgSend(v82, "isEqualToArray:", v83);

                                                    if (!v85)
                                                    {
                                                      LOBYTE(v12) = 0;
                                                      v26 = v128;
LABEL_100:
                                                      v77 = v108;
                                                      v78 = v109;
                                                      goto LABEL_101;
                                                    }
LABEL_73:
                                                    objc_msgSend(v5, "importQuestions");
                                                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_msgSend(v6, "importQuestions");
                                                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v82 = v86;
                                                    v88 = v87;
                                                    v107 = v88;
                                                    if (v82 == v88)
                                                    {

                                                      v104 = v82;
                                                    }
                                                    else
                                                    {
                                                      LOBYTE(v12) = 0;
                                                      if (!v82)
                                                      {
                                                        v89 = v88;
                                                        v90 = 0;
                                                        v26 = v128;
                                                        goto LABEL_97;
                                                      }
                                                      v89 = v88;
                                                      v90 = v82;
                                                      v26 = v128;
                                                      if (!v88)
                                                      {
LABEL_97:
                                                        v106 = v90;

                                                        goto LABEL_98;
                                                      }
                                                      v91 = v82;
                                                      v92 = objc_msgSend(v82, "isEqualToArray:", v88);

                                                      v104 = v91;
                                                      if (!v92)
                                                      {
                                                        LOBYTE(v12) = 0;
                                                        v26 = v128;
                                                        v82 = v104;
LABEL_98:
                                                        v84 = v107;
                                                        goto LABEL_99;
                                                      }
                                                    }
                                                    objc_msgSend(v5, "quarantine");
                                                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                                                    objc_msgSend(v6, "quarantine");
                                                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v95 = v93;
                                                    v96 = v94;
                                                    v12 = v96;
                                                    if (v95 == v96)
                                                    {
                                                      v103 = v96;

LABEL_87:
                                                      v98 = objc_msgSend(v5, "isDeleted", v103);
                                                      if (v98 == objc_msgSend(v6, "isDeleted"))
                                                      {
                                                        v105 = v95;
                                                        v99 = objc_msgSend(v5, "remoteQuarantineStatus");
                                                        if (v99 == objc_msgSend(v6, "remoteQuarantineStatus")
                                                          && (v100 = objc_msgSend(v5, "disabledOnLockScreen"),
                                                              v100 == objc_msgSend(v6, "disabledOnLockScreen")))
                                                        {
                                                          v101 = objc_msgSend(v5, "hiddenFromLibraryAndSync");
                                                          LODWORD(v12) = v101 ^ objc_msgSend(v6, "hiddenFromLibraryAndSync") ^ 1;
                                                        }
                                                        else
                                                        {
                                                          LOBYTE(v12) = 0;
                                                        }
                                                        v26 = v128;
                                                        v82 = v104;
                                                        v90 = v105;
                                                        goto LABEL_96;
                                                      }
LABEL_88:
                                                      LOBYTE(v12) = 0;
                                                      v90 = v95;
                                                      v26 = v128;
                                                      v82 = v104;
LABEL_96:
                                                      v89 = v103;
                                                      goto LABEL_97;
                                                    }
                                                    if (v95 && v96)
                                                    {
                                                      v97 = objc_msgSend(v95, "isEqual:", v96);
                                                      v103 = v12;

                                                      if (!v97)
                                                        goto LABEL_88;
                                                      goto LABEL_87;
                                                    }

                                                    v89 = v12;
                                                    LOBYTE(v12) = 0;
                                                    v90 = v95;
                                                    v26 = v128;
                                                    v82 = v104;
                                                    goto LABEL_97;
                                                  }
                                                }
                                                else
                                                {
                                                  v84 = v83;
                                                  v26 = v128;
                                                }
LABEL_99:

                                                goto LABEL_100;
                                              }

                                              goto LABEL_73;
                                            }
                                          }
                                          else
                                          {
                                            v77 = v76;
                                            v78 = 0;
                                            v26 = v128;
                                          }
LABEL_101:

                                          goto LABEL_102;
                                        }

                                        goto LABEL_66;
                                      }
                                    }
                                    else
                                    {
                                      v69 = v68;
                                      v26 = v128;
                                    }
LABEL_103:

                                    goto LABEL_104;
                                  }

                                  goto LABEL_59;
                                }
                              }
                              else
                              {
                                v62 = v61;
                                v63 = 0;
                                v26 = v128;
                              }
LABEL_105:

                              goto LABEL_106;
                            }

                            goto LABEL_52;
                          }
                        }
                        else
                        {
                          v53 = v52;
                          v54 = 0;
                          v26 = v128;
                        }
LABEL_107:

                        goto LABEL_108;
                      }

                      goto LABEL_45;
                    }
                  }
                  else
                  {
                    v45 = v44;
                    v26 = v128;
                  }
LABEL_109:

                  goto LABEL_110;
                }

                goto LABEL_38;
              }
            }
            else
            {
              v38 = v37;
              v39 = 0;
              v26 = v128;
            }
LABEL_111:

            goto LABEL_112;
          }

          goto LABEL_31;
        }
      }
      else
      {
        v31 = v30;
        v32 = 0;
      }
LABEL_113:

      goto LABEL_114;
    }

    goto LABEL_25;
  }
  LOBYTE(v12) = 0;
LABEL_118:

  return (char)v12;
}

- (void)setVariableAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_variableAvailability, a3);
}

- (void)setGroupingCache:(id)a3
{
  objc_storeStrong((id *)&self->_groupingCache, a3);
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)inputClasses
{
  return self->_inputClasses;
}

- (WFWorkflowNoInputBehavior)noInputBehavior
{
  return self->_noInputBehavior;
}

- (NSArray)outputClasses
{
  return self->_outputClasses;
}

- (WFInputAction)inputAction
{
  return self->_inputAction;
}

- (void)setInputAction:(id)a3
{
  objc_storeStrong((id *)&self->_inputAction, a3);
}

- (NSArray)importQuestions
{
  return self->_importQuestions;
}

- (WFWorkflowReference)reference
{
  return self->_reference;
}

- (WFWorkflowRecord)record
{
  return self->_record;
}

- (int64_t)environment
{
  return self->_environment;
}

- (BOOL)ignoreModifications
{
  return self->_ignoreModifications;
}

- (void)setIgnoreModifications:(BOOL)a3
{
  self->_ignoreModifications = a3;
}

- (WFWorkflowEditingDelegate)editingDelegate
{
  return (WFWorkflowEditingDelegate *)objc_loadWeakRetained((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editingDelegate, a3);
}

- (WFWorkflowStorage)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_storageProvider, a3);
}

- (BOOL)saveDisabled
{
  return self->_saveDisabled;
}

- (void)setSaveDisabled:(BOOL)a3
{
  self->_saveDisabled = a3;
}

- (BOOL)serializeActionsWhenSaving
{
  return self->_serializeActionsWhenSaving;
}

- (void)setSerializeActionsWhenSaving:(BOOL)a3
{
  self->_serializeActionsWhenSaving = a3;
}

- (WFDebouncer)saveDebouncer
{
  return self->_saveDebouncer;
}

- (BOOL)isSaving
{
  return self->_saving;
}

- (void)setSaving:(BOOL)a3
{
  self->_saving = a3;
}

- (BOOL)deletedFromDatabase
{
  return self->_deletedFromDatabase;
}

- (void)setDeletedFromDatabase:(BOOL)a3
{
  self->_deletedFromDatabase = a3;
}

- (WFWorkflow)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setRetainedSelf:(id)a3
{
  objc_storeStrong((id *)&self->_retainedSelf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_saveDebouncer, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_destroyWeak((id *)&self->_editingDelegate);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_importQuestions, 0);
  objc_storeStrong((id *)&self->_inputAction, 0);
  objc_storeStrong((id *)&self->_outputClasses, 0);
  objc_storeStrong((id *)&self->_noInputBehavior, 0);
  objc_storeStrong((id *)&self->_inputClasses, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_groupingCache, 0);
  objc_storeStrong((id *)&self->_variableAvailability, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

uint64_t __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStorageProvider:", 0);
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("deleted"));
  objc_msgSend(*(id *)(a1 + 32), "setDeletedFromDatabase:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("deleted"));
}

uint64_t __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reloadReferenceFromStorage");
  return objc_msgSend(*(id *)(a1 + 32), "reloadFromRecord");
}

id __52__WFWorkflow_inferOutputTypesWithHasOutputFallback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

id __33__WFWorkflow_setImportQuestions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serializedRepresentationWithWorkflowActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__WFWorkflow_fixControlFlowActionLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD v38[3];
  uint64_t v39;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    if (objc_msgSend(v10, "mode"))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeActions:", v7);
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v7, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (objc_msgSend(v11, "mode") == 2)
        goto LABEL_15;
      objc_msgSend(*(id *)(a1 + 32), "actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexOfObject:", v11);

      objc_msgSend(v10, "createAccompanyingActionWithMode:", 2);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);
      objc_msgSend(*(id *)(a1 + 32), "insertAction:atIndex:", v14, v13 + 1);
    }
    else
    {
      v14 = 0;
    }

    v11 = (void *)v14;
LABEL_15:
    v15 = v10;
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "parameterStateForKey:", CFSTR("WFMenuItems"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
        }
        else
        {
          v17 = 0;
        }
        v18 = v17;

        objc_msgSend(v18, "values");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "if_compactMap:", &__block_literal_global_331);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x2020000000;
        v39 = 0;
        v20 = objc_msgSend(v19, "count");
        objc_msgSend(*(id *)(a1 + 32), "actions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
        {
          objc_msgSend(v19, "lastObject");
          v30 = v19;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "indexOfObject:", v23);

          v19 = v30;
        }
        else
        {
          v24 = objc_msgSend(v21, "indexOfObject:", v15);
        }

        v39 = v24;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __40__WFWorkflow_fixControlFlowActionLayout__block_invoke_3;
        v33[3] = &unk_1E7AF1C60;
        v25 = v19;
        v34 = v25;
        v15 = v15;
        v26 = *(_QWORD *)(a1 + 32);
        v35 = v15;
        v36 = v26;
        v37 = v38;
        objc_msgSend(v32, "enumerateObjectsUsingBlock:", v33);
        v27 = objc_msgSend(v32, "count");
        if (v27 < objc_msgSend(v25, "count"))
        {
          v31 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", objc_msgSend(v32, "count"), objc_msgSend(v25, "count") - objc_msgSend(v32, "count"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectsAtIndexes:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeActions:", v29);

        }
        _Block_object_dispose(v38, 8);

      }
    }

    goto LABEL_29;
  }
LABEL_30:

}

void __40__WFWorkflow_fixControlFlowActionLayout__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (objc_msgSend(v5, "count") <= a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "createAccompanyingActionWithMode:", 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "insertAction:atIndex:");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  WFTitleForParameterValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setItemTitle:", v7);
}

id __40__WFWorkflow_fixControlFlowActionLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v2, "mode") == 1)
      v3 = v2;
    else
      v3 = 0;
    v4 = v2;
  }
  else
  {

    v4 = 0;
    v3 = 0;
  }
  v5 = v3;

  return v5;
}

void __38__WFWorkflow_insertActions_atIndexes___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;
  _QWORD *v4;
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__WFWorkflow_insertActions_atIndexes___block_invoke_2;
  v2[3] = &unk_1E7AF1BF8;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = v5;
  objc_msgSend(v1, "enumerateIndexesUsingBlock:", v2);

  _Block_object_dispose(v5, 8);
}

void __38__WFWorkflow_insertActions_atIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_insertAction:atIndex:", v5, a2);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

void __76__WFWorkflow_configureWithStandaloneShortcutRepresentation_homeSummaryText___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;

  objc_msgSend(a1[4], "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
    goto LABEL_8;
  objc_msgSend(a1[5], "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

LABEL_8:
    goto LABEL_9;
  }
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v8 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    objc_msgSend(a1[5], "localizedSubtitle");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

LABEL_11:
  objc_msgSend(a1[4], "title");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v10 = (void *)v9;
  objc_msgSend(a1[6], "workflowSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  v12 = v11;
  if (v14 == v12)
  {

  }
  else
  {
    if (v14 && v12)
    {
      v13 = objc_msgSend(v14, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    objc_msgSend(a1[5], "willChangeValueForKey:", CFSTR("workflowSubtitle"));
    objc_msgSend(a1[6], "setWorkflowSubtitle:", v14);
    objc_msgSend(a1[5], "didChangeValueForKey:", CFSTR("workflowSubtitle"));
  }
LABEL_20:

}

void __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  os_signpost_id_t v17;
  uint8_t buf[16];

  v3 = a2;
  getWFWorkflowLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v5, OS_SIGNPOST_INTERVAL_END, v6, "GenerateStandaloneRepresentation", ", buf, 2u);
  }

  getWFWorkflowLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  getWFWorkflowLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HomeSummaryText", ", buf, 2u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke_313;
  v13[3] = &unk_1E7AF1BA8;
  v17 = v8;
  v11 = (void *)a1[5];
  v14 = (id)a1[4];
  v15 = v3;
  v16 = v11;
  v12 = v3;
  objc_msgSend(v14, "getHomeSummaryTextWithCompletion:", v13);

}

uint64_t __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke_313(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t result;
  uint8_t v8[16];

  v3 = a2;
  getWFWorkflowLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HomeSummaryText", ", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "configureWithStandaloneShortcutRepresentation:homeSummaryText:", *(_QWORD *)(a1 + 40), v3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __40__WFWorkflow_reloadReferenceFromStorage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "queue_reloadReferenceFromStorage");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

WFWorkflowImportQuestion *__28__WFWorkflow_loadFromRecord__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFWorkflowImportQuestion *v4;

  v3 = a2;
  v4 = -[WFWorkflowImportQuestion initWithSerializedRepresentation:workflowActions:]([WFWorkflowImportQuestion alloc], "initWithSerializedRepresentation:workflowActions:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  return v4;
}

Class __28__WFWorkflow_loadFromRecord__block_invoke_2(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

Class __28__WFWorkflow_loadFromRecord__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

void __38__WFWorkflow_saveWithCompletionBlock___block_invoke_285(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "storageProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "reference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "setSaving:", 1);
      getWFWorkflowLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "record");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "storageProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v18 = "-[WFWorkflow saveWithCompletionBlock:]_block_invoke";
        v19 = 2114;
        v20 = v5;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Saving workflow record: %{public}@ to storage provider: %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "storageProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "record");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "reference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v10 = objc_msgSend(v7, "saveRecord:withReference:error:", v8, v9, &v16);
      v2 = v16;

      if ((v10 & 1) == 0)
      {
        getWFGeneralLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[WFWorkflow saveWithCompletionBlock:]_block_invoke";
          v19 = 2114;
          v20 = v2;
          _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save workflow. Error: %{public}@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "reloadReferenceFromStorage");
      objc_msgSend(*(id *)(a1 + 32), "setRetainedSelf:", 0);
    }
    else
    {
      v2 = 0;
    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v2);
  getWFWorkflowLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Save", ", buf, 2u);
  }

}

uint64_t __38__WFWorkflow_saveWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializedRepresentation");
}

uint64_t __34__WFWorkflow_validImportQuestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "action");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

NSString *__31__WFWorkflow_setOutputClasses___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

NSString *__30__WFWorkflow_setInputClasses___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

id __51__WFWorkflow_resolvedAssociatedAppBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF71C0A0))
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  objc_msgSend(v5, "associatedAppBundleIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id)v6;

  }
  else
  {
    objc_msgSend(v3, "displayableAppDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_10;
  }
  if ((VCIsShortcutsAppBundleIdentifier() & 1) == 0)
  {
    v7 = v7;
    v9 = v7;
    goto LABEL_12;
  }
LABEL_10:
  v9 = 0;
LABEL_12:

  return v9;
}

+ (WFWorkflow)workflowWithReference:(id)a3 database:(id)a4 error:(id *)a5
{
  return (WFWorkflow *)objc_msgSend(a1, "workflowWithReference:database:migrateIfNecessary:environment:error:", a3, a4, 1, 0, a5);
}

+ (WFWorkflow)workflowWithReference:(id)a3 database:(id)a4 migrateIfNecessary:(BOOL)a5 environment:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  WFDatabaseWorkflowStorage *v19;
  WFWorkflow *v20;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "recordWithDescriptor:error:", v11, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v22 = 136315906;
      v23 = "WFEnforceClass";
      v24 = 2114;
      v25 = v15;
      v26 = 2114;
      v27 = (id)objc_opt_class();
      v28 = 2114;
      v29 = v14;
      v18 = v27;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v22, 0x2Au);

    }
    v16 = 0;
  }
  else
  {
    v16 = v15;
  }

  if (v16)
  {
    v19 = -[WFDatabaseWorkflowStorage initWithDatabase:]([WFDatabaseWorkflowStorage alloc], "initWithDatabase:", v12);
    v20 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v16, v11, v19, v9, a6, a7);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)supportedInputClasses
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "supportedInputClassNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_199);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedInputClassNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", CFSTR("WFAppContentItem"), CFSTR("WFAppStoreAppContentItem"), CFSTR("WFArticleContentItem"), CFSTR("WFContactContentItem"), CFSTR("WFDateContentItem"), CFSTR("WFEmailAddressContentItem"), CFSTR("WFFolderContentItem"), CFSTR("WFGenericFileContentItem"), CFSTR("WFImageContentItem"), CFSTR("WFiTunesProductContentItem"), CFSTR("WFLocationContentItem"), CFSTR("WFDCMapsLinkContentItem"), CFSTR("WFAVAssetContentItem"), CFSTR("WFPDFContentItem"), CFSTR("WFPhoneNumberContentItem"), CFSTR("WFRichTextContentItem"), CFSTR("WFSafariWebPageContentItem"),
               CFSTR("WFStringContentItem"),
               CFSTR("WFURLContentItem"),
               0);
}

+ (id)defaultName
{
  return WFLocalizedString(CFSTR("New Shortcut"));
}

+ (id)effectiveInputClassesFromInputClasses:(id)a3 workflowTypes:(id)a4
{
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v6 = WFWorkflowTypesContainsInputType(a4);
  v7 = v5;
  if ((v6 & 1) == 0)
  {
    +[WFWorkflow supportedInputClasses](WFWorkflow, "supportedInputClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  if (objc_msgSend(v9, "containsObject:", objc_opt_class()))
  {
    v10 = objc_opt_class();
    objc_msgSend(v9, "insertObject:atIndex:", v10, objc_msgSend(v9, "indexOfObject:", objc_opt_class()));
  }
  if (objc_msgSend(v9, "containsObject:", objc_opt_class()))
  {
    v11 = objc_opt_class();
    objc_msgSend(v9, "insertObject:atIndex:", v11, objc_msgSend(v9, "indexOfObject:", objc_opt_class()));
  }

  return v9;
}

+ (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  void *v4;
  void *v5;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:withBundleIdentifier:userInterface:completionHandler:", v5, CFSTR("com.apple.Preferences"), 0, 0);

  }
  return 1;
}

+ (BOOL)checkClientVersion:(id)a3 currentVersion:(id)a4 error:(id *)a5
{
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v7 = WFCompareBundleVersions(a3, a4);
  v8 = v7;
  if (a5 && (v7 & 1) == 0)
  {
    v17[0] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Shortcut Format Too New"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v17[1] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("This shortcut cannot be opened because it was created on a newer version of the Shortcuts app."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v10;
    v17[2] = *MEMORY[0x1E0CB2D78];
    WFLocalizedString(CFSTR("Update Shortcuts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    WFLocalizedString(CFSTR("OK"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = *MEMORY[0x1E0CB3148];
    v18[2] = v13;
    v18[3] = a1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 2, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8 & 1;
}

Class __35__WFWorkflow_supportedInputClasses__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (id)createUserActivityForViewing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[WFWorkflow workflowID](self, "workflowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("workflowID"));

  -[WFWorkflow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("workflowName"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("is.workflow.my.app.viewworkflow"));
  -[WFWorkflow name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v6, "setUserInfo:", v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("workflowID"), CFSTR("workflowName"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequiredUserInfoKeys:", v8);

  objc_msgSend(v6, "setEligibleForHandoff:", 0);
  objc_msgSend(v6, "setEligibleForSearch:", 0);

  return v6;
}

- (BOOL)isResidentCompatible
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFWorkflow actions](self, "actions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (!objc_msgSend(v7, "isResidentCompatible")
          || (objc_msgSend(v7, "containsVariableOfType:", CFSTR("Ask")) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 1;
  }
LABEL_13:

  return v8;
}

- (void)requestToRunScriptsOnDomain:(id)a3 withUserInterface:(id)a4 database:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void (**v27)(id, uint64_t);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  void (**v39)(id, uint64_t);
  _QWORD v40[4];
  void (**v41)(id, uint64_t);

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, uint64_t))a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflow+TrustedDomains.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[WFWorkflow reference](self, "reference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (objc_msgSend(v13, "isReference:allowedToRunOnDomain:", v15, v11))
    {
      v14[2](v14, 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflow name](self, "name");
      v34 = v12;
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lowercaseString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Do you want to give “%1$@” access to “%2$@”?"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)v17;
      objc_msgSend(v19, "localizedStringWithFormat:", v20, v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v21);

      v22 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Whenever you run this shortcut, “%1$@” will be able to interact with the current web page, including reading sensitive information such as passwords, phone numbers, and credit cards."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithFormat:", v23, v17, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMessage:", v24);

      v25 = (void *)MEMORY[0x1E0D13DE8];
      v26 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke;
      v40[3] = &unk_1E7AF8F48;
      v27 = v14;
      v41 = v27;
      objc_msgSend(v25, "cancelButtonWithHandler:", v40);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addButton:", v28);

      v29 = (void *)MEMORY[0x1E0D13DE8];
      WFLocalizedString(CFSTR("Allow"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v26;
      v12 = v34;
      v35[1] = 3221225472;
      v35[2] = __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke_2;
      v35[3] = &unk_1E7AF8F70;
      v36 = v13;
      v37 = v15;
      v38 = v11;
      v39 = v27;
      objc_msgSend(v29, "buttonWithTitle:style:preferred:handler:", v30, 0, 1, v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addButton:", v31);

      objc_msgSend(v34, "presentAlert:", v16);
    }
  }
  else
  {
    v14[2](v14, 0);
  }

}

uint64_t __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTrustedToRunScripts:forReference:onDomain:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
