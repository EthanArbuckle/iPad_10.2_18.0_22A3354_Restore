@implementation WFVariableAvailability

- (WFVariableAvailability)initWithWorkflow:(id)a3
{
  id v4;
  WFVariableAvailability *v5;
  WFVariableAvailability *v6;
  uint64_t v7;
  NSCache *cachedContentClassesForVariableNameAtIndex;
  NSObject *v9;
  objc_class *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  WFVariableAvailability *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFVariableAvailability;
  v5 = -[WFVariableAvailability init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_workflow, v4);
    v7 = objc_opt_new();
    cachedContentClassesForVariableNameAtIndex = v6->_cachedContentClassesForVariableNameAtIndex;
    v6->_cachedContentClassesForVariableNameAtIndex = (NSCache *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v12;

    v14 = v6;
  }

  return v6;
}

- (void)populateCache
{
  NSMapTable *v3;
  NSMapTable *variableScopeLevelsByGroupingIdentifier;
  NSMapTable *v5;
  NSMapTable *providingActionsByVariableName;
  NSMapTable *v7;
  NSMapTable *variableScopeEndActionsByStartAction;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  self->_variableScopeLevelsByGroupingIdentifier = v3;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  providingActionsByVariableName = self->_providingActionsByVariableName;
  self->_providingActionsByVariableName = v5;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  self->_variableScopeEndActionsByStartAction = v7;

  -[WFVariableAvailability workflow](self, "workflow");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = WFWorkflowGetAvailableVariableNamesAndDetails(v11, objc_msgSend(v9, "count") - 1, 0, self->_variableScopeLevelsByGroupingIdentifier, self->_variableScopeEndActionsByStartAction, self->_providingActionsByVariableName);

}

- (NSMapTable)providingActionsByVariableName
{
  NSMapTable *providingActionsByVariableName;

  providingActionsByVariableName = self->_providingActionsByVariableName;
  if (!providingActionsByVariableName)
  {
    -[WFVariableAvailability populateCache](self, "populateCache");
    providingActionsByVariableName = self->_providingActionsByVariableName;
  }
  return providingActionsByVariableName;
}

- (NSMapTable)variableScopeLevelsByGroupingIdentifier
{
  NSMapTable *variableScopeLevelsByGroupingIdentifier;

  variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  if (!variableScopeLevelsByGroupingIdentifier)
  {
    -[WFVariableAvailability populateCache](self, "populateCache");
    variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  }
  return variableScopeLevelsByGroupingIdentifier;
}

- (NSMapTable)variableScopeEndActionsByStartAction
{
  NSMapTable *variableScopeEndActionsByStartAction;

  variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  if (!variableScopeEndActionsByStartAction)
  {
    -[WFVariableAvailability populateCache](self, "populateCache");
    variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  }
  return variableScopeEndActionsByStartAction;
}

- (void)invalidateCache
{
  NSMapTable *variableScopeLevelsByGroupingIdentifier;
  NSMapTable *providingActionsByVariableName;
  NSMapTable *variableScopeEndActionsByStartAction;

  variableScopeLevelsByGroupingIdentifier = self->_variableScopeLevelsByGroupingIdentifier;
  self->_variableScopeLevelsByGroupingIdentifier = 0;

  providingActionsByVariableName = self->_providingActionsByVariableName;
  self->_providingActionsByVariableName = 0;

  variableScopeEndActionsByStartAction = self->_variableScopeEndActionsByStartAction;
  self->_variableScopeEndActionsByStartAction = 0;

  -[WFVariableAvailability invalidateActionsUsingShortcutInputVariableCache](self, "invalidateActionsUsingShortcutInputVariableCache");
  -[WFVariableAvailability invalidateActionOutputProviderCache](self, "invalidateActionOutputProviderCache");
  -[WFVariableAvailability invalidateContentClassCache](self, "invalidateContentClassCache");
}

