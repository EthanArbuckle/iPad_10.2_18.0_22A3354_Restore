@implementation SHSheetActivitiesManager

- (SHSheetActivitiesManager)initWithSessionIdentifier:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  SHSheetActivitiesManager *v8;
  uint64_t v9;
  NSString *sessionIdentifier;
  _UIActivityHelper *v11;
  _UIActivityHelper *activityHelper;
  uint64_t v13;
  NSMutableDictionary *internalActivitiesByUUID;
  void *v15;
  SHSheetActivitiesManager *v16;
  id v17;
  uint64_t v18;
  NSArray *applicationActivityTypes;
  uint64_t v20;
  NSArray *applicationActivities;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  SHSheetActivitiesManager *v27;
  id v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SHSheetActivitiesManager;
  v8 = -[SHSheetActivitiesManager init](&v29, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    sessionIdentifier = v8->_sessionIdentifier;
    v8->_sessionIdentifier = (NSString *)v9;

    v11 = -[_UIActivityHelper initWithDelegate:sessionID:fetchShortcutsBlock:]([_UIActivityHelper alloc], "initWithDelegate:sessionID:fetchShortcutsBlock:", v8, v8->_sessionIdentifier, 0);
    activityHelper = v8->_activityHelper;
    v8->_activityHelper = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    internalActivitiesByUUID = v8->_internalActivitiesByUUID;
    v8->_internalActivitiesByUUID = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __76__SHSheetActivitiesManager_initWithSessionIdentifier_applicationActivities___block_invoke;
    v26 = &unk_1E4002AA8;
    v16 = v8;
    v27 = v16;
    v28 = v15;
    v17 = v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v23);
    v18 = objc_msgSend(v17, "copy", v23, v24, v25, v26);
    applicationActivityTypes = v16->_applicationActivityTypes;
    v16->_applicationActivityTypes = (NSArray *)v18;

    v20 = objc_msgSend(v7, "copy");
    applicationActivities = v16->_applicationActivities;
    v16->_applicationActivities = (NSArray *)v20;

  }
  return v8;
}

void __76__SHSheetActivitiesManager_initWithSessionIdentifier_applicationActivities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "setIndexInApplicationDefinedActivities:", a3);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(v10, "activityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v6);

  objc_msgSend(v10, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v10, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (id)activitiesByUUID
{
  void *v2;
  void *v3;

  -[SHSheetActivitiesManager internalActivitiesByUUID](self, "internalActivitiesByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSArray)orderedActivities
{
  void *v2;
  void *v3;

  -[SHSheetActivitiesManager currentResults](self, "currentResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)hiddenActivities
{
  if (self->_hiddenActivities)
    return self->_hiddenActivities;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)excludedActivityTypes
{
  void *v2;
  void *v3;

  -[SHSheetActivitiesManager currentResults](self, "currentResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "excludedActivityTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)updateActivitiesWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *hiddenActivities;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Update activities with context:%@", (uint8_t *)&v12, 0xCu);
  }

  -[SHSheetActivitiesManager activityHelper](self, "activityHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedAvailableActivitiesForMatchingContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "orderedActivities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivitiesManager _addActivities:](self, "_addActivities:", v8);

  objc_msgSend(v7, "hiddenActivities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivitiesManager _addActivities:](self, "_addActivities:", v9);

  objc_msgSend(v7, "hiddenActivities");
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hiddenActivities = self->_hiddenActivities;
  self->_hiddenActivities = v10;

  -[SHSheetActivitiesManager setCurrentContext:](self, "setCurrentContext:", v4);
  -[SHSheetActivitiesManager setCurrentResults:](self, "setCurrentResults:", v7);

}

- (id)activityForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHSheetActivitiesManager internalActivitiesByUUID](self, "internalActivitiesByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityForActivityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SHSheetActivitiesManager internalActivitiesByUUID](self, "internalActivitiesByUUID", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "activityType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_addActivities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Add activities:%@", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[SHSheetActivitiesManager internalActivitiesByUUID](self, "internalActivitiesByUUID", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "activityUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)addActivity:(id)a3
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

  -[SHSheetActivitiesManager _addActivities:](self, "_addActivities:", v6, v7, v8);
}

- (void)removeActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SHSheetActivitiesManager internalActivitiesByUUID](self, "internalActivitiesByUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)preheatActivitiesIfNeeded
{
  NSObject *v2;
  uint8_t v3[16];

  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "Preheating activities", v3, 2u);
  }

  +[UIMessageActivity _preheatAsyncIfNeeded](UIMessageActivity, "_preheatAsyncIfNeeded");
}

- (BOOL)activityHelper:(id)a3 matchingWithContext:(id)a4 shouldIncludeSystemActivityType:(id)a5 sessionID:(id)a6
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v7 = a5;
  -[SHSheetActivitiesManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SHSheetActivitiesManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "activitiesManager:shouldShowSystemActivityType:", self, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setHiddenActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (SHSheetActivitiesManagerDelegate)delegate
{
  return (SHSheetActivitiesManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOrderedActivities:(id)a3
{
  objc_storeStrong((id *)&self->_orderedActivities, a3);
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, a3);
}

- (_UIActivityHelper)activityHelper
{
  return self->_activityHelper;
}

- (void)setActivityHelper:(id)a3
{
  objc_storeStrong((id *)&self->_activityHelper, a3);
}

- (NSMutableDictionary)internalActivitiesByUUID
{
  return self->_internalActivitiesByUUID;
}

- (void)setInternalActivitiesByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_internalActivitiesByUUID, a3);
}

- (_UIActivityMatchingContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (_UIActivityMatchingResults)currentResults
{
  return self->_currentResults;
}

- (void)setCurrentResults:(id)a3
{
  objc_storeStrong((id *)&self->_currentResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_internalActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_activityHelper, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_orderedActivities, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hiddenActivities, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