- (id)availableVariableNamesExcludingThoseProvidedByAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFVariableAvailability providingActionsByVariableName](self, "providingActionsByVariableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v4
          || objc_msgSend(v12, "count") != 1
          || (objc_msgSend(v13, "anyObject"), v14 = (id)objc_claimAutoreleasedReturnValue(),
                                              v14,
                                              v14 != v4))
        {
          objc_msgSend(v5, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)availableVariableNamesAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  WFWorkflowGetAvailableVariableNamesAndDetails(WeakRetained, a3, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)areVariablesAvailableAtIndex:(unint64_t)a3
{
  return -[WFVariableAvailability isVariableAvailableAtIndex:withActionTest:](self, "isVariableAvailableAtIndex:withActionTest:", a3, &__block_literal_global_35761);
}

- (BOOL)isVariableWithName:(id)a3 availableAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  -[WFVariableAvailability providingActionsByVariableName](self, "providingActionsByVariableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__WFVariableAvailability_isVariableWithName_availableAtIndex___block_invoke;
    v11[3] = &unk_1E7AF2200;
    v12 = v8;
    v9 = -[WFVariableAvailability isVariableAvailableAtIndex:withActionTest:](self, "isVariableAvailableAtIndex:withActionTest:", a4, v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isVariableAvailableAtIndex:(unint64_t)a3 withActionTest:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__WFVariableAvailability_isVariableAvailableAtIndex_withActionTest___block_invoke;
  v9[3] = &unk_1E7AF2228;
  v11 = &v12;
  v7 = v6;
  v10 = v7;
  -[WFVariableAvailability enumerateActionsInScopeAtIndex:usingBlock:](self, "enumerateActionsInScopeAtIndex:usingBlock:", a3, v9);
  LOBYTE(a3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

- (void)enumerateActionsInScopeAtIndex:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD v14[4];

  v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  objc_msgSend(WeakRetained, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__WFVariableAvailability_enumerateActionsInScopeAtIndex_usingBlock___block_invoke;
  v10[3] = &unk_1E7AF2250;
  v12 = v14;
  v13 = a3;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(v14, 8);
}

- (BOOL)areActionOutputVariablesAvailableAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  -[WFVariableAvailability workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("is.workflow.actions.getvariable"), CFSTR("is.workflow.actions.setvariable"), CFSTR("is.workflow.actions.appendvariable"), 0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__WFVariableAvailability_areActionOutputVariablesAvailableAtIndex___block_invoke;
  v11[3] = &unk_1E7AF2278;
  v9 = v8;
  v12 = v9;
  v13 = &v14;
  -[WFVariableAvailability enumerateActionsInScopeAtIndex:usingBlock:](self, "enumerateActionsInScopeAtIndex:usingBlock:", a3, v11);
  v7 = *((_BYTE *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)availableOutputActionsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("is.workflow.actions.getvariable"), CFSTR("is.workflow.actions.setvariable"), CFSTR("is.workflow.actions.appendvariable"), 0);
  v6 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__WFVariableAvailability_availableOutputActionsAtIndex___block_invoke;
  v12[3] = &unk_1E7AF22A0;
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  -[WFVariableAvailability enumerateActionsInScopeAtIndex:usingBlock:](self, "enumerateActionsInScopeAtIndex:usingBlock:", a3, v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (NSMapTable)actionOutputVariableActionsByUUID
{
  NSMapTable *actionOutputVariableActionsByUUID;
  NSObject *queue;
  _QWORD block[5];

  actionOutputVariableActionsByUUID = self->_actionOutputVariableActionsByUUID;
  if (!actionOutputVariableActionsByUUID)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WFVariableAvailability_actionOutputVariableActionsByUUID__block_invoke;
    block[3] = &unk_1E7AF94B0;
    block[4] = self;
    dispatch_sync(queue, block);
    actionOutputVariableActionsByUUID = self->_actionOutputVariableActionsByUUID;
  }
  return actionOutputVariableActionsByUUID;
}

- (void)populateActionOutputVariableActionsByUUID
{
  NSMapTable *v3;
  NSMapTable *actionOutputVariableActionsByUUID;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  WFVariableAvailability *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  WFVariableAvailability *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_actionOutputVariableActionsByUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    actionOutputVariableActionsByUUID = self->_actionOutputVariableActionsByUUID;
    self->_actionOutputVariableActionsByUUID = v3;

    v28 = self;
    WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
    objc_msgSend(WeakRetained, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v12, "containedVariables", v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v35 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v18, "outputUUID");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v19);

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v15);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v9);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = obj;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    v22 = v28;
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
          objc_msgSend(v26, "UUID", v28);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "containsObject:", v27))
            -[NSMapTable setObject:forKey:](v22->_actionOutputVariableActionsByUUID, "setObject:forKey:", v26, v27);

        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v23);
    }

  }
}

- (BOOL)isVariableWithOutputUUIDAvailable:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__WFVariableAvailability_isVariableWithOutputUUIDAvailable_atIndex___block_invoke;
  v9[3] = &unk_1E7AF2200;
  v10 = v6;
  v7 = v6;
  LOBYTE(a4) = -[WFVariableAvailability isVariableAvailableAtIndex:withActionTest:](self, "isVariableAvailableAtIndex:withActionTest:", a4, v9);

  return a4;
}

- (id)actionProvidingVariableWithOutputUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__35748;
  v16 = __Block_byref_object_dispose__35749;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WFVariableAvailability_actionProvidingVariableWithOutputUUID___block_invoke;
  block[3] = &unk_1E7AF8A80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)invalidateActionOutputProviderCache
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WFVariableAvailability_invalidateActionOutputProviderCache__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isShortcutInputVariableUsed
{
  void *v2;
  BOOL v3;

  -[WFVariableAvailability actionsUsingShortcutInputVariable](self, "actionsUsingShortcutInputVariable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)updateShortcutInputVariableUsageForChangeInAction:(id)a3 removed:(BOOL)a4
{
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableAvailability.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  -[WFVariableAvailability actionsUsingShortcutInputVariable](self, "actionsUsingShortcutInputVariable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WFVariableAvailability_updateShortcutInputVariableUsageForChangeInAction_removed___block_invoke;
  block[3] = &unk_1E7AF22C8;
  v16 = a4;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v12 = v7;
  dispatch_sync(queue, block);

}

- (NSHashTable)actionsUsingShortcutInputVariable
{
  NSHashTable *actionsUsingShortcutInputVariable;
  NSObject *queue;
  _QWORD block[5];

  actionsUsingShortcutInputVariable = self->_actionsUsingShortcutInputVariable;
  if (!actionsUsingShortcutInputVariable)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WFVariableAvailability_actionsUsingShortcutInputVariable__block_invoke;
    block[3] = &unk_1E7AF94B0;
    block[4] = self;
    dispatch_sync(queue, block);
    actionsUsingShortcutInputVariable = self->_actionsUsingShortcutInputVariable;
  }
  return actionsUsingShortcutInputVariable;
}

- (void)populateActionsUsingShortcutInputVariableCache
{
  NSHashTable *v3;
  NSHashTable *actionsUsingShortcutInputVariable;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_actionsUsingShortcutInputVariable)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    actionsUsingShortcutInputVariable = self->_actionsUsingShortcutInputVariable;
    self->_actionsUsingShortcutInputVariable = v3;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[WFVariableAvailability workflow](self, "workflow", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (WFActionUsesInputVariable(v11))
            -[NSHashTable addObject:](self->_actionsUsingShortcutInputVariable, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)invalidateActionsUsingShortcutInputVariableCache
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WFVariableAvailability_invalidateActionsUsingShortcutInputVariableCache__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)actionsProvidingVariableName:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  -[WFVariableAvailability providingActionsByVariableName](self, "providingActionsByVariableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
    objc_msgSend(WeakRetained, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") - 1 == a4)
    {
      objc_msgSend(v8, "allObjects");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)objc_opt_new();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__WFVariableAvailability_actionsProvidingVariableName_atIndex___block_invoke;
      v16[3] = &unk_1E7AF22A0;
      v17 = v8;
      v13 = v12;
      v18 = v13;
      -[WFVariableAvailability enumerateActionsInScopeAtIndex:usingBlock:](self, "enumerateActionsInScopeAtIndex:usingBlock:", a4, v16);
      v14 = v18;
      v11 = v13;

    }
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

- (id)_possibleContentClassesForVariableNamed:(id)a3 atIndex:(unint64_t)a4 context:(id)a5 excludingAction:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  void *WeakRetained;
  void *v21;
  WFVariableAvailability *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v25 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self;
  v24 = v10;
  -[WFVariableAvailability actionsProvidingVariableName:atIndex:](self, "actionsProvidingVariableName:atIndex:", v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v18 != v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "groupingIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "indexVariableNameWithScopeLevel:", -[WFVariableAvailability variableScopeLevelForGroupingIdentifier:](v23, "variableScopeLevelForGroupingIdentifier:", v19));
            WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v24, "isEqualToString:", WeakRetained) & 1) != 0)
            {
              objc_msgSend(v12, "addObject:", objc_opt_class());
LABEL_12:

              continue;
            }

          }
          WeakRetained = objc_loadWeakRetained((id *)&v23->_workflow);
          objc_msgSend(v18, "inheritedOutputContentClassesInWorkflow:context:", WeakRetained, v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObjectsFromArray:", v21);

          goto LABEL_12;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)possibleContentClassesForVariableNamed:(id)a3 atIndex:(unint64_t)a4 context:(id)a5 excludingAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  if (a6)
  {
    -[WFVariableAvailability _possibleContentClassesForVariableNamed:atIndex:context:excludingAction:](self, "_possibleContentClassesForVariableNamed:atIndex:context:excludingAction:", v10, a4, v11, a6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-!-%lu"), v10, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](self->_cachedContentClassesForVariableNameAtIndex, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v12 = v14;
    }
    else
    {
      -[WFVariableAvailability _possibleContentClassesForVariableNamed:atIndex:context:excludingAction:](self, "_possibleContentClassesForVariableNamed:atIndex:context:excludingAction:", v10, a4, v11, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](self->_cachedContentClassesForVariableNameAtIndex, "setObject:forKey:", v12, v13);
    }

  }
  return v12;
}

- (unint64_t)variableScopeLevelForGroupingIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[WFVariableAvailability variableScopeLevelsByGroupingIdentifier](self, "variableScopeLevelsByGroupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (NSHashTable)variableObservers
{
  NSHashTable *variableObservers;
  NSHashTable *v4;
  NSHashTable *v5;

  variableObservers = self->_variableObservers;
  if (!variableObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_variableObservers;
    self->_variableObservers = v4;

    variableObservers = self->_variableObservers;
  }
  return variableObservers;
}

- (void)addVariableObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFVariableAvailability variableObservers](self, "variableObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeVariableObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFVariableAvailability variableObservers](self, "variableObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)notifyVariablesChanged
{
  void *v2;
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
  -[WFVariableAvailability variableObservers](self, "variableObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "availableVariablesDidChange");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)notifyContentClassesChanged
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WFVariableAvailability variableObservers](self, "variableObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "variableContentClassesDidChange");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)actionDidChange:(id)a3 moved:(BOOL)a4 removed:(BOOL)a5
{
  uint64_t v5;
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  char isKindOfClass;
  _UNKNOWN **v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  _BOOL4 v43;
  unsigned int v44;
  WFVariableAvailability *v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v5 = a5;
  v6 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v52 = (void *)objc_opt_new();
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v8, "providedVariableNames");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AA60];
  v13 = (void *)objc_msgSend(v9, "initWithArray:", v12);

  objc_msgSend(v8, "UUID");
  v14 = objc_claimAutoreleasedReturnValue();
  v53 = v13;
  v51 = (void *)v14;
  if (objc_msgSend(v13, "count"))
    v15 = 0;
  else
    v15 = v14 == 0;
  if (!v15)
  {
    v43 = v6;
    v44 = v5;
    v45 = self;
    v46 = v8;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    -[WFVariableAvailability workflow](self, "workflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v17;
    v49 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (!v49)
      goto LABEL_33;
    v48 = *(_QWORD *)v68;
    v18 = &off_1E7AC3000;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v68 != v48)
          objc_enumerationMutation(obj);
        v50 = v19;
        v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v20, "containedVariables");
        v54 = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v64 != v23)
                objc_enumerationMutation(v54);
              v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v25, "name");
                v5 = objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v53, "containsObject:", v5))
                {

LABEL_28:
                  objc_msgSend(v52, "addObject:", v25);
                  continue;
                }
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = v18;
                objc_msgSend(v25, "outputUUID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v51, "isEqualToString:", v28);

                if ((isKindOfClass & 1) == 0)
                {
                  v18 = v27;
                  if (!v29)
                    continue;
                  goto LABEL_28;
                }

                v18 = v27;
                if ((v29 & 1) != 0)
                  goto LABEL_28;
              }
              else if ((isKindOfClass & 1) != 0)
              {

              }
            }
            v22 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          }
          while (v22);
        }

        v19 = v50 + 1;
      }
      while (v50 + 1 != v49);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (!v49)
      {
LABEL_33:

        self = v45;
        v8 = v46;
        v6 = v43;
        v5 = v44;
        break;
      }
    }
  }
  if (v6)
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v8, "containedVariables");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v60 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
          objc_msgSend(v52, "addObject:", v35);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
      }
      while (v32);
    }

  }
  if (objc_msgSend(v52, "count") || objc_msgSend(v53, "count"))
    -[WFVariableAvailability invalidateCache](self, "invalidateCache");
  else
    -[WFVariableAvailability updateShortcutInputVariableUsageForChangeInAction:removed:](self, "updateShortcutInputVariableUsageForChangeInAction:removed:", v8, v5);
  -[WFVariableAvailability actionsDidMove](self, "actionsDidMove");
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v36 = v52;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_msgSend(v41, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "variableProvider:variableWasMoved:", v8, v42);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    }
    while (v38);
  }

}

- (void)renameVariable:(id)a3 to:(id)a4 fromAction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[WFVariableAvailability providingActionsByVariableName](self, "providingActionsByVariableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
    objc_msgSend(v10, "removeObjectForKey:", v17);
  else
    objc_msgSend(v11, "removeObject:", v9);
  objc_msgSend(v10, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    objc_msgSend(v10, "setObject:forKey:", v12, v8);
  }
  objc_msgSend(v12, "addObject:", v9);
  -[WFVariableAvailability workflow](self, "workflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-!-%lu"), v17, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSCache removeObjectForKey:](self->_cachedContentClassesForVariableNameAtIndex, "removeObjectForKey:", v16);
  -[WFVariableAvailability notifyVariablesChanged](self, "notifyVariablesChanged");

}

- (void)invalidateContentClassCache
{
  -[NSCache removeAllObjects](self->_cachedContentClassesForVariableNameAtIndex, "removeAllObjects");
  -[WFVariableAvailability notifyContentClassesChanged](self, "notifyContentClassesChanged");
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (void)setProvidingActionsByVariableName:(id)a3
{
  objc_storeStrong((id *)&self->_providingActionsByVariableName, a3);
}

- (void)setVariableScopeLevelsByGroupingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_variableScopeLevelsByGroupingIdentifier, a3);
}

- (void)setVariableScopeEndActionsByStartAction:(id)a3
{
  objc_storeStrong((id *)&self->_variableScopeEndActionsByStartAction, a3);
}

- (void)setActionOutputVariableActionsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_actionOutputVariableActionsByUUID, a3);
}

- (void)setActionsUsingShortcutInputVariable:(id)a3
{
  objc_storeStrong((id *)&self->_actionsUsingShortcutInputVariable, a3);
}

- (NSCache)cachedContentClassesForVariableNameAtIndex
{
  return self->_cachedContentClassesForVariableNameAtIndex;
}

- (void)setCachedContentClassesForVariableNameAtIndex:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContentClassesForVariableNameAtIndex, a3);
}

- (void)setVariableObservers:(id)a3
{
  objc_storeStrong((id *)&self->_variableObservers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_variableObservers, 0);
  objc_storeStrong((id *)&self->_cachedContentClassesForVariableNameAtIndex, 0);
  objc_storeStrong((id *)&self->_actionsUsingShortcutInputVariable, 0);
  objc_storeStrong((id *)&self->_actionOutputVariableActionsByUUID, 0);
  objc_storeStrong((id *)&self->_variableScopeEndActionsByStartAction, 0);
  objc_storeStrong((id *)&self->_variableScopeLevelsByGroupingIdentifier, 0);
  objc_storeStrong((id *)&self->_providingActionsByVariableName, 0);
  objc_destroyWeak((id *)&self->_workflow);
}

void __63__WFVariableAvailability_actionsProvidingVariableName_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __74__WFVariableAvailability_invalidateActionsUsingShortcutInputVariableCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

uint64_t __59__WFVariableAvailability_actionsUsingShortcutInputVariable__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "populateActionsUsingShortcutInputVariableCache");
}

uint64_t __84__WFVariableAvailability_updateShortcutInputVariableUsageForChangeInAction_removed___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  if (*(_BYTE *)(a1 + 48))
  {
    result = WFActionUsesInputVariable(*(void **)(a1 + 32));
    if (!(_DWORD)result)
      return result;
    return objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(a1 + 32));
  result = WFActionUsesInputVariable(*(void **)(a1 + 32));
  if ((_DWORD)result && (v3 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  if (((result | v3 ^ 1) & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  return result;
}

void __61__WFVariableAvailability_invalidateActionOutputProviderCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __64__WFVariableAvailability_actionProvidingVariableWithOutputUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "populateActionOutputVariableActionsByUUID");
  objc_msgSend(*(id *)(a1 + 32), "actionOutputVariableActionsByUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __68__WFVariableAvailability_isVariableWithOutputUUIDAvailable_atIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __59__WFVariableAvailability_actionOutputVariableActionsByUUID__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "populateActionOutputVariableActionsByUUID");
}

void __56__WFVariableAvailability_availableOutputActionsAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (WFActionHasEligibleOutput(v3, *(void **)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

BOOL __67__WFVariableAvailability_areActionOutputVariablesAvailableAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  result = WFActionHasEligibleOutput(a2, *(void **)(a1 + 32));
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __68__WFVariableAvailability_enumerateActionsInScopeAtIndex_usingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;

  v17 = a2;
  if (*(_QWORD *)(a1 + 56) <= a3 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v7 = objc_msgSend(v17, "mode");
  if (!v7)
  {
    v8 = 1;
    goto LABEL_8;
  }
  if (v7 == 2)
  {
    v8 = -1;
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v8;
  }
LABEL_9:
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 <= a3 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
LABEL_15:
    *a4 = 1;
    goto LABEL_18;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "variableScopeEndActionsByStartAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  v14 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_17:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_18;
  }
  objc_msgSend(v12, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "indexOfObject:", v15);

  if (v9 > a3 && v16 > v9)
    goto LABEL_17;
LABEL_18:

}

uint64_t __68__WFVariableAvailability_isVariableAvailableAtIndex_withActionTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = result;
  return result;
}

uint64_t __62__WFVariableAvailability_isVariableWithName_availableAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

BOOL __55__WFVariableAvailability_areVariablesAvailableAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "providedVariableNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (BOOL)actionIsEligibleForOutputVariable:(id)a3
{
  return WFActionHasEligibleOutput(a3, 0);
}

@end
