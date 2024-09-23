@implementation WFAction

- (id)parameterForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WFAction parametersByKey](self, "parametersByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[WFAction visibleParametersWithProcessing:](self, "visibleParametersWithProcessing:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__WFAction_parameterForKey___block_invoke;
    v9[3] = &unk_1E7AED778;
    v10 = v4;
    objc_msgSend(v7, "if_firstObjectPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSDictionary)parametersByKey
{
  NSDictionary *parametersByKey;

  parametersByKey = self->_parametersByKey;
  if (!parametersByKey)
  {
    -[WFAction initializeParametersWithLock](self, "initializeParametersWithLock");
    parametersByKey = self->_parametersByKey;
  }
  return parametersByKey;
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (NSString)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (WFVariableDataSource)variableSource
{
  return self->_variableSource;
}

- (BOOL)shouldInsertExpandingParameterForParameter:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "allowsMultipleValues"))
    v4 = objc_msgSend(v3, "displaysMultipleValueEditor");
  else
    v4 = 0;

  return v4;
}

- (WFContentAttributionTracker)contentAttributionTracker
{
  WFContentAttributionTracker *contentAttributionTracker;
  WFContentAttributionTracker *v4;
  WFContentAttributionTracker *v5;

  contentAttributionTracker = self->_contentAttributionTracker;
  if (!contentAttributionTracker)
  {
    v4 = objc_alloc_init(WFContentAttributionTracker);
    v5 = self->_contentAttributionTracker;
    self->_contentAttributionTracker = v4;

    contentAttributionTracker = self->_contentAttributionTracker;
  }
  return contentAttributionTracker;
}

id __32__WFAction_initializeParameters__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[WFParameter parameterWithDefinition:](WFParameter, "parameterWithDefinition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "configureParameter:", v4);
    objc_msgSend(v4, "key");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("WFAction.m"), 2175, CFSTR("Multiple parameters of %@ use key %@"), v13, v5);

    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v5);
    objc_msgSend(v4, "addEventObserver:", *(_QWORD *)(a1 + 32));
    v7 = v4;

  }
  else
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFAction initializeParameters]_block_invoke";
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Failed to initialize parameter with definition: %@", buf, 0x16u);
    }

  }
  return v4;
}

- (id)parameterStateForKey:(id)a3
{
  return -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", a3, 1);
}

- (WFAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSString *v13;
  NSString *identifier;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSString *v18;
  objc_class *v19;
  WFAction *v20;
  WFAction *v21;
  NSMutableDictionary *encodedSerializedParameters;
  NSMutableDictionary *v23;
  NSMutableDictionary *cachedDefaultParameterStates;
  NSMutableDictionary *v25;
  NSMutableDictionary *decodedParameterStates;
  NSMutableDictionary *v27;
  NSMutableDictionary *expandingParameters;
  NSHashTable *v29;
  NSHashTable *eventObservers;
  void *v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("ActionClass"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = NSClassFromString(v18);

    if (-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()))
    {
      v20 = (WFAction *)objc_msgSend([v19 alloc], "initWithIdentifier:definition:serializedParameters:", v9, v10, v11);
LABEL_12:
      v21 = v20;
      goto LABEL_13;
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)WFAction;
    self = -[WFAction init](&v33, sel_init);
    if (self)
    {
      v13 = (NSString *)objc_msgSend(v9, "copy");
      identifier = self->_identifier;
      self->_identifier = v13;

      objc_storeStrong((id *)&self->_definition, a4);
      v15 = (void *)objc_msgSend(v11, "mutableCopy");
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = (NSMutableDictionary *)objc_opt_new();
      encodedSerializedParameters = self->_encodedSerializedParameters;
      self->_encodedSerializedParameters = v17;

      v23 = (NSMutableDictionary *)objc_opt_new();
      cachedDefaultParameterStates = self->_cachedDefaultParameterStates;
      self->_cachedDefaultParameterStates = v23;

      v25 = (NSMutableDictionary *)objc_opt_new();
      decodedParameterStates = self->_decodedParameterStates;
      self->_decodedParameterStates = v25;

      v27 = (NSMutableDictionary *)objc_opt_new();
      expandingParameters = self->_expandingParameters;
      self->_expandingParameters = v27;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v29 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      eventObservers = self->_eventObservers;
      self->_eventObservers = v29;

      HIBYTE(self->_parameterStateDeserializationLock._os_unfair_lock_opaque) = 0;
      *(_QWORD *)&self->_didRunRemotely = 0;
      objc_storeStrong((id *)&self->_widgetSizeClass, (id)*MEMORY[0x1E0CBD3D0]);
      self->_observersLock._os_unfair_lock_opaque = 0;
      self->_resourceManagerLock._os_unfair_lock_opaque = 0;
      v20 = self;
      self = v20;
      goto LABEL_12;
    }
  }
  v21 = 0;
LABEL_13:

  return v21;
}

void __61__WFAction_copyParameterStatesWithFallingBackToDefaultValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "parameterStateForKey:fallingBackToDefaultValue:", a2, *(unsigned __int8 *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *a5 = (id)objc_msgSend(v6, "copyWithZone:", MEMORY[0x1C3BB2920]());

}

- (WFContentPermissionRequestor)contentPermissionRequestor
{
  WFContentPermissionRequestor *contentPermissionRequestor;
  WFActionContentPermissionRequestor *v4;
  WFContentPermissionRequestor *v5;

  contentPermissionRequestor = self->_contentPermissionRequestor;
  if (!contentPermissionRequestor)
  {
    v4 = -[WFActionContentPermissionRequestor initWithAction:]([WFActionContentPermissionRequestor alloc], "initWithAction:", self);
    v5 = self->_contentPermissionRequestor;
    self->_contentPermissionRequestor = (WFContentPermissionRequestor *)v4;

    contentPermissionRequestor = self->_contentPermissionRequestor;
  }
  return contentPermissionRequestor;
}

- (void)initializeParametersWithLock
{
  os_unfair_lock_s *p_parameterInitializationLock;

  p_parameterInitializationLock = &self->_parameterInitializationLock;
  os_unfair_lock_lock(&self->_parameterInitializationLock);
  -[WFAction initializeParameters](self, "initializeParameters");
  os_unfair_lock_unlock(p_parameterInitializationLock);
}

- (void)setSupplementalParameterValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[WFAction encodedSerializedParameters](self, "encodedSerializedParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, v7);
  else
    objc_msgSend(v8, "removeObjectForKey:", v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__WFAction_setSupplementalParameterValue_forKey___block_invoke;
  v11[3] = &unk_1E7AEC850;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[WFAction enumerateObservers:](self, "enumerateObservers:", v11);

}

- (id)serializedParameters
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  -[WFAction encodedSerializedParameters](self, "encodedSerializedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFAction decodedParameterStates](self, "decodedParameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__WFAction_serializedParameters__block_invoke;
  v10[3] = &unk_1E7AEC828;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  _BOOL4 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFAction parameterForKey:](self, "parameterForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v10 = 0;
    goto LABEL_26;
  }
  os_unfair_lock_lock(&self->_parameterStateDeserializationLock);
  -[WFAction decodedParameterStates](self, "decodedParameterStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    os_unfair_lock_unlock(&self->_parameterStateDeserializationLock);
  }
  else
  {
    objc_msgSend(v7, "keyForSerialization");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v7, "legacyKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v11, v13, 0);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v14;
    v9 = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v25 = v11;
      v26 = v4;
      v16 = *(_QWORD *)v28;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v15);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
        -[WFAction encodedSerializedParameters](self, "encodedSerializedParameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          break;
        if (v9 == (void *)++v17)
        {
          v9 = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v9)
            goto LABEL_7;
          v21 = v15;
          v4 = v26;
          v11 = v25;
          goto LABEL_17;
        }
      }
      -[WFAction createStateForParameter:fromSerializedRepresentation:](self, "createStateForParameter:fromSerializedRepresentation:", v7, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[WFAction decodedParameterStates](self, "decodedParameterStates");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v9, v6);

        -[WFAction encodedSerializedParameters](self, "encodedSerializedParameters");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v25;
        objc_msgSend(v21, "removeObjectForKey:", v25);
        v4 = v26;
        goto LABEL_17;
      }
      v4 = v26;
      v11 = v25;
    }
    else
    {
      v21 = v15;
LABEL_17:

    }
    os_unfair_lock_unlock(&self->_parameterStateDeserializationLock);
    if (!v9)
      goto LABEL_22;
  }
  if ((objc_msgSend(v7, "parameterStateIsValid:", v9) & 1) == 0)
  {

    v9 = 0;
  }
LABEL_22:
  if (v4 && !v9)
  {
    -[WFAction defaultParameterStateForKey:](self, "defaultParameterStateForKey:", v6);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v9;
  }
  v10 = v23;

LABEL_26:
  return v10;
}

- (id)defaultParameterStateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[WFAction cachedDefaultParameterStates](self, "cachedDefaultParameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[WFAction parameterForKey:](self, "parameterForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultSerializedRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[WFAction createStateForParameter:fromSerializedRepresentation:](self, "createStateForParameter:fromSerializedRepresentation:", v7, v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[WFAction cachedDefaultParameterStates](self, "cachedDefaultParameterStates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v6, v4);

      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (NSMutableDictionary)cachedDefaultParameterStates
{
  return self->_cachedDefaultParameterStates;
}

- (void)enumerateObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  os_unfair_lock_s *p_observersLock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[WFAction eventObservers](self, "eventObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (NSHashTable)eventObservers
{
  return self->_eventObservers;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedNameWithContext:](self, "localizedNameWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)parameterDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Parameters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSDictionary)inputDictionary
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Input"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (WFActionDefinition)definition
{
  return self->_definition;
}

- (void)processParametersWithoutAskingForValuesWithInput:(id)a3 workQueue:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = -[WFAction copyParameterStatesWithFallingBackToDefaultValue:](self, "copyParameterStatesWithFallingBackToDefaultValue:", v6);
  -[WFAction processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:](self, "processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:", v13, v12, -[WFAction skipsProcessingHiddenParameters](self, "skipsProcessingHiddenParameters"), 0, v11, v10);

}

- (BOOL)skipsProcessingHiddenParameters
{
  return self->_skipsProcessingHiddenParameters;
}

- (void)processParameterStates:(id)a3 withInput:(id)a4 skippingHiddenParameters:(BOOL)a5 askForValuesIfNecessary:(BOOL)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  WFAction *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v10 = a6;
  v11 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = a7;
  getWFWorkflowExecutionLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "-[WFAction processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:]";
    v25 = 2114;
    v26 = self;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s Action %{public}@ started processing parameter states: %@, input: %@", buf, 0x2Au);
  }

  v19 = (void *)objc_msgSend(v14, "mutableCopy");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __122__WFAction_processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke;
  v21[3] = &unk_1E7AECA18;
  v21[4] = self;
  v22 = v16;
  v20 = v16;
  -[WFAction _processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:](self, "_processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:", v19, v15, v11, v10, v17, v21);

}

- (id)copyParameterStatesWithFallingBackToDefaultValue:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[WFAction parametersByKey](self, "parametersByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__WFAction_copyParameterStatesWithFallingBackToDefaultValue___block_invoke;
  v8[3] = &unk_1E7AEC9F0;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "if_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "count") && *(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 48), "runningDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "runningDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v8 = *(id *)(a1 + 32);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v64;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v64 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 48), "runningDelegate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v13) = objc_msgSend(v14, "action:canProvideInputForParameter:", *(_QWORD *)(a1 + 48), v13);

              if ((v13 & 1) == 0)
              {
                v34 = *(_QWORD *)(a1 + 80);
                v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
                objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v34 + 16))(v34, 0, v35, v36);

                goto LABEL_44;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      objc_msgSend(*(id *)(a1 + 48), "parameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
      v17 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_6;
      v61[3] = &unk_1E7AECAB8;
      v18 = v15;
      v62 = v18;
      objc_msgSend(v16, "sortUsingComparator:", v61);
      if (objc_msgSend(*(id *)(a1 + 48), "requiresRemoteExecution"))
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v19 = *(id *)(a1 + 32);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
        v48 = v18;
        v49 = v4;
        if (v20)
        {
          v21 = v20;
          v22 = 0;
          v23 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v58 != v23)
                objc_enumerationMutation(v19);
              v25 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
              v26 = (void *)objc_opt_class();
              if (objc_msgSend(v26, "isSubclassOfClass:", objc_opt_class()))
              {
                v27 = objc_opt_class();
                if (v27 != objc_opt_class())
                {
                  objc_msgSend(*(id *)(a1 + 48), "ignoredParameterKeysForProcessing");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = (void *)objc_msgSend(v28, "mutableCopy");

                  objc_msgSend(v25, "key");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "addObject:", v30);

                  objc_msgSend(*(id *)(a1 + 48), "setIgnoredParameterKeysForProcessing:", v29);
                  if (!v22)
                    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v22, "addObject:", v25, v48);

                }
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
          }
          while (v21);
        }
        else
        {
          v22 = 0;
        }

        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v37 = v22;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        v4 = v49;
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v54;
          do
          {
            for (k = 0; k != v39; ++k)
            {
              if (*(_QWORD *)v54 != v40)
                objc_enumerationMutation(v37);
              objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k), v48);
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
          }
          while (v39);
        }

        v18 = v48;
        v17 = MEMORY[0x1E0C809B0];
      }
      if (objc_msgSend(*(id *)(a1 + 32), "count", v48))
      {
        v42 = *(void **)(a1 + 48);
        v43 = *(_QWORD *)(a1 + 56);
        v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        v45 = *(_QWORD *)(a1 + 64);
        v46 = *(_QWORD *)(a1 + 72);
        v50[0] = v17;
        v50[1] = 3221225472;
        v50[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_7;
        v50[3] = &unk_1E7AF5D68;
        v47 = *(_QWORD *)(a1 + 32);
        v51 = *(id *)(a1 + 40);
        v52 = *(id *)(a1 + 80);
        objc_msgSend(v42, "askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:", v47, v43, v45, v44, v46, v50);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      }

    }
    else
    {
      v31 = *(_QWORD *)(a1 + 80);
      v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v31 + 16))(v31, 0, v32, v33);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
LABEL_44:

}

void __122__WFAction_processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "populatesInputFromInputParameter"))
    {
      objc_msgSend(*(id *)(a1 + 32), "populatedInputWithProcessedParameterValues:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  getWFWorkflowExecutionLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 136315650;
    v13 = "-[WFAction processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:complet"
          "ionHandler:]_block_invoke";
    v14 = 2114;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Action %{public}@ finished processing parameter states. Values: %@", (uint8_t *)&v12, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_processParameterStates:(id)a3 withInput:(id)a4 skippingHiddenParameters:(BOOL)a5 askForValuesIfNecessary:(BOOL)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t i;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t j;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  WFAction *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t *v68;
  BOOL v69;
  _QWORD v70[4];
  id v71;
  WFAction *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t *v79;
  BOOL v80;
  BOOL v81;
  uint64_t v82;
  id *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;

  v55 = a3;
  v12 = a4;
  v59 = a7;
  v57 = a8;
  v53 = (void *)objc_opt_new();
  v52 = (void *)objc_opt_new();
  v51 = (void *)objc_opt_new();
  -[WFAction processedParameters](self, "processedParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_opt_new();
  v50 = v16;

  v82 = 0;
  v83 = (id *)&v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__7848;
  v86 = __Block_byref_object_dispose__7849;
  v87 = 0;
  -[WFAction inputParameter](self, "inputParameter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[WFAction populatesInputFromInputParameter](self, "populatesInputFromInputParameter");
  if (v12)
    objc_storeStrong(v83 + 5, a4);
  -[WFAction parameters](self, "parameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction prioritizedParameterKeysForRemoteExecution](self, "prioritizedParameterKeysForRemoteExecution");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  v46 = v12;
  if (v19)
  {
    -[WFAction parameters](self, "parameters", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    for (i = 0; ; ++i)
    {
      -[WFAction prioritizedParameterKeysForRemoteExecution](self, "prioritizedParameterKeysForRemoteExecution");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (i >= v24)
        break;
      -[WFAction prioritizedParameterKeysForRemoteExecution](self, "prioritizedParameterKeysForRemoteExecution");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndex:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      for (j = 0; ; ++j)
      {
        -[WFAction parameters](self, "parameters");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (j >= v29)
          break;
        -[WFAction parameters](self, "parameters");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndex:", j);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "key");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", v26);

        if ((v33 & 1) != 0)
        {
          objc_msgSend(v21, "objectAtIndex:", j);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "removeObjectAtIndex:", j);
          objc_msgSend(v21, "insertObject:atIndex:", v34, i);

          break;
        }

      }
      v35 = v21;

      v17 = v35;
    }

  }
  -[WFAction visibleParametersWithProcessing:](self, "visibleParametersWithProcessing:", 1, v46);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = MEMORY[0x1E0C809B0];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke;
  v70[3] = &unk_1E7AECA90;
  v38 = v36;
  v80 = a5;
  v71 = v38;
  v72 = self;
  v73 = v53;
  v74 = v52;
  v75 = v51;
  v76 = v50;
  v56 = v55;
  v77 = v56;
  v39 = v49;
  v81 = v48;
  v78 = v39;
  v79 = &v82;
  v60[0] = v37;
  v60[1] = 3221225472;
  v60[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_5;
  v60[3] = &unk_1E7AECAE0;
  v40 = v73;
  v61 = v40;
  v69 = a6;
  v41 = v57;
  v67 = v41;
  v42 = v76;
  v68 = &v82;
  v62 = v42;
  v63 = self;
  v43 = v74;
  v64 = v43;
  v44 = v75;
  v65 = v44;
  v45 = v59;
  v66 = v45;
  objc_msgSend(v17, "if_enumerateAsynchronouslyInSequenceOnQueue:block:completionHandler:", v45, v70, v60);

  _Block_object_dispose(&v82, 8);
}

- (NSArray)parameters
{
  NSArray *parameters;

  parameters = self->_parameters;
  if (!parameters)
  {
    -[WFAction initializeParametersWithLock](self, "initializeParametersWithLock");
    parameters = self->_parameters;
  }
  return parameters;
}

- (void)initializeParameters
{
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSArray *v17;
  NSArray *parameters;
  NSDictionary *v19;
  NSDictionary *parametersByKey;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  SEL v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_parameterInitializationLock);
  if (!self->_parameters)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);

    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      -[WFAction identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v8;
      v38 = 2112;
      v39 = v10;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "InitializeActionParameters", "identifier=%{signpost.description:attribute}@,class=%{signpost.description:attribute}@", buf, 0x16u);

    }
    -[WFAction parameterDefinitions](self, "parameterDefinitions");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;

    v15 = (void *)objc_opt_new();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __32__WFAction_initializeParameters__block_invoke;
    v32[3] = &unk_1E7AECD08;
    v32[4] = self;
    v16 = v15;
    v33 = v16;
    v34 = a2;
    objc_msgSend(v14, "if_compactMap:", v32);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    parameters = self->_parameters;
    self->_parameters = v17;

    v19 = (NSDictionary *)objc_msgSend(v16, "copy");
    parametersByKey = self->_parametersByKey;
    self->_parametersByKey = v19;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = self->_parameters;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          -[WFAction configureResourcesForParameter:](self, "configureResourcesForParameter:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v23);
    }

    getWFGeneralLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v27, OS_SIGNPOST_INTERVAL_END, v5, "InitializeActionParameters", ", buf, 2u);
    }

  }
}

- (WFParameter)inputParameter
{
  void *v3;
  void *v4;
  void *v5;

  -[WFAction inputParameterKey](self, "inputParameterKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFAction parametersByKey](self, "parametersByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (WFParameter *)v5;
}

- (NSString)inputParameterKey
{
  void *v2;
  void *v3;

  -[WFAction inputDictionary](self, "inputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ParameterKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)configureResourcesForParameter:(id)a3
{
  id v4;

  objc_msgSend(a3, "resourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WFConfigureParameterRelationResources(v4, self);

}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (id)prioritizedParameterKeysForRemoteExecution
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_extendedOperation, 0);
  objc_storeStrong((id *)&self->_allowedOnceSmartPromptStates, 0);
  objc_storeStrong((id *)&self->_widgetSizeClass, 0);
  objc_storeStrong((id *)&self->_appResource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_runningDelegate, 0);
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_destroyWeak((id *)&self->_workflow);
  objc_storeStrong((id *)&self->_effectiveWorkQueue, 0);
  objc_storeStrong((id *)&self->_sessionKitAssertion, 0);
  objc_storeStrong((id *)&self->_currentUnevaluatedResourceNodes, 0);
  objc_storeStrong((id *)&self->_currentGeneratedResourceNodes, 0);
  objc_storeStrong((id *)&self->_actionUserInterface, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_ignoredParameterKeysForProcessing, 0);
  objc_storeStrong((id *)&self->_expandingParameters, 0);
  objc_storeStrong((id *)&self->_decodedParameterStates, 0);
  objc_storeStrong((id *)&self->_cachedDefaultParameterStates, 0);
  objc_storeStrong((id *)&self->_encodedSerializedParameters, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_contentPermissionRequestor, 0);
  objc_storeStrong((id *)&self->_variableSource, 0);
  objc_storeStrong((id *)&self->_userInterface, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_toolInvocation, 0);
  objc_storeStrong((id *)&self->_auxiliaryButton, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentAttributionTracker, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_outputContentClasses, 0);
  objc_storeStrong((id *)&self->_inputContentClasses, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_parametersByKey, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  WFParameterStateProcessingContext *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  WFParameterStateProcessingContext *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  WFParameterStateProcessingContext *v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  uint64_t v61;
  char v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD aBlock[5];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  char v74;

  v6 = a2;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  if (!*(_BYTE *)(a1 + 104) || (v9 & 1) != 0)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E7AECA40;
    v74 = v9;
    aBlock[4] = *(_QWORD *)(a1 + 40);
    v11 = v6;
    v68 = v11;
    v69 = *(id *)(a1 + 48);
    v70 = *(id *)(a1 + 56);
    v12 = v8;
    v71 = v12;
    v72 = *(id *)(a1 + 64);
    v13 = v7;
    v73 = v13;
    v14 = _Block_copy(aBlock);
    v63[0] = v10;
    v63[1] = 3221225472;
    v63[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_3;
    v63[3] = &unk_1E7AF6EF8;
    v64 = *(id *)(a1 + 72);
    v15 = v12;
    v65 = v15;
    v56 = v13;
    v66 = v56;
    v16 = _Block_copy(v63);
    objc_msgSend(*(id *)(a1 + 40), "toolInvocation");
    v17 = objc_claimAutoreleasedReturnValue();
    v57 = v15;
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(*(id *)(a1 + 40), "toolInvocation");
      v53 = v6;
      v19 = v8;
      v20 = v7;
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "key");
      v23 = v11;
      v24 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v22, "containsParameterValueForKey:", v25);

      v16 = v24;
      v11 = v23;

      v14 = v21;
      v7 = v20;
      v8 = v19;
      v15 = v57;
      v6 = v53;

      if (v26)
      {
        v27 = *(void **)(a1 + 40);
        objc_msgSend(v27, "toolInvocation");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v11;
        v30 = (void *)v28;
        objc_msgSend(v27, "processValueForParameter:withToolKitInvocation:completionHandler:", v29, v28, v16);
LABEL_27:

        goto LABEL_28;
      }
    }
    v54 = v11;
    objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", v15);
    v31 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v31;
    if (!v31)
    {
LABEL_15:
      (*((void (**)(id, _QWORD))v56 + 2))(v56, 0);
      goto LABEL_27;
    }
    if (*(void **)(a1 + 88) == v54 && *(_BYTE *)(a1 + 105))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
        goto LABEL_15;
      v49 = (void *)v31;
      v50 = v16;
      v51 = v14;
      v52 = v8;
      v47 = 1;
      v35 = 1;
    }
    else
    {
      v32 = v54;
      v51 = v14;
      v52 = v8;
      v49 = v30;
      v50 = v16;
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v33 = v32;
        else
          v33 = 0;
      }
      else
      {
        v33 = 0;
      }
      v34 = v33;

      v47 = objc_msgSend(v34, "processesIntoContentItems");
      v35 = 0;
    }
    v36 = [WFParameterStateProcessingContext alloc];
    objc_msgSend(*(id *)(a1 + 40), "variableSource");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "workflow");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "environment");
    objc_msgSend(*(id *)(a1 + 40), "contentAttributionTracker");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widgetSizeClass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[WFParameterStateProcessingContext initWithVariableSource:parameter:isInputParameter:environment:contentAttributionTracker:widgetSizeClass:](v36, "initWithVariableSource:parameter:isInputParameter:environment:contentAttributionTracker:widgetSizeClass:", v37, v54, v35, v39, v40, v41);

    v14 = v51;
    v8 = v52;
    v30 = v49;
    v16 = v50;
    if (v47)
    {
      v48 = v35;
      v55 = v42;
      objc_msgSend(v49, "containedVariables");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_type);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "filteredArrayForKey:value:", v44, CFSTR("Ask"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v45, "count"))
      {
        v46 = *(void **)(a1 + 40);
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_4;
        v58[3] = &unk_1E7AECA68;
        v62 = v48;
        v61 = *(_QWORD *)(a1 + 96);
        v59 = v56;
        v60 = v50;
        LOBYTE(v46) = objc_msgSend(v46, "getInputContentFromVariablesInParameterState:context:completionHandler:", v49, v55, v58);

        if ((v46 & 1) != 0)
        {
          v42 = v55;
LABEL_26:

          goto LABEL_27;
        }
      }

      v42 = v55;
    }
    objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v57);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      (*((void (**)(id, _QWORD))v56 + 2))(v56, 0);
    else
      objc_msgSend(v49, "processWithContext:userInputRequiredHandler:valueHandler:", v42, v51, v50);
    goto LABEL_26;
  }
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_28:

}

- (void)parameterStateValidityCriteriaDidChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "key");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAction notifyEventObserversParameterStateDidChangeForKey:](self, "notifyEventObserversParameterStateDidChangeForKey:", v4);

}

- (void)notifyEventObserversParameterStateDidChangeForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  -[WFAction eventObservers](self, "eventObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_8038);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_observersLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "action:parameterStateDidChangeForKey:", self, v4, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "stateClass")), "initWithSerializedRepresentation:variableProvider:parameter:", v6, self, v7);

  return v8;
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  WFAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C18B1138((uint64_t)&unk_1EF700C00, (uint64_t)v7);
}

- (id)localizedErrorWithLinkError:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  int v27;
  WFAction *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  uint64_t v90;
  _QWORD v91[2];

  v91[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  WFLocalizedString(CFSTR("There was a problem applying the Focus filter."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction appDescriptor](self, "appDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("There was a problem communicating with the “%@” app."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction appDescriptor](self, "appDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("There was a problem communicating with the app."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D44030]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = v18;

    v5 = v19;
  }
  objc_msgSend(v5, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D44060]);

  if (!v21)
  {
    objc_msgSend(v5, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D440A8]);

    if (v24)
    {
      switch(objc_msgSend(v5, "code"))
      {
        case 2000:
          LNPerformActionErrorCodeAsString();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedDescription");
          v36 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v36, "length"))
            goto LABEL_84;
          objc_msgSend(v5, "localizedDescription");
          v87 = v67;
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "hasPrefix:", v68);

          v67 = v87;
          if (!v70)
            goto LABEL_85;
          objc_msgSend(v5, "localizedDescription");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "substringFromIndex:", objc_msgSend(v68, "length"));
          v36 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v36, "length"))
          {

            goto LABEL_53;
          }
LABEL_84:

LABEL_85:
LABEL_86:
          if ((isKindOfClass & 1) != 0)
          {
LABEL_16:
            v25 = v7;
            goto LABEL_52;
          }
          break;
        case 2001:
        case 2002:
        case 2003:
        case 2004:
        case 2006:
        case 2008:
        case 2011:
        case 2012:
        case 2013:
          if ((isKindOfClass & 1) == 0)
            goto LABEL_22;
          goto LABEL_16;
        case 2005:
          objc_msgSend(v5, "userInfo");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:", *MEMORY[0x1E0D440B0]);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFAction parameterForKey:](self, "parameterForKey:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "localizedLabel");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if ((isKindOfClass & 1) != 0)
          {
            v36 = v7;
          }
          else
          {
            v80 = (void *)MEMORY[0x1E0CB3940];
            WFLocalizedString(CFSTR("The action “%1$@” could not run because a value was not provided for the “%2$@” parameter."));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction localizedName](self, "localizedName");
            v82 = objc_claimAutoreleasedReturnValue();
            v83 = (void *)v82;
            if (v75)
              v84 = v75;
            else
              v84 = v73;
            objc_msgSend(v80, "localizedStringWithFormat:", v81, v82, v84);
            v36 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_53;
        case 2007:
          objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
          v64 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_59;
        case 2009:
        case 2014:
          objc_msgSend(v5, "localizedDescription");
          v25 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_52;
        case 2010:
          v37 = (void *)MEMORY[0x1E0CB3940];
          v38 = CFSTR("The action “%@” could not run because it was cancelled.");
          goto LABEL_23;
        default:
          goto LABEL_86;
      }
LABEL_87:
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = CFSTR("The action “%@” could not run because an unknown error occurred.");
      goto LABEL_23;
    }
    objc_msgSend(v5, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D44070]);

    if (!v27)
      goto LABEL_58;
    v28 = self;
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (objc_msgSend(v5, "code") == 1)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("Unable to load options due to the %@ parameter not being set."));
        v30 = objc_claimAutoreleasedReturnValue();
        -[WFAction metadata](v28, "metadata");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "parameters");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __61__WFAction_LinkLocalizedErrors__localizedErrorWithLinkError___block_invoke;
        v88[3] = &unk_1E7AF5F48;
        v89 = v5;
        objc_msgSend(v85, "if_firstObjectPassingTest:", v88);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "title");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "wf_localizedString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v29;
        v35 = (void *)v30;
        objc_msgSend(v34, "localizedStringWithFormat:", v30, v33);
        v36 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
        goto LABEL_53;
      }
    }
    else
    {

      v28 = 0;
    }
    v36 = 0;
    goto LABEL_32;
  }
  v22 = objc_msgSend(v5, "code");
  if (v22 <= 1099)
  {
    switch(v22)
    {
      case 1001:
      case 1007:
      case 1008:
      case 1009:
      case 1010:
      case 1011:
      case 1012:
      case 1013:
        goto LABEL_11;
      case 1002:
        if ((isKindOfClass & 1) != 0)
          goto LABEL_51;
        v37 = (void *)MEMORY[0x1E0CB3940];
        v38 = CFSTR("The action “%@” was interrupted because it didn't finish executing in time.");
        goto LABEL_23;
      case 1003:
      case 1004:
      case 1005:
        if ((isKindOfClass & 1) != 0)
          goto LABEL_51;
        v43 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("The action “%1$@” could not run because the “%2$@” app quit unexpectedly."));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction localizedName](self, "localizedName");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction appDescriptor](self, "appDescriptor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringWithFormat:", v39, v44, v46);
        v36 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      case 1006:
        v37 = (void *)MEMORY[0x1E0CB3940];
        v38 = CFSTR("The action “%@” could not run because it is not supported on this platform.");
        goto LABEL_23;
      default:
        goto LABEL_50;
    }
  }
  if (v22 > 1399)
  {
    switch(v22)
    {
      case 1400:
        goto LABEL_11;
      case 1700:
        -[WFAction appDescriptor](self, "appDescriptor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "length");

        if (!v49)
        {
          if ((isKindOfClass & 1) != 0)
          {
            WFLocalizedString(CFSTR("Focus filter could not be applied. Open the app to continue."));
            v25 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_52;
          }
          v37 = (void *)MEMORY[0x1E0CB3940];
          v38 = CFSTR("The action “%@” could not run. Open the app to continue.");
          goto LABEL_23;
        }
        v41 = (void *)MEMORY[0x1E0CB3940];
        if ((isKindOfClass & 1) != 0)
        {
          v42 = CFSTR("Focus filter could not be applied. Open %@ to continue.");
          goto LABEL_47;
        }
        v76 = CFSTR("The action “%1$@” could not run. Open %2$@ to continue.");
        break;
      case 2400:
        v41 = (void *)MEMORY[0x1E0CB3940];
        if ((isKindOfClass & 1) != 0)
        {
          v42 = CFSTR("Focus filter could not be applied. %@ is locked.");
LABEL_47:
          WFLocalizedString(v42);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAction appDescriptor](self, "appDescriptor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "localizedName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedStringWithFormat:", v50, v52);
          v53 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v53;
          goto LABEL_58;
        }
        v76 = CFSTR("The action “%1$@” could not run because %2$@ is locked.");
        break;
      default:
        goto LABEL_50;
    }
    WFLocalizedString(v76);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction localizedName](self, "localizedName");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction appDescriptor](self, "appDescriptor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "localizedName");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringWithFormat:", v39, v77, v79);
    v36 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  if (v22 != 1100 && v22 != 1200)
  {
    if (v22 != 1300)
    {
LABEL_50:
      if ((isKindOfClass & 1) != 0)
        goto LABEL_51;
      goto LABEL_87;
    }
LABEL_11:
    if ((isKindOfClass & 1) == 0)
    {
LABEL_22:
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = CFSTR("The action “%@” could not run because an internal error occurred.");
LABEL_23:
      WFLocalizedString(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction localizedName](self, "localizedName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringWithFormat:", v39, v40);
      v36 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if ((isKindOfClass & 1) == 0)
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    v38 = CFSTR("The action “%@” could not run because Shortcuts couldn't communicate with the app.");
    goto LABEL_23;
  }
LABEL_51:
  v25 = v15;
LABEL_52:
  v36 = v25;
LABEL_53:
  if (!v36)
  {
LABEL_58:
    v64 = v5;
LABEL_59:
    v63 = v64;
    v36 = 0;
    goto LABEL_60;
  }
  objc_msgSend(v5, "ln_staticDeferredLocalizedString");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  v56 = (_QWORD *)MEMORY[0x1E0CB2D50];
  if (v54)
  {
    objc_msgSend(v54, "localizedStringForLocaleIdentifier:", 0);
    v57 = v36;
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!VCIsInternalBuild())
      goto LABEL_57;
    objc_msgSend(v5, "userInfo");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKeyedSubscript:", *v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      if ((objc_msgSend(v36, "isEqualToString:", v57) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [Internal Only: %@]"), v36, v57);
        v66 = objc_claimAutoreleasedReturnValue();

        v36 = (id)v66;
      }
    }
  }

LABEL_57:
  objc_msgSend(v5, "userInfo");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *v56;
  v91[0] = v36;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "if_dictionaryByAddingEntriesFromDictionary:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "domain");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "errorWithDomain:code:userInfo:", v62, objc_msgSend(v5, "code"), v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_60:
  return v63;
}

uint64_t __61__WFAction_LinkLocalizedErrors__localizedErrorWithLinkError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D44078]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (NSString)localizedKeyParameterDisplayName
{
  return 0;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction inputParameter](self, "inputParameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction definition](self, "definition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, inputParameter: %@, parameters: %@, definition: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (INAppDescriptor)appDescriptor
{
  void *v3;
  INAppDescriptor *appDescriptor;
  void *v5;
  void *v6;
  INAppDescriptor *v7;
  INAppDescriptor *v8;
  INAppDescriptor *v9;

  -[WFAction appDefinition](self, "appDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    appDescriptor = self->_appDescriptor;
    if (!appDescriptor)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithSerializedRepresentation:", v3);
      objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
      v7 = (INAppDescriptor *)objc_claimAutoreleasedReturnValue();
      v8 = self->_appDescriptor;
      self->_appDescriptor = v7;

      appDescriptor = self->_appDescriptor;
    }
    v9 = appDescriptor;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateAppDescriptorWithSelectedApp:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFAction setAppDescriptor:](self, "setAppDescriptor:", a3);
  -[WFAction setAppResource:](self, "setAppResource:", 0);
  -[WFAction recreateResourcesIfNeeded](self, "recreateResourcesIfNeeded");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WFAction resourceManager](self, "resourceManager", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "refreshAvailabilityWithNotification");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)resolveAppDescriptorIfNecessary:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[WFAction appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requiresUserConfirmation");

  if ((v6 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          -[WFAction userInterface](self, "userInterface"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_opt_respondsToSelector(),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      -[WFAction userInterface](self, "userInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction appDescriptor](self, "appDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __44__WFAction_resolveAppDescriptorIfNecessary___block_invoke;
      v14[3] = &unk_1E7AEC7D8;
      v14[4] = self;
      v15 = v4;
      objc_msgSend(v11, "resolveDescriptor:completionHandler:", v12, v14);

    }
    else
    {
      -[WFAction missingAppError](self, "missingAppError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v13);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)missingAppError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v8[0] = *MEMORY[0x1E0CB2D60];
  WFLocalizedString(CFSTR("Missing App"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("This action requires an app that may not be installed."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 10, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)appResourceRequiresAppInstall
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[WFAction appDefinition](self, "appDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ActionRequiresAppInstallation"));
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

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (WFAppInstalledResource)appResource
{
  void *v3;
  WFAppInstalledResource *appResource;
  WFAppInstalledResource *v5;
  void *v6;
  WFAppInstalledResource *v7;
  WFAppInstalledResource *v8;
  WFAppInstalledResource *v9;

  -[WFAction appDescriptor](self, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    appResource = self->_appResource;
    if (!appResource)
    {
      v5 = [WFAppInstalledResource alloc];
      -[WFAction appDescriptor](self, "appDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WFAppInstalledResource initWithAppDescriptor:requiresAppToBeInstalled:](v5, "initWithAppDescriptor:requiresAppToBeInstalled:", v6, -[WFAction appResourceRequiresAppInstall](self, "appResourceRequiresAppInstall"));
      v8 = self->_appResource;
      self->_appResource = v7;

      -[WFAppInstalledResource setDelegate:](self->_appResource, "setDelegate:", self);
      appResource = self->_appResource;
    }
    v9 = appResource;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)appInstalledResource:(id)a3 didUpdateAppDescriptor:(id)a4
{
  -[WFAction updateAppDescriptorWithSelectedApp:](self, "updateAppDescriptorWithSelectedApp:", a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[WFAction serializedParameters](self, "serializedParameters", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFAction copyWithSerializedParameters:](self, "copyWithSerializedParameters:", v4);

  return v5;
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[WFAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction definition](self, "definition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:definition:serializedParameters:", v6, v7, v4);

  -[WFAction suggestionMetadata](self, "suggestionMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSuggestionMetadata:", v9);

  return v8;
}

- (id)copyWithDefinition:(id)a3 serializedParameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)objc_opt_class());
  -[WFAction identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:definition:serializedParameters:", v9, v7, v6);

  return v10;
}

- (id)copyForProcessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[WFAction copy](self, "copy");
  -[WFAction runningDelegate](self, "runningDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRunningDelegate:", v4);

  -[WFAction variableSource](self, "variableSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVariableSource:", v5);

  -[WFAction toolInvocation](self, "toolInvocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setToolInvocation:", v6);

  if (-[WFAction requiresRemoteExecution](self, "requiresRemoteExecution"))
  {
    -[WFAction parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectsMatchingClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (!v10)
      goto LABEL_36;
    v11 = v10;
    v12 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!v14)
        {
          v19 = 0;
          goto LABEL_34;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        v14 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v14;
        else
          v17 = 0;
        v18 = v17;

        if (v16)
        {
          v19 = v14;
          if (objc_msgSend(v16, "possibleStatesLoadingState") == 3)
          {
            objc_msgSend(v16, "key");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "parameterForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;
            }
            else
            {
              v22 = 0;
            }
            v28 = v22;

            objc_msgSend(v16, "possibleStates");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setPossibleStatesFromRemoteSource:", v29);
            v19 = v14;
            v14 = v18;
            goto LABEL_33;
          }
        }
        else
        {
          v19 = 0;
        }
        if (!v18)
        {
          v14 = 0;
          goto LABEL_34;
        }
        objc_msgSend(v18, "possibleStates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (!v24)
          goto LABEL_34;
        objc_msgSend(v18, "key");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "parameterForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v27 = v26;
          else
            v27 = 0;
        }
        else
        {
          v27 = 0;
        }
        v28 = v27;

        objc_msgSend(v18, "possibleStates");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPossibleStatesFromRemoteSource:", v29);
LABEL_33:

LABEL_34:
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v11)
      {
LABEL_36:

        return v3;
      }
    }
  }
  return v3;
}

- (id)copyForDuplicating
{
  void *v3;
  void *v4;
  id v5;

  -[WFAction serializedParameters](self, "serializedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectForKey:", CFSTR("UUID"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("GroupingIdentifier"));
  v5 = -[WFAction copyWithSerializedParameters:](self, "copyWithSerializedParameters:", v4);

  return v5;
}

- (void)preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[WFAction parameters](self, "parameters");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5, v7 = -[WFAction requiresRemoteExecution](self, "requiresRemoteExecution"),
                         v6,
                         !v7))
  {
    -[WFAction parameters](self, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E7AEC800;
    v11[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E7AEE600;
    v10 = v4;
    objc_msgSend(v8, "if_enumerateAsynchronously:completionHandler:", v11, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)serializedParameterStateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFAction decodedParameterStates](self, "decodedParameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "serializedRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFAction encodedSerializedParameters](self, "encodedSerializedParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char isKindOfClass;
  NSObject *v15;
  WFAction *v16;
  WFAction *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  BOOL v22;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  WFAction *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136316162;
    v26 = "-[WFAction setParameterState:forKey:]";
    v27 = 2114;
    v28 = self;
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v7;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Action: %{public}@ setting parameter state: %{public}@, key:%{public}@, value:%@", (uint8_t *)&v25, 0x34u);

  }
  -[WFAction parameterForKey:](self, "parameterForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction inputParameterKey](self, "inputParameterKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
    -[WFAction lockInputParameter](self, "lockInputParameter");
  if (v11)
  {
    objc_msgSend(v11, "stateClass");
    isKindOfClass = objc_opt_isKindOfClass();
    if (v6 && (isKindOfClass & 1) == 0)
      goto LABEL_8;
LABEL_12:
    -[WFAction decodedParameterStates](self, "decodedParameterStates");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKey:", v6, v7);

    -[WFAction notifyEventObserversParameterStateDidChangeForKey:](self, "notifyEventObserversParameterStateDidChangeForKey:", v7);
    v22 = 1;
    goto LABEL_13;
  }
  if (!v6)
    goto LABEL_12;
LABEL_8:
  getWFGeneralLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v16 = (WFAction *)objc_opt_class();
    v17 = v16;
    v18 = (void *)objc_opt_class();
    v19 = v18;
    v20 = (void *)objc_msgSend(v11, "stateClass");
    v25 = 136315906;
    v26 = "-[WFAction setParameterState:forKey:]";
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v18;
    v31 = 2112;
    v32 = v20;
    v21 = v20;
    _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_FAULT, "%s Warning: Attempted to set a parameter state of class %@ when %@ requires %@", (uint8_t *)&v25, 0x2Au);

  }
  v22 = 0;
LABEL_13:

  return v22;
}

- (BOOL)setParameterStateToVariable:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 446, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variable"));

    if (v9)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 447, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_9;
LABEL_3:
  -[WFAction parameterForKey:](self, "parameterForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && (v12 = (objc_class *)objc_msgSend(v10, "stateClass"),
        -[objc_class instancesRespondToSelector:](v12, "instancesRespondToSelector:", sel_initWithVariable_)))
  {
    v13 = (void *)objc_msgSend([v12 alloc], "initWithVariable:", v7);
    v14 = -[WFAction setParameterState:forKey:](self, "setParameterState:forKey:", v13, v9);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)parameterKeysIgnoredForParameterSummary
{
  return 0;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  return 0;
}

- (id)supplementalParameterValueForKey:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[WFAction encodedSerializedParameters](self, "encodedSerializedParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFEnforceClass(v8, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateParameterSummaryIfNeeded:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[WFAction parameterSummary](self, "parameterSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAction parameterSummary](self, "parameterSummary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 16, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id))v4)[2](v4, 0, v6);
  }

}

- (void)parameterDefaultSerializedRepresentationDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFAction cachedDefaultParameterStates](self, "cachedDefaultParameterStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_msgSend(v9, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_msgSend(v9, "parameterStateIsValid:", v7) & 1) == 0)
  {
    objc_msgSend(v9, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction notifyEventObserversParameterStateDidChangeForKey:](self, "notifyEventObserversParameterStateDidChangeForKey:", v8);

  }
}

- (WFResourceManager)resourceManager
{
  os_unfair_lock_s *p_resourceManagerLock;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  WFResourceManager *v11;
  WFResourceManager *resourceManager;
  NSObject *v13;
  NSObject *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_resourceManagerLock = &self->_resourceManagerLock;
  os_unfair_lock_lock(&self->_resourceManagerLock);
  if (!self->_resourceManager)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);

    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      -[WFAction identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CreateResourceManager", "identifier=%{signpost.description:attribute}@,class=%{signpost.description:attribute}@", (uint8_t *)&v16, 0x16u);

    }
    -[WFAction createResourceManager](self, "createResourceManager");
    v11 = (WFResourceManager *)objc_claimAutoreleasedReturnValue();
    resourceManager = self->_resourceManager;
    self->_resourceManager = v11;

    -[WFAction recreateResourcesIfNeeded](self, "recreateResourcesIfNeeded");
    WFConfigureParameterRelationResources(self->_resourceManager, self);
    getWFGeneralLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v16) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v14, OS_SIGNPOST_INTERVAL_END, v5, "CreateResourceManager", ", (uint8_t *)&v16, 2u);
    }

  }
  os_unfair_lock_unlock(p_resourceManagerLock);
  return self->_resourceManager;
}

- (id)createResourceManager
{
  WFResourceManager *v3;
  void *v4;
  WFResourceManager *v5;

  v3 = [WFResourceManager alloc];
  -[WFAction requiredResources](self, "requiredResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFResourceManager initWithDefinitions:](v3, "initWithDefinitions:", v4);

  return v5;
}

- (void)setCurrentGeneratedResourceNodes:(id)a3
{
  id v5;
  WFResourceManager *v6;
  WFResourceManager *v7;
  NSArray **p_currentGeneratedResourceNodes;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  WFResourceManager *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_resourceManager;
  v7 = v6;
  p_currentGeneratedResourceNodes = &self->_currentGeneratedResourceNodes;
  v30 = v6;
  if (self->_currentGeneratedResourceNodes)
  {
    v29 = v5;
    -[WFResourceManager removeResourceNodes:](v6, "removeResourceNodes:");
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = *p_currentGeneratedResourceNodes;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "resource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF721F10))
              v16 = v15;
            else
              v16 = 0;
          }
          else
          {
            v16 = 0;
          }
          v17 = v16;

          objc_msgSend(v17, "setWorkflow:", 0);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }

    v5 = v29;
    v7 = v30;
  }
  objc_storeStrong((id *)&self->_currentGeneratedResourceNodes, a3);
  if (*p_currentGeneratedResourceNodes)
  {
    -[WFResourceManager addResourceNodes:](v7, "addResourceNodes:");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = *p_currentGeneratedResourceNodes;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          -[WFAction workflow](self, "workflow");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "resource");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EF721F10))
              v27 = v26;
            else
              v27 = 0;
          }
          else
          {
            v27 = 0;
          }
          v28 = v27;

          objc_msgSend(v28, "setWorkflow:", v24);
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    v7 = v30;
  }

}

- (id)unevaluatedResourceObjectsOfClass:(Class)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction unevaluatedResourceObjectsOfClasses:](self, "unevaluatedResourceObjectsOfClasses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)unevaluatedResourceObjectsOfClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFAction unevaluatedResourceNodes](self, "unevaluatedResourceNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "addResourceObjectsOfClassesOrProtocols:toSet:", v4, v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)unevaluatedResourceNodes
{
  NSArray *currentUnevaluatedResourceNodes;

  currentUnevaluatedResourceNodes = self->_currentUnevaluatedResourceNodes;
  if (!currentUnevaluatedResourceNodes)
  {
    -[WFAction recreateUnevaluatedResourcesIfNeeded](self, "recreateUnevaluatedResourcesIfNeeded");
    currentUnevaluatedResourceNodes = self->_currentUnevaluatedResourceNodes;
  }
  return currentUnevaluatedResourceNodes;
}

- (void)recreateResourcesIfNeeded
{
  -[WFAction recreateGeneratedResourcesIfNeeded](self, "recreateGeneratedResourcesIfNeeded");
  -[WFAction recreateUnevaluatedResourcesIfNeeded](self, "recreateUnevaluatedResourcesIfNeeded");
}

- (void)recreateUnevaluatedResourcesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WFAction requiredResources](self, "requiredResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFResourceNode nodesWithDefinitions:](WFResourceNode, "nodesWithDefinitions:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[WFAction currentGeneratedResourceNodes](self, "currentGeneratedResourceNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction setCurrentUnevaluatedResourceNodes:](self, "setCurrentUnevaluatedResourceNodes:", v5);

}

- (void)recreateGeneratedResourcesIfNeeded
{
  id v3;

  -[WFAction generatedResourceNodes](self, "generatedResourceNodes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAction setCurrentGeneratedResourceNodes:](self, "setCurrentGeneratedResourceNodes:", v3);

}

- (id)generatedResourceNodes
{
  id v3;
  void *v4;
  void *v5;
  WFResourceNode *v6;
  void *v7;
  WFResourceNode *v8;
  void *v9;
  void *v10;
  void *v11;
  WFAppProtectionAccessResource *v12;
  WFResourceNode *v13;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WFAction appResource](self, "appResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFAction appResource](self, "appResource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    v6 = [WFResourceNode alloc];
    -[WFAction appResource](self, "appResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFResourceNode initWithResource:](v6, "initWithResource:", v7);

    objc_msgSend(v3, "addObject:", v8);
  }
  -[WFAction displayableAppDescriptor](self, "displayableAppDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    -[WFAction appDescriptor](self, "appDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v9, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_5:
    v12 = -[WFAppProtectionAccessResource initWithAssociatedAppBundleIdentifier:]([WFAppProtectionAccessResource alloc], "initWithAssociatedAppBundleIdentifier:", v11);
    v13 = -[WFResourceNode initWithResource:]([WFResourceNode alloc], "initWithResource:", v12);
    objc_msgSend(v3, "addObject:", v13);

  }
LABEL_6:

  return v3;
}

- (void)runWithInput:(id)a3 userInterface:(id)a4 runningDelegate:(id)a5 variableSource:(id)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  id completionHandler;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD aBlock[4];
  void (**v37)(id, _QWORD, void *);
  id v38[2];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD, void *))a8;
  if (self->_running)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 37, 0, v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 0, v19);

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[WFAction description](self, "description", v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]";
      v42 = 2114;
      v43 = v21;
      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEFAULT, "%s Action %{public}@ started running", buf, 0x16u);

    }
    getWFRunningLifecycleLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (char *)os_signpost_id_generate(v22);

    getWFRunningLifecycleLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      -[WFAction identifier](self, "identifier");
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v26;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v25, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v23, "RunAction", " enableTelemetry=YES actionID=%{signpost.telemetry:string1,public}@", buf, 0xCu);

    }
    -[WFAction setRunning:](self, "setRunning:", 1);
    -[WFAction setUserInterface:](self, "setUserInterface:", v14);
    -[WFAction setRunningDelegate:](self, "setRunningDelegate:", v15);
    -[WFAction setVariableSource:](self, "setVariableSource:", v16);
    -[WFAction setWorkQueue:](self, "setWorkQueue:", v17);
    v27 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke;
    block[3] = &unk_1E7AF94B0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_initWeak((id *)buf, self);
    aBlock[0] = v27;
    aBlock[1] = 3221225472;
    aBlock[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E7AEC8C0;
    objc_copyWeak(v38, (id *)buf);
    v38[1] = v23;
    v37 = v18;
    v28 = _Block_copy(aBlock);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v28;

    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFAction isDisabledWhenRunOnDevice:](self, "isDisabledWhenRunOnDevice:", v30))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "wf_unsupportedActionErrorWithType:platformIdiom:", CFSTR("NotAvailableOnSpecifiedPlatform"), objc_msgSend(v30, "idiom"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v31);

    }
    else
    {
      v33[0] = v27;
      v33[1] = 3221225472;
      v33[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_241;
      v33[3] = &unk_1E7AEC988;
      v33[4] = self;
      v34 = v32;
      v35 = v17;
      -[WFAction prepareToProcessWithCompletionHandler:](self, "prepareToProcessWithCompletionHandler:", v33);

    }
    objc_destroyWeak(v38);
    objc_destroyWeak((id *)buf);
  }

}

- (BOOL)requiresPrivateOutputLogging
{
  return 0;
}

- (id)previousAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "indexOfObject:", self);
  v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "objectAtIndex:", v5 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  WFActionContentPermissionRequestor *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "variableString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parameter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v19 = v13;

    v20 = objc_msgSend(v19, "processesIntoContentItems");
    if (v20)
    {
      v21 = (void *)MEMORY[0x1E0D13E50];
      v33 = *MEMORY[0x1E0D14178];
      v22 = -[WFActionContentPermissionRequestor initWithAction:]([WFActionContentPermissionRequestor alloc], "initWithAction:", self);
      v34[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "optionsWithDictionary:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke;
      v31[3] = &unk_1E7AF7128;
      v32 = v10;
      objc_msgSend(v11, "processIntoStringsAndAttachmentsWithContext:options:completionHandler:", v9, v24, v31);

    }
    else
    {
      if (!objc_msgSend(v11, "representsSingleContentVariable"))
      {
        v16 = 0;
        goto LABEL_23;
      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke_2;
      v29[3] = &unk_1E7AF7128;
      v30 = v10;
      objc_msgSend(v11, "processIntoContentItemsWithContext:completionHandler:", v9, v29);
      v24 = v30;
    }

    v16 = 1;
LABEL_23:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    objc_msgSend(v11, "variable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v11, "variable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "getContentWithContext:completionHandler:", v9, v10);
      v16 = 1;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v11, "parameterStates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v26 == 1)
    {
      objc_msgSend(v11, "parameterStates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[WFAction getInputContentFromVariablesInParameterState:context:completionHandler:](self, "getInputContentFromVariablesInParameterState:context:completionHandler:", v27, v9, v10);

      goto LABEL_22;
    }

LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
  }
  objc_msgSend(v8, "containedVariables");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_25;
  objc_msgSend(v18, "getContentWithContext:completionHandler:", v9, v10);

  v16 = 1;
LABEL_26:

  return v16;
}

- (BOOL)shouldAskForValuesWhileProcessingParameterStates
{
  return 1;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (id)populatedInputWithProcessedParameterValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFAction inputParameterKey](self, "inputParameterKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_popObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
      }
      else
      {
        v12[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      objc_msgSend(v8, "if_compactMap:", &__block_literal_global_265);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v10);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyParameterStates
{
  return -[WFAction copyParameterStatesWithFallingBackToDefaultValue:](self, "copyParameterStatesWithFallingBackToDefaultValue:", 1);
}

- (void)processParametersWithoutAskingForValuesWithInput:(id)a3 workQueue:(id)a4 completionHandler:(id)a5
{
  -[WFAction processParametersWithoutAskingForValuesWithInput:workQueue:fallingBackToDefaultValue:completionHandler:](self, "processParametersWithoutAskingForValuesWithInput:workQueue:fallingBackToDefaultValue:completionHandler:", a3, a4, 1, a5);
}

- (BOOL)usesLegacyInputBehavior
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFAction inputTypes](self, "inputTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") || -[WFAction inputPassthrough](self, "inputPassthrough"))
  {
    -[WFAction inputParameter](self, "inputParameter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)processEncodedValue:(id)a3 withToolKitInvocation:(id)a4 forParameter:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[WFAction toolkitValueClassForParameter:](self, "toolkitValueClassForParameter:", v12);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 1113, CFSTR("The parameter state doesn't define a processing value classes"));

    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 1114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toolInvocation"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  -[WFAction variableSource](self, "variableSource");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processedValueFromEncodedValue:forParameter:ofClass:variableSource:completionHandler:", v14, v12, v15, v18, v11);

}

- (void)processValueForParameter:(id)a3 withToolKitInvocation:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[WFAction toolkitValueClassForParameter:](self, "toolkitValueClassForParameter:", v11);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 1129, CFSTR("The parameter state doesn't define a processing value classes"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 1130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toolInvocation"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  -[WFAction variableSource](self, "variableSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__WFAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke;
  v17[3] = &unk_1E7AEF370;
  v18 = v9;
  v14 = v9;
  objc_msgSend(v10, "valueForParameter:ofClass:variableSource:completionHandler:", v11, v12, v13, v17);

}

- (Class)toolkitValueClassForParameter:(id)a3
{
  return (Class)objc_msgSend(a3, "toolkitValueClass");
}

- (void)askForValuesOfParameters:(id)a3 withDefaultStates:(id)a4 prompts:(id)a5 input:(id)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a5;
  v19 = a4;
  -[WFAction inputParameter](self, "inputParameter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v14, "containsObject:", v20);

  if ((_DWORD)a4)
  {

    v15 = 0;
  }
  -[WFAction runningDelegate](self, "runningDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke;
  v25[3] = &unk_1E7AECB08;
  v25[4] = self;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v17;
  objc_msgSend(v21, "action:provideInputForParameters:withDefaultStates:prompts:completionHandler:", self, v14, v19, v18, v25);

}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v22;
  uint64_t v23;
  uint64_t v24;
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
  v4 = a3;
  v22 = (id)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[WFAction parameters](self, "parameters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    v23 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      v24 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v8);
        if (v9 != v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v8), "resourceManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "resourcesRequiredForDisplayAvailable");

          if ((v11 & 1) == 0)
          {
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            objc_msgSend(v9, "resourceManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "resourceObjectsOfClass:", objc_opt_class());
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v27;
              while (2)
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v27 != v16)
                    objc_enumerationMutation(v13);
                  objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "parameterKey");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "key");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v18, "isEqualToString:", v19);

                  if (v20)
                  {
                    objc_msgSend(v22, "addObject:", v9);
                    goto LABEL_18;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
                if (v15)
                  continue;
                break;
              }
            }
LABEL_18:

            v7 = v23;
            v6 = v24;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }

  return v22;
}

- (void)setRunningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_runningDelegate, a3);
}

- (NSSet)ignoredParameterKeysForProcessing
{
  NSSet *ignoredParameterKeysForProcessing;
  NSSet *v4;
  NSSet *v5;

  ignoredParameterKeysForProcessing = self->_ignoredParameterKeysForProcessing;
  if (!ignoredParameterKeysForProcessing)
  {
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    v5 = self->_ignoredParameterKeysForProcessing;
    self->_ignoredParameterKeysForProcessing = v4;

    ignoredParameterKeysForProcessing = self->_ignoredParameterKeysForProcessing;
  }
  return ignoredParameterKeysForProcessing;
}

- (OS_dispatch_queue)effectiveWorkQueue
{
  OS_dispatch_queue *effectiveWorkQueue;
  void *v4;
  void *v5;
  OS_dispatch_queue *v6;
  id v7;
  OS_dispatch_queue *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  effectiveWorkQueue = self->_effectiveWorkQueue;
  if (!effectiveWorkQueue)
  {
    -[WFAction resourceManager](self, "resourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshAvailabilityOfRequiredResourcesOfClasses:", v5);
    if (objc_msgSend(v4, "currentlyRequiresResourceOfClasses:", v5))
    {
      v6 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
    }
    else
    {
      -[WFAction workQueue](self, "workQueue");
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v8 = self->_effectiveWorkQueue;
    self->_effectiveWorkQueue = v6;

    effectiveWorkQueue = self->_effectiveWorkQueue;
  }
  return effectiveWorkQueue;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("The action being run (%@) is missing an implementation."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction localizedName](self, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 3, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  if (-[WFAction isSubclassThatOverridesSelector:](self, "isSubclassThatOverridesSelector:", sel_runWithInput_completionHandler_))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__WFAction_runAsynchronouslyWithInput___block_invoke;
    v11[3] = &unk_1E7AF7B78;
    v11[4] = self;
    -[WFAction runWithInput:completionHandler:](self, "runWithInput:completionHandler:", v4, v11);
  }
  else
  {
    -[WFAction userInterfaceClasses](self, "userInterfaceClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __39__WFAction_runAsynchronouslyWithInput___block_invoke_3;
      v9[3] = &unk_1E7AECB30;
      v9[4] = self;
      v10 = v4;
      -[WFAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v9);

    }
    else
    {
      v8 = 0;
      -[WFAction runWithInput:error:](self, "runWithInput:error:", v4, &v8);
      v7 = v8;
      -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v7);

    }
  }

}

- (BOOL)shouldDisableSmartPromptChecks
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    return 0;
  }
  -[WFAction runningDelegate](self, "runningDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldDisablePrivacyPrompts");

  if (!v5)
    return 0;
  getWFSecurityLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[WFAction shouldDisableSmartPromptChecks]";
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEBUG, "%s Exempting action from smart prompts due to workflow controller flag.", (uint8_t *)&v8, 0xCu);
  }

  return 1;
}

- (BOOL)isSubclassThatOverridesSelector:(SEL)a3
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_opt_class();
  v6 = -[WFAction methodForSelector:](self, "methodForSelector:", a3);
  return v6 != objc_msgSend(v5, "instanceMethodForSelector:", a3);
}

- (void)performDataAccessChecksWithUserInterface:(id)a3 contentItemCache:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke;
  v14[3] = &unk_1E7AECB80;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[WFAction getContentDestinationWithCompletionHandler:](self, "getContentDestinationWithCompletionHandler:", v14);

}

- (void)performSmartPromptChecksWithUserInterface:(id)a3 contentDestination:(id)a4 contentItemCache:(id)a5 isWebpageCoercion:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  const __CFString *v72;
  __CFString *v73;
  NSObject *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  WFSmartPromptConfiguration *v83;
  WFSmartPromptConfiguration *v84;
  NSObject *v85;
  WFCompactUnlockService *v86;
  WFCompactUnlockService *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  WFSmartPromptConfiguration *v93;
  void *v94;
  BOOL v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void (**v100)(_QWORD, id);
  void *v101;
  id v102;
  void *v103;
  void *v104;
  id obj;
  id obja;
  __CFString *objb;
  WFAction *v108;
  _QWORD v109[5];
  WFSmartPromptConfiguration *v110;
  id v111;
  id v112;
  id v113;
  WFCompactUnlockService *v114;
  void (**v115)(_QWORD, id);
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD))a7;
  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    getWFSecurityLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:"
             "completionHandler:]";
      v18 = "%s Not performing smart prompt checks because database access is not available.";
      v19 = v17;
      v20 = OS_LOG_TYPE_FAULT;
LABEL_11:
      _os_log_impl(&dword_1C15B3000, v19, v20, v18, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (-[WFAction shouldDisableSmartPromptChecks](self, "shouldDisableSmartPromptChecks"))
  {
    getWFSecurityLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:"
             "completionHandler:]";
LABEL_10:
      v19 = v17;
      v20 = OS_LOG_TYPE_DEBUG;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!-[WFAction requiresRemoteExecution](self, "requiresRemoteExecution"))
  {
    v95 = a6;
    v100 = (void (**)(_QWORD, id))v15;
    v101 = v12;
    v102 = v14;
    v103 = v13;
    -[WFAction workflow](self, "workflow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "actions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(v22, "indexOfObject:", self);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction contentAttributionTracker](self, "contentAttributionTracker");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trackedAttributionSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "if_addObjectIfNonNil:", v25);

    -[WFAction runningDelegate](self, "runningDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "flowTracker");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "attributionSetForCurrentScope");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "if_addObjectIfNonNil:", v28);

    v98 = v23;
    objc_msgSend(MEMORY[0x1E0D13EA0], "attributionSetByMergingAttributionSets:", v23);
    v29 = objc_claimAutoreleasedReturnValue();
    -[WFAction runningDelegate](self, "runningDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "exfiltrationLogger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction UUID](self, "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)v29;
    objc_msgSend(v31, "attributionSetByRewritingSetWithLoggedCounts:forExfiltratingActionUUID:", v29, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction UUID](self, "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction identifier](self, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction workflow](self, "workflow");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "reference");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = self;
    -[WFAction allowedOnceSmartPromptStates](self, "allowedOnceSmartPromptStates");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v120 = 0;
    objc_msgSend(v34, "approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIdentifier:actionIndex:reference:allowedOnceStates:error:", v33, v103, v35, v36, obj, v38, v40, &v120);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v120;
    if (!v39)

    v96 = (void *)v33;
    -[WFAction setAllowedOnceSmartPromptStates:](v108, "setAllowedOnceSmartPromptStates:", 0);
    objc_msgSend(v41, "actionUUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setUUID:](v108, "setUUID:", v42);

    v43 = v99;
    if (v99)
    {
      v15 = (void (**)(id, _QWORD))v100;
      v100[2](v100, v99);
      v14 = v102;
      v13 = v103;
      v12 = v101;
    }
    else
    {
      objc_msgSend(v41, "restrictedStates");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");

      v14 = v102;
      v13 = v103;
      v15 = (void (**)(id, _QWORD))v100;
      v12 = v101;
      if (v45)
      {
        objc_msgSend(v41, "restrictedStates");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedExfiltrationRestrictedError");
        v48 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v41, "deniedStates");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count");

        if (!v50)
        {
          v119 = 0u;
          v117 = 0u;
          v118 = 0u;
          v116 = 0u;
          v94 = v41;
          objc_msgSend(v41, "allowedStates");
          obja = (id)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v117;
            do
            {
              for (i = 0; i != v53; ++i)
              {
                if (*(_QWORD *)v117 != v54)
                  objc_enumerationMutation(obja);
                v56 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
                getWFSecurityLogObject();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v56, "sourceContentAttribution");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v58, "count");
                  objc_msgSend(v56, "sourceContentAttribution");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "origin");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFAction UUID](v108, "UUID");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebp"
                         "ageCoercion:completionHandler:]";
                  v123 = 2048;
                  v124 = v59;
                  v125 = 2112;
                  v126 = v61;
                  v127 = 2112;
                  v128 = v62;
                  _os_log_impl(&dword_1C15B3000, v57, OS_LOG_TYPE_DEBUG, "%s Logging allowed exfiltration of %lu items from %@ by action %@", buf, 0x2Au);

                }
                -[WFAction runningDelegate](v108, "runningDelegate");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "exfiltrationLogger");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "sourceContentAttribution");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "count");
                -[WFAction UUID](v108, "UUID");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "sourceContentAttribution");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "origin");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "logExfiltratedItemsCount:actionUUID:contentOrigin:", v66, v67, v69);

              }
              v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
            }
            while (v53);
          }

          v41 = v94;
          objc_msgSend(v94, "undefinedStates");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "count");

          if (v71)
          {
            v72 = CFSTR("Shortcut");
            v73 = CFSTR("Shortcut");
            v12 = v101;
            if (-[WFAction isRunningInSiriUserInterface](v108, "isRunningInSiriUserInterface"))
            {
              getWFSecurityLogObject();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315138;
                v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpag"
                       "eCoercion:completionHandler:]";
                _os_log_impl(&dword_1C15B3000, v74, OS_LOG_TYPE_DEBUG, "%s Smart prompt is being presented in Siri", buf, 0xCu);
              }

              v72 = CFSTR("Siri");
              v75 = CFSTR("Siri");

            }
            v93 = [WFSmartPromptConfiguration alloc];
            objc_msgSend(v94, "undefinedStates");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction contentAttributionTracker](v108, "contentAttributionTracker");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "trackedAttributionSet");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "previousAttributions");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction workflow](v108, "workflow");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "reference");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction workflow](v108, "workflow");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "name");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v92) = v95;
            objb = (__CFString *)v72;
            v83 = -[WFSmartPromptConfiguration initWithSmartPromptStates:attributionSet:previousAttributions:contentItemCache:action:contentDestination:reference:workflowName:source:isWebpageCoercion:](v93, "initWithSmartPromptStates:attributionSet:previousAttributions:contentItemCache:action:contentDestination:reference:workflowName:source:isWebpageCoercion:", v76, v77, v78, v102, v108, v103, v80, v82, v72, v92);

            v84 = v83;
            if (v83)
            {
              v43 = 0;
              v15 = (void (**)(id, _QWORD))v100;
              if (-[WFAction isRunningInSiriUserInterface](v108, "isRunningInSiriUserInterface")
                || !-[WFSmartPromptConfiguration containsPrivatePreviews](v83, "containsPrivatePreviews"))
              {
                v41 = v94;
                v13 = v103;
                -[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDestination:completionHandler:](v108, "presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDestination:completionHandler:", v83, v101, v94, v103, v100);
                v14 = v102;
              }
              else
              {
                getWFSecurityLogObject();
                v85 = objc_claimAutoreleasedReturnValue();
                v14 = v102;
                v13 = v103;
                v41 = v94;
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315138;
                  v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebp"
                         "ageCoercion:completionHandler:]";
                  _os_log_impl(&dword_1C15B3000, v85, OS_LOG_TYPE_DEBUG, "%s Requiring device unlock before presenting sensitive smart prompt previews", buf, 0xCu);
                }

                v86 = objc_alloc_init(WFCompactUnlockService);
                v109[0] = MEMORY[0x1E0C809B0];
                v109[1] = 3221225472;
                v109[2] = __126__WFAction_performSmartPromptChecksWithUserInterface_contentDestination_contentItemCache_isWebpageCoercion_completionHandler___block_invoke;
                v109[3] = &unk_1E7AECBA8;
                v109[4] = v108;
                v110 = v84;
                v111 = v101;
                v112 = v94;
                v114 = v86;
                v115 = v100;
                v113 = v103;
                v87 = v86;
                -[WFCompactUnlockService requestUnlockIfNeeded:](v87, "requestUnlockIfNeeded:", v109);

              }
            }
            else
            {
              getWFWorkflowExecutionLogObject();
              v88 = objc_claimAutoreleasedReturnValue();
              v43 = 0;
              v15 = (void (**)(id, _QWORD))v100;
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpag"
                       "eCoercion:completionHandler:]";
                _os_log_impl(&dword_1C15B3000, v88, OS_LOG_TYPE_ERROR, "%s Failed to init WFSmartPromptConfiguration for smart prompt.", buf, 0xCu);
              }

              -[WFAction workflow](v108, "workflow");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "name");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              WFRunnerFailureErrorMessage(v90);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v100[2](v100, v91);

              v14 = v102;
              v13 = v103;
              v41 = v94;
            }

          }
          else
          {
            -[WFAction logDataTransmissionForSmartPromptApprovalResult:](v108, "logDataTransmissionForSmartPromptApprovalResult:", v94);
            v15 = (void (**)(id, _QWORD))v100;
            v100[2](v100, 0);
            v12 = v101;
            v14 = v102;
            v13 = v103;
            v43 = 0;
          }
          goto LABEL_25;
        }
        objc_msgSend(v41, "deniedStates");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedDeniedPermissionsError");
        v48 = objc_claimAutoreleasedReturnValue();
      }
      v51 = (void *)v48;

      v100[2](v100, v51);
    }
LABEL_25:

    goto LABEL_13;
  }
  getWFSecurityLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:co"
           "mpletionHandler:]";
    v18 = "%s Not performing smart prompt checks because action is executed remotely.";
    goto LABEL_10;
  }
LABEL_12:

  v15[2](v15, 0);
LABEL_13:

}

- (void)presentSmartPromptAuthorizationWithConfiguration:(id)a3 userInterface:(id)a4 databaseApprovalResult:(id)a5 contentDestination:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  WFAction *v22;
  id v23;
  void (**v24)(id, void *);
  _QWORD v25[4];
  id v26;
  WFAction *v27;
  id v28;
  void (**v29)(id, void *);
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v13, "requestedFromAnotherDevice")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke;
    v25[3] = &unk_1E7AECBD0;
    v29 = v16;
    v26 = v15;
    v27 = self;
    v28 = v14;
    objc_msgSend(v13, "presentAlertWithSmartPromptConfiguration:completionHandler:", v12, v25);

    v17 = v26;
LABEL_7:

    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke_316;
    v20[3] = &unk_1E7AECBD0;
    v24 = v16;
    v21 = v15;
    v22 = self;
    v23 = v14;
    objc_msgSend(v13, "requestAuthorizationWithConfiguration:completionHandler:", v12, v20);

    v17 = v21;
    goto LABEL_7;
  }
  getWFSecurityLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDestin"
          "ation:completionHandler:]";
    _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Current UI does not support setting smart prompts", buf, 0xCu);
  }

  +[WFSmartPromptState localizedUnsupportedEnvironmentError](WFSmartPromptState, "localizedUnsupportedEnvironmentError");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, v19);

LABEL_11:
}

- (void)logDataTransmissionForSmartPromptApprovalResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "allowedStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_compactMap:", &__block_literal_global_318);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_320);
}

- (BOOL)isRunningInSiriUserInterface
{
  void *v2;
  char v3;

  -[WFAction userInterface](self, "userInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningWithSiriUI");

  return v3;
}

- (id)itemsBeingDeleted
{
  void *v3;

  if (-[WFAction deletesInput](self, "deletesInput"))
  {
    -[WFAction input](self, "input");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)performDeletionAuthorizationChecksWithUserInterface:(id)a3 contentItemCache:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  NSObject *v43;
  __CFString *v44;
  WFSmartPromptConfiguration *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  char v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[6];
  _QWORD v63[6];
  id v64;
  uint8_t buf[4];
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (!-[WFAction shouldDisableSmartPromptChecks](self, "shouldDisableSmartPromptChecks"))
  {
    if (!-[WFAction deletesInput](self, "deletesInput"))
      goto LABEL_12;
    if (-[WFAction deletesInput](self, "deletesInput") && !-[WFAction contentItemClass](self, "contentItemClass"))
    {
      getWFSecurityLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        goto LABEL_5;
      *(_DWORD *)buf = 136315138;
      v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
      v10 = "%s deletesInput was set to YES, but no contentItemClass was specified";
      v11 = v9;
      v12 = OS_LOG_TYPE_FAULT;
      goto LABEL_4;
    }
    -[WFAction itemsBeingDeleted](self, "itemsBeingDeleted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfItems");
    if (!v14)
    {
      v8[2](v8, 0);
LABEL_53:

      goto LABEL_54;
    }
    v15 = v14;
    v59 = v7;
    v60 = v13;
    -[WFAction workflow](self, "workflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reference");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[WFAction workflow](self, "workflow");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reference");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction workflow](self, "workflow");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "workflowID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "referenceForWorkflowID:", v21);
      v19 = objc_claimAutoreleasedReturnValue();

    }
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(-[WFAction contentItemClass](self, "contentItemClass"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction UUID](self, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction identifier](self, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction workflow](self, "workflow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v61 = (void *)v19;
    objc_msgSend(v22, "currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentifier:actionIndex:count:reference:error:", v23, v24, v25, objc_msgSend(v27, "indexOfObject:", self), v15, v19, &v64);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v64;

    objc_msgSend(v28, "actionUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setUUID:](self, "setUUID:", v29);

    objc_msgSend(v28, "status");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = objc_msgSend(v30, "isEqualToString:", CFSTR("Restricted"));

    if ((_DWORD)v25)
    {
      getWFSecurityLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      v7 = v59;
      v13 = v60;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_INFO, "%s Stopping action because exfiltration is restricted", buf, 0xCu);
      }

      objc_msgSend(v28, "localizedExfiltrationRestrictedError");
      v32 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v40 = (void *)v32;
      v8[2](v8, v32);

      v36 = v61;
LABEL_52:

      goto LABEL_53;
    }
    v7 = v59;
    v13 = v60;
    if (+[WFShortcutsSecuritySettings allowsDeletingWithoutConfirmation](WFShortcutsSecuritySettings, "allowsDeletingWithoutConfirmation"))
    {
      objc_msgSend(v28, "status");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("Allow"));

      if (v34)
      {
        getWFSecurityLogObject();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v61;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
          _os_log_impl(&dword_1C15B3000, v35, OS_LOG_TYPE_DEBUG, "%s Executing action because flag in Preferences is on and deletion authorization was previously approved", buf, 0xCu);
        }

        v8[2](v8, 0);
        goto LABEL_52;
      }
    }
    objc_msgSend(v28, "status");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("Disallow"));

    if (v38)
    {
      getWFSecurityLogObject();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C15B3000, v39, OS_LOG_TYPE_INFO, "%s Stopping action because deletion authorization was previously denied", buf, 0xCu);
      }

      objc_msgSend(v28, "deniedPermissionsError");
      v32 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v41 = CFSTR("Shortcut");
    v42 = CFSTR("Shortcut");
    v36 = v61;
    if (-[WFAction isRunningInSiriUserInterface](self, "isRunningInSiriUserInterface"))
    {
      getWFSecurityLogObject();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C15B3000, v43, OS_LOG_TYPE_DEBUG, "%s Deletion authorization prompt is being presented in Siri", buf, 0xCu);
      }

      v41 = CFSTR("Siri");
      v44 = CFSTR("Siri");

    }
    v45 = -[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]([WFSmartPromptConfiguration alloc], "initWithDeletionAuthorizationState:contentCollection:action:reference:source:", v28, v60, self, v61, v41);
    if (!v45)
    {
      getWFWorkflowExecutionLogObject();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C15B3000, v52, OS_LOG_TYPE_ERROR, "%s Failed to init WFSmartPromptConfiguration for deletion authorization", buf, 0xCu);
      }

      -[WFAction workflow](self, "workflow");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      WFRunnerFailureErrorMessage(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v55);

      v13 = v60;
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      getWFSecurityLogObject();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C15B3000, v56, OS_LOG_TYPE_ERROR, "%s Current UI does not support setting deletion authorizations", buf, 0xCu);
      }

      +[WFSmartPromptState localizedUnsupportedEnvironmentError](WFSmartPromptState, "localizedUnsupportedEnvironmentError");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v57);

      goto LABEL_51;
    }
    -[WFAction userInterface](self, "userInterface");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[WFAction userInterface](self, "userInterface");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "requestedFromAnotherDevice");

      if (v48)
      {
        -[WFAction userInterface](self, "userInterface");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_opt_respondsToSelector();

        if ((v50 & 1) != 0)
        {
          -[WFAction userInterface](self, "userInterface");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke;
          v63[3] = &unk_1E7AECC78;
          v63[4] = self;
          v63[5] = v8;
          objc_msgSend(v51, "presentAlertWithSmartPromptConfiguration:completionHandler:", v45, v63);
LABEL_49:

LABEL_50:
          v36 = v61;
LABEL_51:

          goto LABEL_52;
        }
      }
    }
    else
    {

    }
    -[WFAction userInterface](self, "userInterface");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_324;
    v62[3] = &unk_1E7AECC78;
    v62[4] = self;
    v62[5] = v8;
    objc_msgSend(v51, "requestAuthorizationWithConfiguration:completionHandler:", v45, v62);
    goto LABEL_49;
  }
  getWFSecurityLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEBUG;
LABEL_4:
    _os_log_impl(&dword_1C15B3000, v11, v12, v10, buf, 0xCu);
  }
LABEL_5:

LABEL_12:
  v8[2](v8, 0);
LABEL_54:

}

- (void)promptForAudioRecordingPermissionIfNeededWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v4 = a3;
  if (-[WFAction mightStartAudioRecording](self, "mightStartAudioRecording"))
  {
    -[WFAction runningDelegate](self, "runningDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[WFAction runningDelegate](self, "runningDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentRunningContextForAction:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[WFAction userInterface](self, "userInterface");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "automationType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction localizedName](self, "localizedName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setTitle:", v12);

            v13 = (void *)MEMORY[0x1E0CB3940];
            WFLocalizedString(CFSTR("Allow “%@” to start an audio recording?"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFAction localizedName](self, "localizedName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setMessage:", v16);

            v17 = (void *)MEMORY[0x1E0D13DE8];
            v18 = MEMORY[0x1E0C809B0];
            v27[0] = MEMORY[0x1E0C809B0];
            v27[1] = 3221225472;
            v27[2] = __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke;
            v27[3] = &unk_1E7AF8F48;
            v19 = v4;
            v28 = v19;
            objc_msgSend(v17, "cancelButtonWithHandler:", v27);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addButton:", v20);

            v21 = (void *)MEMORY[0x1E0D13DE8];
            WFLocalizedString(CFSTR("Allow"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = v18;
            v25[1] = 3221225472;
            v25[2] = __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke_2;
            v25[3] = &unk_1E7AF8F48;
            v26 = v19;
            objc_msgSend(v21, "buttonWithTitle:style:preferred:handler:", v22, 0, 1, v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addButton:", v23);

            -[WFAction userInterface](self, "userInterface");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "presentAlert:", v11);

          }
          else
          {
            (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_10:

    goto LABEL_11;
  }
  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_11:

}

- (void)performDataAndHardwareAccessChecksAndRun
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke;
  v2[3] = &unk_1E7AF5EA8;
  v2[4] = self;
  -[WFAction promptForAudioRecordingPermissionIfNeededWithCompletionBlock:](self, "promptForAudioRecordingPermissionIfNeededWithCompletionBlock:", v2);
}

- (void)checkUserInterfaceAndRun
{
  NSObject *v3;
  _QWORD block[5];

  if (-[WFAction isRunning](self, "isRunning"))
  {
    -[WFAction effectiveWorkQueue](self, "effectiveWorkQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__WFAction_checkUserInterfaceAndRun__block_invoke;
    block[3] = &unk_1E7AF94B0;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0, a4);
}

- (BOOL)isDeletable
{
  return 1;
}

- (BOOL)hasChildren
{
  return 0;
}

- (BOOL)isProgressIndeterminate
{
  return 1;
}

- (void)prepareToProcessWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WFAction_prepareToProcessWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E7AF9450;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WFAction resolveAppDescriptorIfNecessary:](self, "resolveAppDescriptorIfNecessary:", v6);

}

- (id)parameterValueForKey:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[WFAction processedParameters](self, "processedParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFEnforceClass(v8, (uint64_t)a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  OS_dispatch_queue *effectiveWorkQueue;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  char v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  void *v73;
  void *v74;
  _QWORD v75[3];

  v75[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WFAction isRunning](self, "isRunning"))
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const __CFString *)*MEMORY[0x1E0D14318];
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D14318]))
    {
      v7 = objc_msgSend(v4, "code");

      if (!v7)
      {
        v8 = (void *)objc_opt_new();
        WFLocalizedString(CFSTR("This action could not be run with the current user interface."));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0CB2D50]);

        -[WFAction input](self, "input");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("ActionInput"));

        -[WFAction processedParameters](self, "processedParameters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v11, CFSTR("ActionProcessedParameters"));

        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = v6;
        v14 = 0;
LABEL_13:
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v8);
        v30 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v24 = v30;
LABEL_15:

        v4 = (id)v24;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
    if (objc_msgSend(v4, "wf_isUnsupportedOnPlatformError"))
    {
      objc_msgSend(v4, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v15, "mutableCopy");

      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[WFAction localizedName](self, "localizedName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "wf_localizedErrorStringWithActionName:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v19, v16);

        -[WFAction input](self, "input");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v20, CFSTR("ActionInput"));

        -[WFAction processedParameters](self, "processedParameters");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v21, CFSTR("ActionProcessedParameters"));

      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "domain");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, objc_msgSend(v4, "code"), v8);
      v24 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v23;
      goto LABEL_15;
    }
    objc_msgSend(v4, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("WFActionErrorDomain")))
    {
      v26 = objc_msgSend(v4, "code");

      if (v26 == 2)
      {
        v8 = (void *)objc_opt_new();
        WFLocalizedString(CFSTR("This action cannot be run in the current environment."));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v27, *MEMORY[0x1E0CB2D50]);

        -[WFAction input](self, "input");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v28, CFSTR("ActionInput"));

        -[WFAction processedParameters](self, "processedParameters");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v29, CFSTR("ActionProcessedParameters"));

        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = CFSTR("WFActionErrorDomain");
        v14 = 2;
        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0D141B8]))
      goto LABEL_16;
    v55 = objc_msgSend(v4, "code");

    if (v55)
    {
LABEL_17:
      -[WFAction setRunning:](self, "setRunning:", 0);
      -[WFAction setActionUserInterface:](self, "setActionUserInterface:", 0);
      effectiveWorkQueue = self->_effectiveWorkQueue;
      self->_effectiveWorkQueue = 0;

      -[WFAction sessionKitAssertion](self, "sessionKitAssertion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        getWFSessionKitLogObject();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v4)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136315138;
            v71 = "-[WFAction finishRunningWithError:]";
            _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_DEFAULT, "%s We finished with an error, and we were holding a SessionKit assertion. Letting it go.", buf, 0xCu);
          }

          -[WFAction setSessionKitAssertion:](self, "setSessionKitAssertion:", 0);
        }
        else
        {
          if (v34)
          {
            *(_DWORD *)buf = 136315138;
            v71 = "-[WFAction finishRunningWithError:]";
            _os_log_impl(&dword_1C15B3000, v33, OS_LOG_TYPE_DEFAULT, "%s Action finished running, and we seem to be holding a SessionKit assertion. Starting a timeout to invalidate it if we're still waiting on the app...", buf, 0xCu);
          }

          -[WFAction sessionKitAssertion](self, "sessionKitAssertion");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "startTimeoutTimer");

        }
      }
      if ((objc_msgSend((id)objc_opt_class(), "outputIsExemptFromTaintTrackingInheritance") & 1) != 0
        || -[WFAction inputPassthrough](self, "inputPassthrough"))
      {
        goto LABEL_40;
      }
      -[WFAction contentAttributionTracker](self, "contentAttributionTracker");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "trackedAttributionSet");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAction appDescriptor](self, "appDescriptor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        -[WFAction appDescriptor](self, "appDescriptor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "bundleIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        WFMCIsAppAccountBasedSourceForOpenIn(v40);
        v42 = v41;

        if ((v42 & 1) == 0)
        {
          v43 = (void *)MEMORY[0x1E0D13EA0];
          v75[0] = v37;
          v44 = (void *)MEMORY[0x1E0D13E98];
          v45 = -[WFAction outputDisclosureLevel](self, "outputDisclosureLevel");
          v46 = (void *)MEMORY[0x1E0D13E00];
          -[WFAction appDescriptor](self, "appDescriptor");
          v47 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "locationWithAppDescriptor:", v47);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0C99E40];
          -[WFAction output](self, "output");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "items");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "if_map:", &__block_literal_global_356);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "orderedSetWithArray:", v64);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "attributionWithDisclosureLevel:origin:originalItemIdentifiers:", v45, v65, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "attributionSetWithAttributions:", v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v75[1] = v52;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "attributionSetByMergingAttributionSets:", v53);
          v54 = objc_claimAutoreleasedReturnValue();

          v37 = (void *)v54;
LABEL_38:

        }
      }
      else
      {
        -[WFAction output](self, "output");
        v47 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject numberOfItems](v47, "numberOfItems"))
          goto LABEL_38;
        v57 = -[WFAction outputDisclosureLevel](self, "outputDisclosureLevel");

        if (v57 == 1)
        {
          getWFWorkflowExecutionLogObject();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          {
            -[WFAction identifier](self, "identifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v71 = "-[WFAction finishRunningWithError:]";
            v72 = 2112;
            v73 = v58;
            _os_log_impl(&dword_1C15B3000, v47, OS_LOG_TYPE_FAULT, "%s Action %@ produces private output and is not exempt from taint tracking, but is missing an appIdentifier", buf, 0x16u);

          }
          goto LABEL_38;
        }
      }
      -[WFAction output](self, "output");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "collectionByMergingAttributionSet:", v37);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction setOutput:](self, "setOutput:", v60);

LABEL_40:
      -[WFAction output](self, "output");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction setDefaultCoercionOptionsOnContentCollection:](self, "setDefaultCoercionOptionsOnContentCollection:", v61);

      -[WFAction output](self, "output");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction variableSource](self, "variableSource");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction setOutput:onVariableSource:](self, "setOutput:onVariableSource:", v62, v63);

      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __35__WFAction_finishRunningWithError___block_invoke_357;
      v68[3] = &unk_1E7AF92C0;
      v68[4] = self;
      v4 = v4;
      v69 = v4;
      -[WFAction dismissPresentedContentWithCompletionHandler:](self, "dismissPresentedContentWithCompletionHandler:", v68);

      goto LABEL_41;
    }
    v56 = (void *)MEMORY[0x1E0D13EC0];
    -[WFAction localizedName](self, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "populateBadCoercionError:withResponsibleComponent:", v4, v8);
    v30 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_41:

}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[WFAction dismissPresentedContentWithCompletionHandler:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Dismissing presented content", (uint8_t *)&v9, 0xCu);
  }

  -[WFAction userInterface](self, "userInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissPresentedContentWithCompletionHandler:", v4);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v3);

}

- (void)resetOutput
{
  -[WFAction setOutput:](self, "setOutput:", 0);
  -[WFAction setProgress:](self, "setProgress:", 0);
}

- (WFContentCollection)output
{
  WFContentCollection *output;
  WFContentCollection *v4;
  WFContentCollection *v5;

  output = self->_output;
  if (!output)
  {
    v4 = (WFContentCollection *)objc_opt_new();
    v5 = self->_output;
    self->_output = v4;

    output = self->_output;
  }
  return output;
}

- (void)setOutput:(id)a3 onVariableSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (-[WFAction runningInStepWiseExecutor](self, "runningInStepWiseExecutor"))
  {
    -[WFAction generateUUIDIfNecessaryWithUUIDProvider:](self, "generateUUIDIfNecessaryWithUUIDProvider:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setUUID:](self, "setUUID:", v7);

    -[WFAction UUID](self, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
LABEL_6:
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("-output"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContent:forVariableWithName:", v14, v13);

    goto LABEL_7;
  }
  -[WFAction UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
    objc_msgSend(WeakRetained, "variableAvailability");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionProvidingVariableWithOutputUUID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v8 = v9;
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)requestInterfacePresentationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFAction userInterfaceClasses](self, "userInterfaceClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_8;
  -[WFAction userInterface](self, "userInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRunningWithSiriUI");

  if (!v7)
  {
    -[WFAction userInterface](self, "userInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[WFAction userInterface](self, "userInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E7AECCE0;
      v15[4] = self;
      v16 = v4;
      objc_msgSend(v12, "requestActionInterfacePresentationForActionClassName:classNamesByType:completionHandler:", v14, v5, v15);

      goto LABEL_9;
    }
LABEL_8:
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_9;
  }
  getWFWorkflowExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFAction requestInterfacePresentationWithCompletionHandler:]";
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Action running in Siri needs to display UI, punching to Shortcuts", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

LABEL_9:
}

- (BOOL)prefersActionAttribution
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[WFAction appDefinition](self, "appDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFAction appDefinition](self, "appDefinition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC7920]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC7FD8]) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSArray)keyCommands
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)nameUpdated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __23__WFAction_nameUpdated__block_invoke;
  v2[3] = &unk_1E7AEC898;
  v2[4] = self;
  -[WFAction enumerateObservers:](self, "enumerateObservers:", v2);
}

- (void)outputDetailsUpdated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__WFAction_outputDetailsUpdated__block_invoke;
  v2[3] = &unk_1E7AEC898;
  v2[4] = self;
  -[WFAction enumerateObservers:](self, "enumerateObservers:", v2);
}

- (void)reloadAuxiliaryButton
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__WFAction_reloadAuxiliaryButton__block_invoke;
  v2[3] = &unk_1E7AEC898;
  v2[4] = self;
  -[WFAction enumerateObservers:](self, "enumerateObservers:", v2);
}

- (void)visibleParametersUpdated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__WFAction_visibleParametersUpdated__block_invoke;
  v2[3] = &unk_1E7AEC898;
  v2[4] = self;
  -[WFAction enumerateObservers:](self, "enumerateObservers:", v2);
}

- (void)addEventObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  void *v6;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[WFAction eventObservers](self, "eventObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeEventObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;
  void *v6;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[WFAction eventObservers](self, "eventObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)iconUpdated
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __23__WFAction_iconUpdated__block_invoke;
  v2[3] = &unk_1E7AEC898;
  v2[4] = self;
  -[WFAction enumerateObservers:](self, "enumerateObservers:", v2);
}

- (id)createAccompanyingActions
{
  return 0;
}

- (id)generateOutputUUIDForAction:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)availableVariableNames
{
  WFWorkflow **p_workflow;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  p_workflow = &self->_workflow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableVariableNamesAtIndex:", objc_msgSend(v7, "indexOfObject:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (NSArray)availableOutputActions
{
  WFWorkflow **p_workflow;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  p_workflow = &self->_workflow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableOutputActionsAtIndex:", objc_msgSend(v7, "indexOfObject:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (BOOL)hasAvailableVariables
{
  WFAction *v2;
  WFWorkflow **p_workflow;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;

  v2 = self;
  p_workflow = &self->_workflow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "areVariablesAvailableAtIndex:", objc_msgSend(v7, "indexOfObject:", v2));

  return (char)v2;
}

- (BOOL)hasAvailableActionOutputVariables
{
  WFAction *v2;
  WFWorkflow **p_workflow;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;

  v2 = self;
  p_workflow = &self->_workflow;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "areActionOutputVariablesAvailableAtIndex:", objc_msgSend(v7, "indexOfObject:", v2));

  return (char)v2;
}

- (BOOL)isVariableWithNameAvailable:(id)a3
{
  WFAction *v3;
  WFWorkflow **p_workflow;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v3 = self;
  p_workflow = &self->_workflow;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v7, "isVariableWithName:availableAtIndex:", v5, objc_msgSend(v9, "indexOfObject:", v3));

  return (char)v3;
}

- (BOOL)isVariableWithOutputUUIDAvailable:(id)a3
{
  WFAction *v3;
  WFWorkflow **p_workflow;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v3 = self;
  p_workflow = &self->_workflow;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v7, "isVariableWithOutputUUIDAvailable:atIndex:", v5, objc_msgSend(v9, "indexOfObject:", v3));

  return (char)v3;
}

- (id)actionProvidingVariableWithOutputUUID:(id)a3
{
  WFWorkflow **p_workflow;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  p_workflow = &self->_workflow;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionProvidingVariableWithOutputUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)actionsProvidingVariableName:(id)a3
{
  WFWorkflow **p_workflow;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  p_workflow = &self->_workflow;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionsProvidingVariableName:atIndex:", v5, objc_msgSend(v9, "indexOfObject:", self));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)possibleContentClassesForVariableNamed:(id)a3 context:(id)a4
{
  WFWorkflow **p_workflow;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  p_workflow = &self->_workflow;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(v11, "actions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "possibleContentClassesForVariableNamed:atIndex:context:excludingAction:", v8, objc_msgSend(v12, "indexOfObject:", self), v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)workflowInputClasses
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  objc_msgSend(WeakRetained, "effectiveInputClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addVariableObserver:(id)a3
{
  WFWorkflow **p_workflow;
  id v4;
  void *v5;
  id WeakRetained;

  p_workflow = &self->_workflow;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addVariableObserver:", v4);

}

- (void)removeVariableObserver:(id)a3
{
  WFWorkflow **p_workflow;
  id v4;
  void *v5;
  id WeakRetained;

  p_workflow = &self->_workflow;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  objc_msgSend(WeakRetained, "variableAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeVariableObserver:", v4);

}

- (id)providedVariableNames
{
  return 0;
}

- (void)didChangeVariableName:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFAction workflow](self, "workflow");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action:didChangeVariableName:to:", self, v7, v6);

}

- (NSString)UUID
{
  return (NSString *)-[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("UUID"), objc_opt_class());
}

- (void)setUUID:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v4, CFSTR("UUID"));

}

- (id)generateUUIDIfNecessaryWithUUIDProvider:(id)a3
{
  WFAction *v4;
  void *v5;
  WFAction *v6;
  WFAction *v7;

  v4 = (WFAction *)a3;
  -[WFAction UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (v4)
      v6 = v4;
    else
      v6 = self;
    v7 = v6;
    -[WFAction generateOutputUUIDForAction:](v7, "generateOutputUUIDForAction:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setUUID:](self, "setUUID:", v5);

  }
  return v5;
}

- (id)customOutputName
{
  return -[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("CustomOutputName"), objc_opt_class());
}

- (NSString)outputName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFAction customOutputName](self, "customOutputName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFAction localizedDefaultOutputName](self, "localizedDefaultOutputName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)setOutputName:(id)a3
{
  -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", a3, CFSTR("CustomOutputName"));
  -[WFAction nameUpdated](self, "nameUpdated");
}

- (BOOL)outputIsRenamed
{
  void *v2;
  BOOL v3;

  -[WFAction customOutputName](self, "customOutputName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)groupingIdentifier
{
  return (NSString *)-[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("GroupingIdentifier"), objc_opt_class());
}

- (void)setGroupingIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v6 = v5;
  if (v6 == v11)
  {

    v9 = v11;
  }
  else
  {
    if (v11 && v6)
    {
      v7 = objc_msgSend(v11, "isEqualToString:", v6);

      v8 = v11;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    -[WFAction workflow](self, "workflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionGroupingIdentifierWillChange:", self);

    -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v11, CFSTR("GroupingIdentifier"));
    -[WFAction workflow](self, "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionGroupingIdentifierDidChange:", self);
  }

  v8 = v11;
LABEL_10:

}

- (void)willBeAddedToWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  WFAction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  getWFGeneralLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WFAction wasAddedToWorkflowByUser:]";
    v9 = 2114;
    v10 = self;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s User added action %{public}@ to workflow", (uint8_t *)&v7, 0x16u);
  }

  -[WFAction inputParameterKey](self, "inputParameterKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[WFAction unlockInputParameter](self, "unlockInputParameter");
  }

}

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
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
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  if (!self->_parameters)
    -[WFAction initializeParametersWithLock](self, "initializeParametersWithLock");
  v4 = (void *)objc_opt_new();
  -[WFAction resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceObjectsConformingToProtocol:", &unk_1EF721F10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v6);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[WFAction parameters](self, "parameters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "resourceManager", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "resourceObjectsConformingToProtocol:", &unk_1EF721F10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v13);

        objc_msgSend(v11, "wasAddedToWorkflow");
        -[WFAction resourceManager](self, "resourceManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "referencedActionResourceClasses");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resourceObjectsOfClasses:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setActionResources:", v16);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF721F10))
          objc_msgSend(v4, "addObject:", v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  v19 = v23;
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "setWorkflow:", v19, v23);
      }
      v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  -[WFAction resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceObjectsConformingToProtocol:", &unk_1EF721F10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v6);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[WFAction parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "resourceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resourceObjectsConformingToProtocol:", &unk_1EF721F10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v14);

        objc_msgSend(v12, "setActionResources:", 0);
        objc_msgSend(v12, "wasRemovedFromWorkflow");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "setWorkflow:", 0, (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

  -[WFAction resetOutput](self, "resetOutput");
  objc_storeWeak((id *)&self->_workflow, 0);

}

- (Class)contentItemClass
{
  void *v2;
  NSString *v3;
  void *v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFContentItemClass"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)classesForTypeArray:(id)a3 includeAllOutputTypes:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSString *v13;
  Class v14;
  Class v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = 0x1E0D13000uLL;
    v10 = 0x1E0D14000uLL;
    v11 = 0x1E0D13000uLL;
    do
    {
      v12 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v13 = *(NSString **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        v14 = NSClassFromString(v13);
        if (v14)
        {
          v15 = v14;
          if (-[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_class()))
          {
            objc_msgSend(v32, "addObject:", v15);
            goto LABEL_18;
          }
          objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", v13);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)v16;
        objc_msgSend(*(id *)(v9 + 3792), "sharedRegistry");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "contentItemClassForType:", v17);

        if (v19 == objc_opt_class() || v19 == objc_opt_class() || !a4)
        {
          if (v19)
            objc_msgSend(v32, "addObject:", v19);
        }
        else
        {
          objc_msgSend(*(id *)(v9 + 3792), "sharedRegistry");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "contentItemClassesSupportingType:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v8;
          v23 = v11;
          v24 = v5;
          v25 = v9;
          v26 = v10;
          v27 = (void *)objc_msgSend(v21, "mutableCopy");

          objc_msgSend(v27, "removeObject:", NSClassFromString(CFSTR("WFWorkflowContentItem")));
          objc_msgSend(v27, "removeObject:", objc_opt_class());
          objc_msgSend(v32, "unionSet:", v27);

          v10 = v26;
          v9 = v25;
          v5 = v24;
          v11 = v23;
          v8 = v22;
          v7 = v30;
        }

LABEL_18:
        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(v32, "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSArray)specifiedInputContentClasses
{
  void *v3;
  void *v4;

  -[WFAction inputTypes](self, "inputTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction classesForTypeArray:includeAllOutputTypes:](self, "classesForTypeArray:includeAllOutputTypes:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)specifiedOutputContentClasses
{
  if (-[WFAction inputPassthrough](self, "inputPassthrough"))
    -[WFAction specifiedInputContentClasses](self, "specifiedInputContentClasses");
  else
    -[WFAction outputContentClasses](self, "outputContentClasses");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)inputContentClasses
{
  NSArray *inputContentClasses;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  inputContentClasses = self->_inputContentClasses;
  if (!inputContentClasses)
  {
    -[WFAction inputTypes](self, "inputTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction classesForTypeArray:includeAllOutputTypes:](self, "classesForTypeArray:includeAllOutputTypes:", v4, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_inputContentClasses;
    self->_inputContentClasses = v5;

    inputContentClasses = self->_inputContentClasses;
  }
  return inputContentClasses;
}

- (NSArray)outputContentClasses
{
  NSArray *v3;
  NSArray *outputContentClasses;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  if (-[WFAction inputPassthrough](self, "inputPassthrough"))
  {
    -[WFAction inputContentClasses](self, "inputContentClasses");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    outputContentClasses = self->_outputContentClasses;
    if (!outputContentClasses)
    {
      -[WFAction outputTypes](self, "outputTypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction classesForTypeArray:includeAllOutputTypes:](self, "classesForTypeArray:includeAllOutputTypes:", v5, 0);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_outputContentClasses;
      self->_outputContentClasses = v6;

      outputContentClasses = self->_outputContentClasses;
    }
    v3 = outputContentClasses;
  }
  return v3;
}

- (BOOL)showsConnectorToPreviousActionInWorkflow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  _BOOL4 v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_8;
  if (!v6)
  {
    if (-[WFAction containsVariableOfType:](self, "containsVariableOfType:", CFSTR("ExtensionInput")))
    {
      objc_msgSend(v4, "inputAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = v11 != 0;

      goto LABEL_9;
    }
LABEL_8:
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v6 - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_8;
  v10 = !-[WFAction ignoresOutputFromPreviousActionInWorkflow:](self, "ignoresOutputFromPreviousActionInWorkflow:", v4);
LABEL_9:

  return v10;
}

- (BOOL)ignoresOutputFromPreviousActionInWorkflow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 1;
  }
  else if (v6)
  {
    objc_msgSend(v4, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v6 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFAction ignoresOutputFromAction:inWorkflow:](self, "ignoresOutputFromAction:inWorkflow:", v9, v4);

  }
  else
  {
    v7 = -[WFAction ignoresOutputFromAction:inWorkflow:](self, "ignoresOutputFromAction:inWorkflow:", 0, v4);
  }

  return v7;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[WFAction inputParameter](self, "inputParameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[WFAction parameterSummary](self, "parameterSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      LOBYTE(self) = -[WFAction legacyBehaviorIgnoresOutputFromAction:inWorkflow:](self, "legacyBehaviorIgnoresOutputFromAction:inWorkflow:", v6, v7);
      goto LABEL_5;
    }
  }
  LODWORD(self) = !-[WFAction shouldBeConnectedToPreviousActionInWorkflow:withOutputsConsumedByFollowingActions:](self, "shouldBeConnectedToPreviousActionInWorkflow:withOutputsConsumedByFollowingActions:", v7, 0);
LABEL_5:

  return (char)self;
}

- (BOOL)legacyBehaviorIgnoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", self);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    -[WFAction inputContentClasses](self, "inputContentClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFAction containsVariableOfType:](self, "containsVariableOfType:", CFSTR("Input"))
      || !v9 && -[WFAction containsVariableOfType:](self, "containsVariableOfType:", CFSTR("ExtensionInput")))
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      v25 = v11;
      v26 = v7;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[WFAction containedVariablesOfClass:](self, "containedVariablesOfClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "outputUUID", v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "UUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqualToString:", v18);

            if ((v19 & 1) != 0)
            {
              LOBYTE(v10) = 0;
              v11 = v25;
              v7 = v26;
              goto LABEL_18;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v14)
            continue;
          break;
        }
      }

      if (-[WFAction inputRequired](self, "inputRequired"))
      {
        LOBYTE(v10) = 0;
        v11 = v25;
        v7 = v26;
      }
      else
      {
        v7 = v26;
        objc_msgSend(v26, "actions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v25;
        if (v9 >= objc_msgSend(v21, "count") - 1)
        {
          v12 = 0;
        }
        else
        {
          objc_msgSend(v26, "actions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndex:", v9 + 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (-[WFAction inputPassthrough](self, "inputPassthrough")
          && !objc_msgSend(v12, "legacyBehaviorIgnoresOutputFromAction:inWorkflow:", self, v26))
        {
          LOBYTE(v10) = 0;
        }
        else if (objc_msgSend(v25, "count", v25))
        {
          if (v9)
            objc_msgSend(v6, "inheritedOutputContentClassesInWorkflow:", v26);
          else
            objc_msgSend(v26, "effectiveInputClasses");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAction inputContentClasses](self, "inputContentClasses");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = !-[WFAction canHandleInputOfContentClasses:withSupportedClasses:](self, "canHandleInputOfContentClasses:withSupportedClasses:", v23, v24);

        }
        else
        {
          LOBYTE(v10) = 1;
        }
LABEL_18:

      }
    }

  }
  return v10;
}

- (BOOL)shouldBeConnectedToPreviousActionInWorkflow:(id)a3 withOutputsConsumedByFollowingActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", self);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else if (v9 || !-[WFAction containsVariableOfType:](self, "containsVariableOfType:", CFSTR("ExtensionInput")))
  {
    -[WFAction containedVariables](self, "containedVariables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v11, "if_compactMap:", &__block_literal_global_390);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

    if (v7)
      objc_msgSend(v7, "intersectSet:", v14);
    else
      v7 = v14;
    if (objc_msgSend(v7, "count"))
    {
      -[WFAction inputSourceInWorkflow:](self, "inputSourceInWorkflow:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "outputVariableWithVariableProvider:UUIDProvider:", self, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 && (objc_msgSend(v16, "snappingPassthrough") & 1) == 0)
        {
          objc_msgSend(v17, "UUID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v10 = objc_msgSend(v14, "containsObject:", v18);
          else
            v10 = 0;

        }
        else
        {
          v10 = objc_msgSend(v16, "shouldBeConnectedToPreviousActionInWorkflow:withOutputsConsumedByFollowingActions:", v6, v7);
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4
{
  return -[WFAction canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:](self, "canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:", a3, a4, 0);
}

- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4 includingCoercedTypes:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t j;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v5 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v8 = a4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v52;
    v33 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v14 = v7;
        v37 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (!v37)
          goto LABEL_41;
        v38 = *(_QWORD *)v48;
        v34 = v10;
        while (2)
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v48 != v38)
              objc_enumerationMutation(v14);
            v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            if ((objc_msgSend(v16, "isSubclassOfClass:", v13) & 1) != 0 || v16 == (void *)objc_opt_class())
              goto LABEL_45;
            if (v16 == (void *)objc_opt_class())
            {
              v45 = 0u;
              v46 = 0u;
              v43 = 0u;
              v44 = 0u;
              objc_msgSend(v13, "supportedTypes");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
              if (v20)
              {
                v21 = v20;
                v32 = v5;
                v35 = v8;
                v36 = v7;
                v22 = *(_QWORD *)v44;
LABEL_20:
                v23 = 0;
                while (1)
                {
                  if (*(_QWORD *)v44 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v23);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v24, "isDeclared") & 1) != 0)
                    goto LABEL_44;
                  if (v21 == ++v23)
                  {
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
                    if (v21)
                      goto LABEL_20;
LABEL_37:
                    v8 = v35;
                    v7 = v36;
                    v5 = v32;
                    goto LABEL_38;
                  }
                }
              }
              goto LABEL_38;
            }
            if (v13 == (void *)objc_opt_class())
            {
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              objc_msgSend(v16, "allSupportedTypes");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
              if (v25)
              {
                v26 = v25;
                v32 = v5;
                v35 = v8;
                v36 = v7;
                v27 = *(_QWORD *)v40;
LABEL_30:
                v28 = 0;
                while (1)
                {
                  if (*(_QWORD *)v40 != v27)
                    objc_enumerationMutation(v19);
                  v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v28);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v29, "isDeclared") & 1) != 0)
                    break;
                  if (v26 == ++v28)
                  {
                    v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
                    if (v26)
                      goto LABEL_30;
                    goto LABEL_37;
                  }
                }
LABEL_44:

                v8 = v35;
                v7 = v36;
LABEL_45:

                v30 = 1;
                goto LABEL_47;
              }
LABEL_38:

              continue;
            }
            if (v5)
            {
              objc_msgSend(v16, "supportedItemClasses");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsObject:", v13);

              if ((v18 & 1) != 0)
                goto LABEL_45;
            }
          }
          v11 = v33;
          v10 = v34;
          v37 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v37)
            continue;
          break;
        }
LABEL_41:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      v30 = 0;
      if (!v10)
        goto LABEL_47;
    }
  }
  v30 = 0;
LABEL_47:

  return v30;
}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v5;
  WFActionOutputVariable *v6;

  v5 = a3;
  if (+[WFVariableAvailability actionIsEligibleForOutputVariable:](WFVariableAvailability, "actionIsEligibleForOutputVariable:", self))
  {
    v6 = -[WFActionOutputVariable initWithAction:variableProvider:aggrandizements:]([WFActionOutputVariable alloc], "initWithAction:variableProvider:aggrandizements:", self, v5, 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)inputSourceInWorkflow:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self);
  v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "objectAtIndex:", v5 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)inheritedInputVariableInWorkflow:(id)a3
{
  return -[WFAction inheritedInputVariableInWorkflow:ignoringInputTypes:](self, "inheritedInputVariableInWorkflow:ignoringInputTypes:", a3, 0);
}

- (id)inheritedInputVariableInWorkflow:(id)a3 ignoringInputTypes:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  WFAction *v9;
  void *v10;
  uint64_t v11;
  WFAction *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;
  _BOOL4 v27;
  WFShortcutInputVariable *v28;
  void *v29;
  WFAction *v32;
  void *v33;

  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99E40]);
  objc_msgSend(v5, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  v9 = self;
  v10 = (void *)objc_opt_new();
  v32 = v9;
  v33 = (void *)objc_opt_new();
  while (1)
  {
    v11 = objc_msgSend(v8, "indexOfObject:", v9);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_21;
    if (!v11)
    {
      objc_msgSend(v5, "inputAction");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_21;
      v20 = (void *)v19;
      objc_msgSend(v5, "effectiveInputClasses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction inputContentClasses](v9, "inputContentClasses");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[WFAction canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:](v9, "canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:", v21, v22, 1);

      if (v23)
        v28 = -[WFShortcutInputVariable initWithVariableProvider:aggrandizements:]([WFShortcutInputVariable alloc], "initWithVariableProvider:aggrandizements:", v32, 0);
      else
LABEL_21:
        v28 = 0;
      v29 = v33;
      goto LABEL_35;
    }
    if ((objc_msgSend(v10, "containsObject:", v9) & 1) != 0)
      goto LABEL_21;
    objc_msgSend(v10, "addObject:", v9);
    -[WFAction inputSourceInWorkflow:](v9, "inputSourceInWorkflow:", v5);
    v12 = (WFAction *)objc_claimAutoreleasedReturnValue();
    if (+[WFVariableAvailability actionIsEligibleForOutputVariable:](WFVariableAvailability, "actionIsEligibleForOutputVariable:", v12))
    {
      v13 = 1;
    }
    else
    {
      -[WFAction providedVariableNames](v12, "providedVariableNames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "count") != 0;

    }
    if (-[WFAction snappingPassthrough](v12, "snappingPassthrough"))
      goto LABEL_17;
    if (-[WFAction blocksSnapping](v12, "blocksSnapping"))
    {
      v28 = 0;
      v29 = v33;
      goto LABEL_34;
    }
    if (v13)
      break;
    -[WFAction containedVariables](v12, "containedVariables");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
    {
      v28 = 0;
      v29 = v33;
      goto LABEL_33;
    }
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v15, "if_compactMap:", &__block_literal_global_393);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);

    if (objc_msgSend(v33, "count"))
    {
      if (!objc_msgSend(v33, "intersectsSet:", v18))
      {
        v28 = 0;
        v29 = v33;
        goto LABEL_32;
      }
    }
    else
    {
      objc_msgSend(v33, "unionSet:", v18);
    }

LABEL_17:
    v9 = v12;
  }
  -[WFAction outputVariableWithVariableProvider:UUIDProvider:](v12, "outputVariableWithVariableProvider:UUIDProvider:", v32, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v33;
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v15, "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v33, "containsObject:", v24);

    if (!v25)
    {
      v28 = 0;
      goto LABEL_33;
    }
  }
  -[WFAction inheritedOutputContentClassesInWorkflow:](v12, "inheritedOutputContentClassesInWorkflow:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4
    || (-[WFAction inputContentClasses](v9, "inputContentClasses"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = -[WFAction canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:](v9, "canHandleInputOfContentClasses:withSupportedClasses:includingCoercedTypes:", v18, v26, 1), v26, v27))
  {
    -[WFAction outputVariableWithVariableProvider:UUIDProvider:](v12, "outputVariableWithVariableProvider:UUIDProvider:", v32, 0);
    v28 = (WFShortcutInputVariable *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
  return v28;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFAction inheritedOutputContentClassesInWorkflow:context:](self, "inheritedOutputContentClassesInWorkflow:context:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (-[WFAction inputTypePassthrough](self, "inputTypePassthrough"))
  {
    objc_msgSend(v6, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", self);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = 0;
    }
    else
    {
      v10 = v9;
      if (!v9)
      {
        -[WFAction workflow](self, "workflow");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "effectiveInputClasses");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v17 = (void *)v12;
LABEL_18:

        goto LABEL_19;
      }
      if ((objc_msgSend(v7, "containsObject:", self) & 1) == 0)
      {
        objc_msgSend(v7, "addObject:", self);
        objc_msgSend(v8, "objectAtIndex:", v10 - 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "inheritedOutputContentClassesInWorkflow:context:", v6, v7);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }
LABEL_19:

    goto LABEL_20;
  }
  if (-[WFAction inputTypeDeterminesOutputType](self, "inputTypeDeterminesOutputType"))
  {
    -[WFAction inputParameter](self, "inputParameter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[WFAction inputParameter](self, "inputParameter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "key");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "variable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_msgSend(v7, "containsObject:", self) & 1) == 0)
      {
        objc_msgSend(v7, "addObject:", self);
        objc_msgSend(v11, "possibleAggrandizedContentClassesWithContext:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = (void *)MEMORY[0x1E0C9AA60];
      }
      goto LABEL_18;
    }
  }
  if ((objc_msgSend(v7, "containsObject:", self) & 1) != 0)
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "addObject:", self);
    -[WFAction outputContentClasses](self, "outputContentClasses");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:

  return v17;
}

- (BOOL)supportsUserInterfaceType:(id)a3
{
  return !-[WFAction requiresHandoffWhenRunWithUserInterfaceType:](self, "requiresHandoffWhenRunWithUserInterfaceType:", a3);
}

- (BOOL)requiresHandoffWhenRunWithUserInterfaceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v4 = a3;
  -[WFAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldNotHandoff");

    if ((v7 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  -[WFAction resourceManager](self, "resourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentlyRequiresResourceOfClass:", objc_opt_class());

  if (!v9)
  {
LABEL_8:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  -[WFAction userInterfaceTypes](self, "userInterfaceTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_msgSend(v10, "containsObject:", v4) ^ 1;
  }
  else if (v4)
  {
    LOBYTE(v11) = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D14320]);
  }
  else
  {
    LOBYTE(v11) = 1;
  }

LABEL_13:
  return v11;
}

- (BOOL)isDisabledWhenRunOnDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFAction resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceObjectsOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "isAvailable"))
        {
          v22 = 1;
          v14 = v7;
          goto LABEL_26;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[WFAction resourceManager](self, "resourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceObjectsOfClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "isAvailable", (_QWORD)v24))
        {
          v22 = 1;
          v19 = v14;
          goto LABEL_25;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v16)
        continue;
      break;
    }
  }

  -[WFAction disabledOnPlatforms](self, "disabledOnPlatforms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    v20 = objc_msgSend(v4, "idiom");
    if (v20 >= 6)
    {
      v21 = 0;
      v22 = 0;
    }
    else
    {
      v21 = off_1E7AF12C8[v20];
      v22 = objc_msgSend(v19, "containsObject:", v21);
    }

  }
  else
  {
    v22 = 0;
  }
LABEL_25:

LABEL_26:
  return v22;
}

- (BOOL)isLastAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "indexOfObject:", self);
    v6 = v5 == objc_msgSend(v4, "count") - 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)unlockInputParameter
{
  void *v3;
  id v4;

  if (!-[WFAction inputParameterUnlocked](self, "inputParameterUnlocked"))
  {
    -[WFAction inputParameter](self, "inputParameter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[WFAction setInputParameterUnlocked:](self, "setInputParameterUnlocked:", 1);
      v3 = v4;
    }

  }
}

- (void)lockInputParameter
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  WFAction *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[WFAction inputParameterUnlocked](self, "inputParameterUnlocked"))
  {
    getWFGeneralLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[WFAction lockInputParameter]";
      v6 = 2114;
      v7 = self;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s Locking input parameter of action: %{public}@", (uint8_t *)&v4, 0x16u);
    }

    -[WFAction setInputParameterUnlocked:](self, "setInputParameterUnlocked:", 0);
  }
}

- (void)snapInputParameterIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  WFAction *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[WFAction inputParameter](self, "inputParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || !-[WFAction inputParameterUnlocked](self, "inputParameterUnlocked"))
    goto LABEL_18;
  -[WFAction workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction inheritedInputVariableInWorkflow:](self, "inheritedInputVariableInWorkflow:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_14;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[WFAction snapInputParameterIfNecessary]";
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = self;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Found input variable: %{public}@, for action: %{public}@", (uint8_t *)&v16, 0x20u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v9, "variable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stateByReplacingVariable:withVariable:", v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_15;
  }
  v12 = (objc_class *)objc_msgSend(v3, "stateClass");
  if (!-[objc_class instancesRespondToSelector:](v12, "instancesRespondToSelector:", sel_initWithVariable_))
  {
    getWFGeneralLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "-[WFAction snapInputParameterIfNecessary]";
      v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Unsupported parameter state type for input variable: %{public}@", (uint8_t *)&v16, 0x16u);

    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v11 = (void *)objc_msgSend([v12 alloc], "initWithVariable:", v5);
LABEL_15:
  if ((objc_msgSend(v7, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(v3, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setParameterState:forKey:](self, "setParameterState:forKey:", v11, v15);

    -[WFAction setInputParameterUnlocked:](self, "setInputParameterUnlocked:", 1);
  }

LABEL_18:
}

- (id)actionForAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFAction *v7;

  v4 = a3;
  -[WFAction displayableAppDescriptor](self, "displayableAppDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", v4);
  if ((_DWORD)v5)
    v7 = self;
  else
    v7 = 0;

  return v7;
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  BOOL v11;
  _BOOL4 v12;
  void *v13;
  void *v14;

  -[WFAction appDescriptor](self, "appDescriptor", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFAction appDescriptor](self, "appDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WFMCIsAppAccountBasedSourceForOpenIn(v7);
    v9 = v8;

    if ((v9 & 1) != 0)
      goto LABEL_5;
  }
  -[WFAction appDescriptor](self, "appDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[WFAction locallyProcessesData](self, "locallyProcessesData");

    if (v11)
    {
LABEL_5:
      v10 = 0;
      return v10;
    }
    v12 = -[WFAction highRisk](self, "highRisk");
    v13 = (void *)MEMORY[0x1E0D13E00];
    -[WFAction appDescriptor](self, "appDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v13, "locationWithAppDescriptor:promptingBehaviour:", v14, 1);
    else
      objc_msgSend(v13, "locationWithAppDescriptor:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[WFAction contentDestinationWithError:](self, "contentDestinationWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFSecurityLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    -[WFAction identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[WFAction smartPromptWithContentDescription:contentDestination:workflowName:]";
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Action %{public}@ is presenting a smart prompt, but it does not have a custom smart prompt string.", buf, 0x16u);

  }
  if (v8)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Allow “%@” to share %@ with “%@”?"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v10, v8, v9);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    if (v9)
    {
      WFLocalizedString(CFSTR("Allow “%@” to access “%@”?"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v14, v10, v9, v19);
    }
    else
    {
      WFLocalizedString(CFSTR("Allow “%@” to access another app?"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v14, v10, v18, v19);
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (v7)
    {
      WFLocalizedString(CFSTR("Previously this shortcut was allowed to share %1$@ with “%2$@”."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v6, v7);
    }
    else
    {
      WFLocalizedString(CFSTR("Previously this shortcut was allowed to share %1$@."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v6, v12);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)unlockAppProtectionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[WFAction appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAction userInterface](self, "userInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRunningWithExternalUI");

  if (v8)
  {
    -[WFAction userInterface](self, "userInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E7AF8548;
    v15[4] = self;
    v16 = v4;
    v10 = v4;
    objc_msgSend(v9, "handleAppProtectionRequestWithBundleIdentifier:completionHandler:", v6, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9690], "sharedGuard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E7AF8860;
    v14 = v4;
    v12 = v4;
    objc_msgSend(v11, "authenticateForSubject:completion:", v10, v13);

  }
}

- (BOOL)allowsAnyURLDestinationWhenAddedToWorkflowByUser
{
  return 0;
}

- (NSArray)supportedAppIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[WFAction appDescriptor](self, "appDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (BOOL)showsImplicitChooseFromListWhenRunWithInput:(id)a3
{
  BOOL v4;
  void *v5;

  if (objc_msgSend(a3, "numberOfItems") < 2 || -[WFAction inputsMultipleItems](self, "inputsMultipleItems"))
    return 0;
  -[WFAction inputContentClasses](self, "inputContentClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "count") != 0;

  return v4;
}

- (BOOL)requiresUserInteractionWhenRunWithInput:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[WFAction resourceManager](self, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "currentlyRequiresResourceOfClass:", objc_opt_class()) & 1) != 0
    || !objc_msgSend(v5, "resourcesAvailable")
    || -[WFAction showsImplicitChooseFromListWhenRunWithInput:](self, "showsImplicitChooseFromListWhenRunWithInput:", v4);

  return v6;
}

- (NSString)localizedDefaultDisambiguationPrompt
{
  return (NSString *)WFLocalizedString(CFSTR("Which one?"));
}

- (BOOL)runningInStepWiseExecutor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRunningContextForAction:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isStepwise");
  return (char)v5;
}

- (BOOL)runningInToolKit
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRunningContextForAction:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8498]);

  return v8;
}

- (id)minimumSupportedClientVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WFAction containedVariables](self, "containedVariables", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = CFSTR("411");
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "requiresModernVariableSupport") & 1) != 0)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        v6 = CFSTR("0");
        break;
      }
    }
  }
  else
  {
    v6 = CFSTR("0");
  }

  return (id)v6;
}

- (void)setDefaultCoercionOptionsOnContentCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D13E50];
  v9 = *MEMORY[0x1E0D14178];
  v5 = a3;
  -[WFAction contentPermissionRequestor](self, "contentPermissionRequestor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDefaultCoercionOptions:", v8);
}

- (void)setDefaultCoercionOptionsOnInputs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFAction setDefaultCoercionOptionsOnContentCollection:](self, "setDefaultCoercionOptionsOnContentCollection:", self->_input);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[WFAction processedParameters](self, "processedParameters", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[WFAction setDefaultCoercionOptionsOnContentCollection:](self, "setDefaultCoercionOptionsOnContentCollection:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (WFContactStore)contactStore
{
  void *v2;
  void *v3;

  -[WFAction contentPermissionRequestor](self, "contentPermissionRequestor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFContactStore *)v3;
}

- (id)contextualActionsForSurface:(unint64_t)a3
{
  return 0;
}

- (void)matchContextualAction:(id)a3 toContentCollection:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (NSString)externalMetricsBundleIdentifier
{
  return 0;
}

- (NSString)externalMetricsActionIdentifier
{
  return 0;
}

- (BOOL)allowSessionKitSessionsIfNeededWithConfiguration:(id)a3 isManualInvocation:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  WFActionWillTakeSessionKitAssertionTestingEvent *v16;
  WFSessionKitAssertion *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  id v30;
  id v31[2];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  NSObject *v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAction.m"), 2960, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionConfiguration"));

  }
  -[WFAction sessionKitAssertion](self, "sessionKitAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 1;
  }
  else
  {
    -[WFAction sessionKitSessionInvocationType](self, "sessionKitSessionInvocationType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (v6 && (objc_msgSend(v12, "isEqualToString:", CFSTR("Manual")) & 1) == 0)
      {
        getWFSessionKitLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]";
          _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_FAULT, "%s Tried to manually invoke a session, but the session invocation type is not manual?", buf, 0xCu);
        }
        v11 = 0;
      }
      else
      {
        objc_msgSend(v9, "bundleIdentifier");
        v14 = objc_claimAutoreleasedReturnValue();
        getWFSessionKitLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]";
          v34 = 2112;
          v35 = v14;
          _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_DEFAULT, "%s Attempting to take SessionKit assertion for %@...", buf, 0x16u);
        }

        v16 = -[WFActionWillTakeSessionKitAssertionTestingEvent initWithAction:sessionConfiguration:]([WFActionWillTakeSessionKitAssertionTestingEvent alloc], "initWithAction:sessionConfiguration:", self, v9);
        if (-[WFAction synchronouslyHandleTestingEvent:error:](self, "synchronouslyHandleTestingEvent:error:", v16, a5))
        {
          v17 = -[WFSessionKitAssertion initWithBundleIdentifier:]([WFSessionKitAssertion alloc], "initWithBundleIdentifier:", v14);
          -[WFAction runningDelegate](self, "runningDelegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak((id *)buf, self);
          v19 = MEMORY[0x1E0C809B0];
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke;
          v27[3] = &unk_1E7AECD98;
          objc_copyWeak(v31, (id *)buf);
          v20 = v18;
          v28 = v20;
          v29 = v14;
          v31[1] = (id)a2;
          v30 = v9;
          -[WFSessionKitAssertion setResultHandler:](v17, "setResultHandler:", v27);
          v24[0] = v19;
          v24[1] = 3221225472;
          v24[2] = __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_454;
          v24[3] = &unk_1E7AEFE38;
          objc_copyWeak(&v26, (id *)buf);
          v21 = v20;
          v25 = v21;
          -[WFSessionKitAssertion setFailureHandler:](v17, "setFailureHandler:", v24);
          v11 = -[WFSessionKitAssertion takeWithError:](v17, "takeWithError:", a5);
          -[WFAction setSessionKitAssertion:](self, "setSessionKitAssertion:", v17);
          -[WFAction setExtendedOperation:](self, "setExtendedOperation:", v17);

          objc_destroyWeak(&v26);
          objc_destroyWeak(v31);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      v11 = 1;
    }

  }
  return v11;
}

- (BOOL)allowSessionKitSessionsIfNeededWithConfiguration:(id)a3 error:(id *)a4
{
  return -[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:](self, "allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:", a3, 1, a4);
}

- (BOOL)takeSessionKitAssertionIfNeededWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  getWFSessionKitLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315138;
    v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Trying to see if we should take a session assertion...", (uint8_t *)&v13, 0xCu);
  }

  -[WFAction sessionKitSessionInvocationType](self, "sessionKitSessionInvocationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Manual"));

  if (v7)
  {
    getWFSessionKitLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Action says it's going to take assertion itself...", (uint8_t *)&v13, 0xCu);
    }
LABEL_13:
    v11 = 1;
    goto LABEL_14;
  }
  -[WFAction sessionKitSessionConfiguration](self, "sessionKitSessionConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();
  getWFSessionKitLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEBUG, "%s It doesn't look like we are dealing with a session here. See you later!", (uint8_t *)&v13, 0xCu);
    }

    v8 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Found a session configuration! Taking it...", (uint8_t *)&v13, 0xCu);
  }

  v11 = -[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:](self, "allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:", v8, 0, a3);
LABEL_14:

  return v11;
}

- (BOOL)isTesting
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTesting");

  return v6;
}

- (void)handleTestingEvent:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[WFAction runningDelegate](self, "runningDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFAction runningDelegate](self, "runningDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "action:handleTestingEvent:completionHandler:", self, v10, v6);

  }
  else
  {
    v6[2](v6, 1, 0);
  }

}

- (BOOL)synchronouslyHandleTestingEvent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  if (-[WFAction isTesting](self, "isTesting"))
  {
    v7 = dispatch_semaphore_create(0);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7848;
    v15 = __Block_byref_object_dispose__7849;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__WFAction_synchronouslyHandleTestingEvent_error___block_invoke;
    v10[3] = &unk_1E7AF54E8;
    v10[4] = &v17;
    v10[5] = &v11;
    -[WFAction handleTestingEvent:completionHandler:](self, "handleTestingEvent:completionHandler:", v6, v10);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (a4)
      *a4 = objc_retainAutorelease((id)v12[5]);
    v8 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", a3);
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
  objc_msgSend(v5, "variable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "collectionFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "systemEntityCollectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a4;
  WFLocalizedString(CFSTR("Suggestions Not Found"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("The specified action has no suggestions available"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2D50];
  v11[0] = *MEMORY[0x1E0CB2D68];
  v11[1] = v8;
  v12[0] = v5;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, 0, v10);
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  return 0;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void)setContentAttributionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_contentAttributionTracker, a3);
}

- (void)setAppDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptor, a3);
}

- (WFActionAuxiliaryButton)auxiliaryButton
{
  return self->_auxiliaryButton;
}

- (void)setAuxiliaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryButton, a3);
}

- (WFToolInvocation)toolInvocation
{
  return self->_toolInvocation;
}

- (void)setToolInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_toolInvocation, a3);
}

- (BOOL)inputParameterUnlocked
{
  return self->_inputParameterUnlocked;
}

- (void)setInputParameterUnlocked:(BOOL)a3
{
  self->_inputParameterUnlocked = a3;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (void)setUserInterface:(id)a3
{
  objc_storeStrong((id *)&self->_userInterface, a3);
}

- (void)setVariableSource:(id)a3
{
  objc_storeStrong((id *)&self->_variableSource, a3);
}

- (void)setContentPermissionRequestor:(id)a3
{
  objc_storeStrong((id *)&self->_contentPermissionRequestor, a3);
}

- (NSMutableDictionary)encodedSerializedParameters
{
  return self->_encodedSerializedParameters;
}

- (NSMutableDictionary)decodedParameterStates
{
  return self->_decodedParameterStates;
}

- (NSMutableDictionary)expandingParameters
{
  return self->_expandingParameters;
}

- (void)setIgnoredParameterKeysForProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredParameterKeysForProcessing, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (os_unfair_lock_s)parameterInitializationLock
{
  return self->_parameterInitializationLock;
}

- (os_unfair_lock_s)parameterStateDeserializationLock
{
  return self->_parameterStateDeserializationLock;
}

- (WFActionRemoteUserInterface)actionUserInterface
{
  return self->_actionUserInterface;
}

- (void)setActionUserInterface:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserInterface, a3);
}

- (NSArray)currentGeneratedResourceNodes
{
  return self->_currentGeneratedResourceNodes;
}

- (NSArray)currentUnevaluatedResourceNodes
{
  return self->_currentUnevaluatedResourceNodes;
}

- (void)setCurrentUnevaluatedResourceNodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (os_unfair_lock_s)resourceManagerLock
{
  return self->_resourceManagerLock;
}

- (WFSessionKitAssertion)sessionKitAssertion
{
  return self->_sessionKitAssertion;
}

- (void)setSessionKitAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_sessionKitAssertion, a3);
}

- (void)setEffectiveWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveWorkQueue, a3);
}

- (void)setProcessedParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (WFActionRunningDelegate)runningDelegate
{
  return self->_runningDelegate;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setAppResource:(id)a3
{
  objc_storeStrong((id *)&self->_appResource, a3);
}

- (void)setWidgetSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSSet)allowedOnceSmartPromptStates
{
  return self->_allowedOnceSmartPromptStates;
}

- (void)setAllowedOnceSmartPromptStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  self->_didRunRemotely = a3;
}

- (WFActionExtendedOperation)extendedOperation
{
  return self->_extendedOperation;
}

- (void)setExtendedOperation:(id)a3
{
  objc_storeStrong((id *)&self->_extendedOperation, a3);
}

- (WFContextualActionSuggestionMetadata)suggestionMetadata
{
  return self->_suggestionMetadata;
}

- (void)setSuggestionMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionMetadata, a3);
}

void __50__WFAction_synchronouslyHandleTestingEvent_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  void (**v8)(_QWORD);
  id WeakRetained;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  uint32_t v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setSessionKitAssertion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "action:didDecideRunningProgressIsAllowed:", WeakRetained, a3 ^ 1u);
  getWFSessionKitLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((a3 & 1) == 0)
  {
    if (v11)
    {
      v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      v38 = 2112;
      v39 = v15;
      v12 = "%s SessionKit assertion was granted, but %@ did not start a session. Bummer!";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
LABEL_13:
      _os_log_impl(&dword_1C15B3000, v13, v14, v12, buf, v16);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s SessionKit session started, have fun!", buf, 0xCu);
  }

  if (!objc_msgSend(v7, "count"))
  {
    getWFSessionKitLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      v12 = "%s Session started, but we don't have an identifier for it?";
      v13 = v10;
      v14 = OS_LOG_TYPE_FAULT;
      goto LABEL_12;
    }
LABEL_14:

    v8[2](v8);
    goto LABEL_15;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    getWFSessionKitLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      v12 = "%s We allowed the app to start a session, but it started multiple. We don't know which one to toast!";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
      v16 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v7, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), WeakRetained, CFSTR("WFAction.m"), 3017, CFSTR("Should have only one session identifier"));

  }
  objc_msgSend(v7, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)*MEMORY[0x1E0DC84D8];
  objc_msgSend(WeakRetained, "runningDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "runningDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentRunningContextForAction:", WeakRetained);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "runSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;

      v18 = v25;
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "toastDurationForRunSource:", v18);
  v27 = v26;
  getWFSessionKitLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v27 == 0.0)
  {
    if (v29)
    {
      objc_msgSend(WeakRetained, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke_2";
      v38 = 2112;
      v39 = v17;
      v40 = 2114;
      v41 = v31;
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s We'd toast the session %@, but the action is asking for no toasting (see SessionConfiguration#ToastDuration key in the action definition %{public}@)", buf, 0x20u);

    }
  }
  else
  {
    if (v29)
    {
      objc_msgSend(WeakRetained, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      v38 = 2112;
      v39 = v17;
      v40 = 2114;
      v41 = v30;
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Asking the daemon to toast the session %@ for action %{public}@", buf, 0x20u);

    }
    if (v27 == -1.0)
    {
      v28 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_451;
    v34[3] = &unk_1E7AF4A38;
    v35 = v8;
    objc_msgSend(v32, "toastSessionKitSessionWithIdentifier:forDuration:completion:", v17, v28, v34);

  }
LABEL_15:

}

void __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_454(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSessionKitAssertion:", 0);
  getWFSessionKitLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Failed to start SessionKit session: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "action:didDecideRunningProgressIsAllowed:", WeakRetained, 1);
  objc_msgSend(WeakRetained, "finishRunningWithError:", v3);

}

uint64_t __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_451(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__WFAction_inheritedInputVariableInWorkflow_ignoringInputTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

uint64_t __94__WFAction_shouldBeConnectedToPreviousActionInWorkflow_withOutputsConsumedByFollowingActions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __23__WFAction_iconUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionIconDidChange:", *(_QWORD *)(a1 + 32));

}

void __36__WFAction_visibleParametersUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionVisibleParametersDidChange:", *(_QWORD *)(a1 + 32));

}

void __33__WFAction_reloadAuxiliaryButton__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionReloadAuxiliaryButton:", *(_QWORD *)(a1 + 32));

}

void __32__WFAction_outputDetailsUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionOutputDetailsDidChange:", *(_QWORD *)(a1 + 32));

}

void __23__WFAction_nameUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionNameDidChange:", *(_QWORD *)(a1 + 32));

}

void __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isRunning") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setActionUserInterface:", v5);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke_364;
    block[3] = &unk_1E7AF8378;
    v12 = *(id *)(a1 + 40);
    v10 = v5;
    v11 = v6;
    dispatch_async(v7, block);

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFAction requestInterfacePresentationWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Action is not running during the completion of a UI presentation request, returning", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke_364(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __35__WFAction_finishRunningWithError___block_invoke_357(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD block[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__WFAction_finishRunningWithError___block_invoke_2;
  block[3] = &unk_1E7AF92C0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  dispatch_async(v2, block);

  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __35__WFAction_finishRunningWithError___block_invoke_3;
  v5[3] = &unk_1E7AF94B0;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __35__WFAction_finishRunningWithError___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[27];
  if (v3)
  {
    objc_msgSend(v2, "output");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, *(_QWORD *)(a1 + 40));

    v2 = *(_QWORD **)(a1 + 32);
    v5 = (void *)v2[27];
  }
  else
  {
    v5 = 0;
  }
  v2[27] = 0;

}

uint64_t __35__WFAction_finishRunningWithError___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__WFAction_finishRunningWithError___block_invoke_4;
  v3[3] = &unk_1E7AEC898;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateObservers:", v3);
}

void __35__WFAction_finishRunningWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionRunningStateDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __35__WFAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cachingIdentifier");
}

uint64_t __50__WFAction_prepareToProcessWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __36__WFAction_checkUserInterfaceAndRun__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "app");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isRestricted");

    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v6 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("This action could not be run because “%@” is restricted."));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "finishRunningWithError:", v12);

LABEL_4:
      return;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "highRisk")
      || +[WFShortcutsSecuritySettings areScriptingActionsEnabled](WFShortcutsSecuritySettings, "areScriptingActionsEnabled")|| (objc_msgSend(*(id *)(a1 + 32), "requiresRemoteExecution") & 1) != 0)
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "requiresRemoteExecution");
      v14 = *(void **)(a1 + 32);
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 2, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "finishRunningWithError:");

        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "userInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userInterfaceType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(a1 + 32), "requiresHandoffWhenRunWithUserInterfaceType:", v7))
      {
        v16 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "finishRunningWithError:", v17);

      }
      else
      {
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v18, "effectiveWorkQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __36__WFAction_checkUserInterfaceAndRun__block_invoke_2;
        v24[3] = &unk_1E7AF94B0;
        v24[4] = *(_QWORD *)(a1 + 32);
        +[WFActionRateLimiter performAction:onQueue:withBlock:](WFActionRateLimiter, "performAction:onQueue:withBlock:", v18, v19, v24);

      }
      goto LABEL_4;
    }
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v20, "localizedName");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    +[WFShortcutsSecuritySettings scripingActionDisabledErrorWithActionName:](WFShortcutsSecuritySettings, "scripingActionDisabledErrorWithActionName:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "finishRunningWithError:", v21);

  }
}

uint64_t __36__WFAction_checkUserInterfaceAndRun__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__WFAction_checkUserInterfaceAndRun__block_invoke_3;
  v3[3] = &unk_1E7AEE348;
  v3[4] = v1;
  return objc_msgSend(v1, "requestUnlockIfNeeded:", v3);
}

void __36__WFAction_checkUserInterfaceAndRun__block_invoke_3(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v3, "runningDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "mightSuppressRunningProgress") & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "action:didDecideRunningProgressIsAllowed:", *(_QWORD *)(a1 + 32), 1);
    }
    v5 = *(void **)(a1 + 32);
    v9 = 0;
    v6 = objc_msgSend(v5, "takeSessionKitAssertionIfNeededWithError:", &v9);
    v7 = v9;
    v8 = *(_QWORD **)(a1 + 32);
    if ((v6 & 1) != 0)
      objc_msgSend(v8, "runAsynchronouslyWithInput:", v8[16]);
    else
      objc_msgSend(v8, "finishRunningWithError:", v7);

  }
  else
  {
    objc_msgSend(v3, "finishRunningWithError:");
  }
}

void __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "runningDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentItemCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke_2;
    v8[3] = &unk_1E7AF7B78;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "performDataAccessChecksWithUserInterface:contentItemCache:completionHandler:", v4, v6, v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v7);

  }
}

void __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "code") == 3)
      v4 = 0;
    else
      v4 = v5;
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDefaultCoercionOptionsOnInputs");
    objc_msgSend(*(id *)(a1 + 32), "checkUserInterfaceAndRun");
  }

}

uint64_t __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2 == 5)
  {
    getWFSecurityLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Don't Delete at deletion authorization", (uint8_t *)&v6, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 40);
    +[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:](WFDeletionAuthorizationState, "dontDeleteErrorForContentItemClass:", objc_msgSend(*(id *)(a1 + 32), "contentItemClass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_324(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2 == 5)
  {
    getWFSecurityLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Don't Delete at deletion authorization", (uint8_t *)&v6, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 40);
    +[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:](WFDeletionAuthorizationState, "dontDeleteErrorForContentItemClass:", objc_msgSend(*(id *)(a1 + 32), "contentItemClass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

uint64_t __60__WFAction_logDataTransmissionForSmartPromptApprovalResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D13FA0], "log:", a2);
}

id __60__WFAction_logDataTransmissionForSmartPromptApprovalResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;

  v2 = a2;
  objc_msgSend(v2, "contentDestination");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken != -1)
    dispatch_once(&WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken, &__block_literal_global_1010);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = WFActionGreenTeaContentDestinationMayLeaveDevice_dataLeavingContentDestination;
      objc_msgSend(v3, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v11) = objc_msgSend((id)v11, "containsObject:", v12);

      if ((v11 & 1) != 0)
        goto LABEL_15;
      goto LABEL_12;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_14;
  v4 = v3;
  objc_msgSend(v4, "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple."));

  if ((v7 & 1) == 0)
  {

    goto LABEL_14;
  }
  if (WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken_1014 != -1)
    dispatch_once(&WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken_1014, &__block_literal_global_1015);
  v8 = WFActionGreenTeaContentDestinationMayLeaveDevice_exfiltratingAppBundleIdentifier;
  objc_msgSend(v4, "app");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend((id)v8, "containsObject:", v10);

  if ((v8 & 1) != 0)
  {
LABEL_15:
    objc_msgSend(v2, "sourceContentAttribution");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "origin");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v13 = 0;
LABEL_31:

      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "app");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v15, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DC7F20]) & 1) != 0)
    {
      v19 = (id *)MEMORY[0x1E0D14238];
    }
    else if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DC7EA0]) & 1) != 0)
    {
      v19 = (id *)MEMORY[0x1E0D14230];
    }
    else
    {
      if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DC7FC0]) & 1) == 0
        && (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.shortcuts.microphoneDestination")) & 1) == 0
        && (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DC7F00]) & 1) == 0
        && !objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DC7F08]))
      {
        v13 = 0;
        goto LABEL_30;
      }
      v19 = (id *)MEMORY[0x1E0D14228];
    }
    v13 = *v19;
LABEL_30:

    goto LABEL_31;
  }
LABEL_12:
  v13 = 0;
LABEL_32:

  return v13;
}

void __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2 == 3)
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v10 + 16))(v10);

  }
  else if (a2 == 2)
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Once at smart prompt", buf, 0xCu);
    }

    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 48), "undefinedStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAllowedOnceSmartPromptStates:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    getWFSecurityLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Deny at smart prompt", buf, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 56);
    +[WFSmartPromptState localizedDeniedPermissionsErrorWithContentDestination:](WFSmartPromptState, "localizedDeniedPermissionsErrorWithContentDestination:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke_316(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2 == 3)
  {
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v10 + 16))(v10);

  }
  else if (a2 == 2)
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Once at smart prompt", buf, 0xCu);
    }

    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 48), "undefinedStates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAllowedOnceSmartPromptStates:", v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    getWFSecurityLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Deny at smart prompt", buf, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 56);
    +[WFSmartPromptState localizedDeniedPermissionsErrorWithContentDestination:](WFSmartPromptState, "localizedDeniedPermissionsErrorWithContentDestination:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

void __126__WFAction_performSmartPromptChecksWithUserInterface_contentDestination_contentItemCache_isWebpageCoercion_completionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFSecurityLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 136315138;
      v9 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:co"
           "mpletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Device unlocked successfully", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDestination:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:co"
           "mpletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Did not succeed unlocking the device, interrupting execution.", (uint8_t *)&v8, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 80);
    +[WFSmartPromptState localizedUnlockedDeviceRequiredError](WFSmartPromptState, "localizedUnlockedDeviceRequiredError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    getWFSecurityLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v20 = "-[WFAction performDataAccessChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get content destination for action %{public}@: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_299;
    v12[3] = &unk_1E7AECB58;
    v13 = 0;
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v18 = v9;
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 48);
    v17 = v5;
    +[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:](WFScreenTimeHelper, "isContentDestinationAllowedByScreenTimeSettings:completionHandler:", v17, v12);

  }
}

void __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_299(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    getWFSecurityLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFAction performDataAccessChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s WFScreenTimeHelper will block execution with error %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_300;
    v14[3] = &unk_1E7AEE6A8;
    v19 = *(id *)(a1 + 72);
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v6, "performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:", v7, v8, v14);

  }
}

void __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_300(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  WFMDMVerifier *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_3:
    v4();
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_3;
  }
  v5 = -[WFMDMVerifier initWithAction:]([WFMDMVerifier alloc], "initWithAction:", *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  v7 = -[WFMDMVerifier canSendDataToContentDestination:error:](v5, "canSendDataToContentDestination:error:", v6, &v9);
  v8 = v9;
  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

LABEL_10:
}

void __39__WFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "effectiveWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__WFAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_1E7AF92C0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __39__WFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "runWithRemoteUserInterface:input:", a2, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

uint64_t __39__WFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", *(_QWORD *)(a1 + 40));
}

void __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke_2;
    v7[3] = &unk_1E7AF5D68;
    v7[4] = v4;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v4, "processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:", a2, v5, 0, 1, v6, v7);

  }
}

void __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, id obj, void *a4)
{
  id v8;
  id v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), obj);
  v8 = obj;
  v9 = a4;
  v10 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __77__WFAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFToolInvocation errorDomain](WFToolInvocation, "errorDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v7))
  {

    goto LABEL_5;
  }
  v8 = objc_msgSend(v5, "code");

  if (v8 != 1)
  {
LABEL_5:
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
  v9();

}

uint64_t __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "addEntriesFromDictionary:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "ignoredParameterKeysForProcessing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 40));
      v9 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "parametersRequiringUserInputAlongsideParameter:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v11);

      objc_msgSend(*(id *)(a1 + 56), "setValue:forKey:", v5, *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 72), "setValue:forKey:", v12, *(_QWORD *)(a1 + 64));
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  objc_msgSend(v5, "setValue:forKey:", a2, v6);
  (*(void (**)(void))(a1[6] + 16))();

}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    v6 = a3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, id, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, a3);
  }

}

id __55__WFAction_populatedInputWithProcessedParameterValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithFile:", v2);
  else
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2;
  v3[3] = &unk_1E7AEC898;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateObservers:", v3);
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  _QWORD *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!v6)
  {
    v11 = objc_msgSend(WeakRetained, "requiresPrivateOutputLogging");
    getWFWorkflowExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v12)
        goto LABEL_10;
      v13 = objc_msgSend(v5, "numberOfItems");
      objc_msgSend(v5, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315907;
      v24 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]_block_invoke";
      v25 = 2114;
      v26 = v8;
      v27 = 2048;
      v28 = v13;
      v29 = 2113;
      v30 = (uint64_t)v15;
      v16 = "%s Action %{public}@ finished with output of %ld items and first item: %{private}@";
    }
    else
    {
      if (!v12)
        goto LABEL_10;
      v17 = objc_msgSend(v5, "numberOfItems");
      objc_msgSend(v5, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 136315906;
      v24 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]_block_invoke";
      v25 = 2114;
      v26 = v8;
      v27 = 2048;
      v28 = v17;
      v29 = 2112;
      v30 = (uint64_t)v15;
      v16 = "%s Action %{public}@ finished with output of %ld items and first item: %@";
    }
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, 0x2Au);

    goto LABEL_10;
  }
  getWFWorkflowExecutionLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136316162;
    v24 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]_block_invoke_3";
    v25 = 2114;
    v26 = v8;
    v27 = 2114;
    v28 = (uint64_t)v10;
    v29 = 2048;
    v30 = objc_msgSend(v6, "code");
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Action %{public}@ finished with error {domain: %{public}@, code: %ld}. %@", (uint8_t *)&v23, 0x34u);

  }
LABEL_10:

  getWFRunningLifecycleLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = *(_QWORD *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v19, OS_SIGNPOST_INTERVAL_END, v20, "RunAction", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
  }

  objc_msgSend(v8, "setUserInterface:", 0);
  objc_msgSend(v8, "setProcessedParameters:", 0);
  objc_msgSend(v8, "setIgnoredParameterKeysForProcessing:", 0);
  objc_msgSend(v8, "setRunningDelegate:", 0);
  objc_msgSend(v8, "setVariableSource:", 0);
  objc_msgSend(v8, "setContentAttributionTracker:", 0);
  objc_msgSend(v8, "setContentPermissionRequestor:", 0);
  v21 = (void *)v8[16];
  v8[16] = 0;

  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    (*(void (**)(uint64_t, id, id))(v22 + 16))(v22, v5, v6);

}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_241(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "finishRunningWithError:", a2);
  }
  else
  {
    objc_msgSend(v3, "resourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2_242;
    v7[3] = &unk_1E7AEC960;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "makeAccessResourcesAvailableWithUserInterface:completionHandler:", v5, v7);

  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2_242(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v47;
    v7 = *MEMORY[0x1E0D14318];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v47 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v9, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v7))
        {
          v11 = objc_msgSend(v9, "code");

          if (!v11)
          {
            objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
            v24 = v3;
            goto LABEL_30;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v5);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unavailableResources");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (!v13)
    goto LABEL_20;
  v14 = v13;
  v15 = *(_QWORD *)v43;
  while (2)
  {
    for (j = 0; j != v14; ++j)
    {
      if (*(_QWORD *)v43 != v15)
        objc_enumerationMutation(v24);
      v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
      objc_msgSend(v17, "availabilityError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v17, "availabilityError");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "wf_isUnsupportedOnPlatformError");

        if (v26)
        {
          v27 = *(void **)(a1 + 32);
          objc_msgSend(v17, "availabilityError");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "finishRunningWithError:", v28);
LABEL_29:

          goto LABEL_30;
        }
        objc_msgSend(v17, "availabilityError");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_opt_new();
        v30 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("Could not run “%@”"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "localizedName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringWithFormat:", v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CB2D68]);

        objc_msgSend(v28, "localizedFailureReason");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v28, "localizedFailureReason");
          v35 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v28, "localizedDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
LABEL_28:
            v38 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 1, v29);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "finishRunningWithError:", v39);

            goto LABEL_29;
          }
          objc_msgSend(v28, "localizedDescription");
          v35 = objc_claimAutoreleasedReturnValue();
        }
        v37 = (void *)v35;
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0CB2D50]);

        goto LABEL_28;
      }
    }
    v14 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v14)
      continue;
    break;
  }
LABEL_20:

  objc_msgSend(*(id *)(a1 + 32), "willBeginProcessingParameterStates");
  v24 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyParameterStates");
  v19 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = objc_msgSend(v19, "skipsProcessingHiddenParameters");
  v22 = objc_msgSend(*(id *)(a1 + 32), "shouldAskForValuesWhileProcessingParameterStates");
  v23 = *(void **)(a1 + 48);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3_247;
  v40[3] = &unk_1E7AEC938;
  v40[4] = *(_QWORD *)(a1 + 32);
  v41 = v23;
  objc_msgSend(v19, "processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:", v24, v20, v21, v22, v41, v40);

LABEL_30:
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3_247(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFActionDidProcessParametersTestingEvent *v13;
  void *v14;
  void *v15;
  WFActionDidProcessParametersTestingEvent *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }
  else
  {
    v10 = v8;
    if (!v8)
      v10 = (void *)objc_opt_new();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), v10);
    if (!v8)

    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_4;
    v21[3] = &unk_1E7AEC8E8;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "if_compactMap:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProcessedParameters:", v12);

    v13 = [WFActionDidProcessParametersTestingEvent alloc];
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "processedParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFActionDidProcessParametersTestingEvent initWithAction:processedParameters:](v13, "initWithAction:processedParameters:", v14, v15);

    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_5;
    v18[3] = &unk_1E7AF5B98;
    v17 = *(void **)(a1 + 40);
    v19 = *(id *)(a1 + 32);
    v20 = v17;
    objc_msgSend(v19, "handleTestingEvent:completionHandler:", v16, v18);

  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentAttributionTracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributionSetForParameter:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "collectionByMergingAttributionSet:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_5(uint64_t a1, char a2)
{
  void *v3;
  int v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD v31[4];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4 = objc_msgSend(v3, "inputPassthrough");
    v5 = *(_QWORD **)(a1 + 32);
    if (v4 && !v5[17])
    {
      objc_msgSend(v5, "input");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 136);
      *(_QWORD *)(v8 + 136) = v7;

      v5 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v5, "inputParameterKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "previousAction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "containedVariablesOfClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v34 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "outputUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "UUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqualToString:", v18);

            if ((v19 & 1) != 0)
            {
              v20 = 0;
              goto LABEL_17;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v14)
            continue;
          break;
        }
      }
      v20 = 1;
LABEL_17:

      v21 = objc_msgSend(*(id *)(a1 + 32), "inputRequired");
      if ((v20 & 1) == 0 && (v21 & 1) == 0)
      {
        v22 = objc_opt_new();
        v23 = *(_QWORD *)(a1 + 32);
        v24 = *(void **)(v23 + 128);
        *(_QWORD *)(v23 + 128) = v22;

      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "showsImplicitChooseFromListWhenRunWithInput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128)))
    {
      v25 = (void *)objc_opt_class();
      v26 = *(_QWORD **)(a1 + 32);
      v27 = v26[16];
      objc_msgSend(v26, "userInterface");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_6;
      v31[3] = &unk_1E7AF94B0;
      v29 = *(_QWORD *)(a1 + 40);
      v32 = *(_QWORD *)(a1 + 32);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_7;
      v30[3] = &unk_1E7AEC910;
      v30[4] = v32;
      objc_msgSend(v25, "showImplicitChooseFromListWithInput:userInterface:workQueue:cancelHandler:selectionHandler:", v27, v28, v29, v31, v30);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "performDataAndHardwareAccessChecksAndRun");
    }
  }
  else
  {
    objc_msgSend(v3, "finishRunningWithError:");
  }
}

uint64_t __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), a2);
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contentAttributionTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputParameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceAttributionSet:forParameter:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "performDataAndHardwareAccessChecksAndRun");
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "actionRunningStateDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke_2(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke_2(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke_2(void *a1)
{
  id v1;
  char isKindOfClass;
  void *v3;

  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v3 = &unk_1E7B8AFD8;
  else
    v3 = &unk_1E7B8AFF0;
  return v3;
}

void __49__WFAction_setSupplementalParameterValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "action:supplementalParameterValueDidChangeForKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __32__WFAction_serializedParameters__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v12, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyForSerialization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "legacyKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v12, "legacySerializedRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v11, v9);

    }
  }

}

uint64_t __28__WFAction_parameterForKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, _QWORD);

  v6 = a2;
  v7 = a4;
  v8 = v6;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v9 = 0;
LABEL_7:
    v7[2](v7, 0);
    goto LABEL_8;
  }
  v9 = v8;
  if (!objc_msgSend(v8, "loadsDefaultStateAsynchronously"))
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "serializedParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (v12)
    goto LABEL_7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E7AEF370;
  v14 = v7;
  objc_msgSend(v8, "loadDefaultSerializedRepresentationWithCompletionHandler:", v13);

  v9 = v8;
LABEL_8:

}

uint64_t __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__WFAction_resolveAppDescriptorIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateAppDescriptorInDatabaseWithSelectedApp:", v3);
    objc_msgSend(*(id *)(a1 + 32), "updateAppDescriptorWithSelectedApp:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "missingAppError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 0;
}

+ (id)userInterfaceProtocol
{
  return 0;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "userInterfaceProtocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (void)showImplicitChooseFromListWithInput:(id)a3 userInterface:(id)a4 workQueue:(id)a5 cancelHandler:(id)a6 selectionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v35 = CFSTR("WFChooseFromListActionPrompt");
  WFLocalizedString(CFSTR("Choose an Item"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7848;
  v33 = __Block_byref_object_dispose__7849;
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.choosefromlist"), v19);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  v21 = (void *)v30[5];
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAction.m"), 2848, CFSTR("Choose from list action expected to load from registry"));

    v21 = (void *)v30[5];
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __103__WFAction_showImplicitChooseFromListWithInput_userInterface_workQueue_cancelHandler_selectionHandler___block_invoke;
  v25[3] = &unk_1E7AECD70;
  v22 = v16;
  v26 = v22;
  v23 = v17;
  v27 = v23;
  v28 = &v29;
  objc_msgSend(v21, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", v13, v14, 0, 0, v15, v25);

  _Block_object_dispose(&v29, 8);
}

void __103__WFAction_showImplicitChooseFromListWithInput_userInterface_workQueue_cancelHandler_selectionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(a3, "wf_isUserCancelledError"))
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

- (id)visibleParametersWithProcessing:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];

  -[WFAction parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__WFAction_Display__visibleParametersWithProcessing___block_invoke;
  v12[3] = &unk_1E7AF6D18;
  v12[4] = self;
  objc_msgSend(v5, "if_flatMap:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__WFAction_Display__visibleParametersWithProcessing___block_invoke_2;
  v10[3] = &unk_1E7AECDE8;
  v11 = a3;
  v10[4] = self;
  objc_msgSend(v7, "if_objectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)visibleParametersForParameterSummary
{
  return -[WFAction visibleParametersWithProcessing:](self, "visibleParametersWithProcessing:", 0);
}

- (BOOL)isOutputExpandedInEditor
{
  int v3;
  void *v4;
  char v5;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    -[WFAction supplementalParameterValueForKey:ofClass:](self, "supplementalParameterValueForKey:ofClass:", CFSTR("OutputExpandedInEditor"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setOutputExpandedInEditor:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WFAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v5, CFSTR("OutputExpandedInEditor"));

  }
}

id __53__WFAction_Display__visibleParametersWithProcessing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  WFMultipleValueExpandingParameter *v6;
  void *v7;
  void *v8;
  void *v9;
  WFParameterDefinition *v10;
  __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  WFParameterDefinition *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  WFParameterRelationResource *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[5];
  _QWORD v37[7];

  v37[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldInsertExpandingParameterForParameter:", v3))
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 32), "expandingParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (WFMultipleValueExpandingParameter *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_11;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Show-%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [WFParameterDefinition alloc];
  v37[0] = v9;
  v36[0] = CFSTR("Key");
  v36[1] = CFSTR("Label");
  objc_msgSend(v3, "localizedLabel");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(v3, "localizedPlaceholder");
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = &stru_1E7AFA810;
    v31 = (void *)v13;
    if (v13)
      v12 = (const __CFString *)v13;
  }
  v37[1] = v12;
  v36[2] = CFSTR("MultipleValueParameterKey");
  objc_msgSend(v3, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v14;
  v36[3] = CFSTR("RequiredResources");
  objc_msgSend(v3, "definition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("RequiredResources"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = MEMORY[0x1E0C9AA60];
  if (v16)
    v18 = v16;
  v36[4] = CFSTR("DefaultValue");
  v19 = MEMORY[0x1E0C9AAB0];
  v37[3] = v18;
  v37[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WFParameterDefinition initWithDictionary:](v10, "initWithDictionary:", v20);

  if (!v11)
  v6 = -[WFMultipleValueExpandingParameter initWithDefinition:]([WFMultipleValueExpandingParameter alloc], "initWithDefinition:", v21);
  v34[0] = CFSTR("WFParameterKey");
  v34[1] = CFSTR("WFParameterValue");
  v35[0] = v9;
  v35[1] = v19;
  v34[2] = CFSTR("WFResourceClass");
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[WFResource initWithDefinition:]([WFParameterRelationResource alloc], "initWithDefinition:", v24);
  -[WFParameterRelationResource setupWithAction:parameter:](v25, "setupWithAction:parameter:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(v3, "resourceManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addResource:", v25);

  -[WFParameter addEventObserver:](v6, "addEventObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "configureResourcesForParameter:", v6);
  objc_msgSend(*(id *)(a1 + 32), "expandingParameters");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", v6, v28);

  if (v6)
  {
LABEL_11:
    v33[0] = v6;
    v33[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v32 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

uint64_t __53__WFAction_Display__visibleParametersWithProcessing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a2;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v3, "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "resourcesAvailable");

  if ((v6 & 1) != 0)
  {
LABEL_4:
    v4 = 1;
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "expandingParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v3, "resourceManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unavailableResources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 == 1)
        goto LABEL_4;
    }
    else
    {

    }
  }
LABEL_2:
  v4 = 0;
LABEL_5:

  return v4;
}

- (id)containedVariables
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFAction parameters](self, "parameters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction parameterStateForKey:fallingBackToDefaultValue:](self, "parameterStateForKey:fallingBackToDefaultValue:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containedVariables");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)containedVariablesOfClass:(Class)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFAction containedVariables](self, "containedVariables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__WFAction_Convenience__containedVariablesOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e35___WFVariable_24__0__WFVariable_8Q16lu32l8;
  v7[4] = a3;
  objc_msgSend(v4, "if_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)containsVariableOfType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  char v17;
  BOOL v18;
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
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[WFAction parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v6 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "key", v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction parameterStateForKey:](self, "parameterStateForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containedVariables");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "type");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v4);

              if ((v17 & 1) != 0)
              {

                v18 = 1;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v13)
              continue;
            break;
          }
        }

        v6 = v20;
      }
      v18 = 0;
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

id __51__WFAction_Convenience__containedVariablesOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (WFActionLocalizationContext)defaultLocalizationContext
{
  return +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("Unknown Action"), CFSTR("Unknown Action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSAttributedString)attributedLocalizedName
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[WFAction localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  return (NSAttributedString *)v5;
}

- (NSString)localizedDefaultOutputName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDefaultOutputNameWithContext:](self, "localizedDefaultOutputNameWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFAction localizedName](self, "localizedName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction outputDictionary](self, "outputDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OutputName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)localizedAttribution
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedAttributionWithContext:](self, "localizedAttributionWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Attribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (-[WFAction isConstructorAction](self, "isConstructorAction"))
    {
      -[WFAction localizedNameWithContext:](self, "localizedNameWithContext:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    -[WFAction appDescriptor](self, "appDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      v8 = v11;
LABEL_16:

      goto LABEL_6;
    }
    -[WFAction resourceManager](self, "resourceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceObjectsOfClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        objc_msgSend(v14, "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedName");
        v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
        goto LABEL_16;
      }
      objc_msgSend(v14, "appName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
      {
        objc_msgSend(v14, "appName");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {

      v14 = 0;
    }
    v8 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "localize:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (id)v7;
LABEL_6:

  return v8;
}

- (NSAttributedString)localizedFooter
{
  return 0;
}

- (NSDictionary)appDefinition
{
  void *v2;
  void *v3;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AppDefinition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)displayableAppDefinition
{
  void *v2;
  void *v3;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DisplayableAppDefinition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)iconName
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IconName"));
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

  return v5;
}

- (NSString)iconSymbolName
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IconSymbol"));
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

  return v5;
}

- (NSString)iconBackgroundColorName
{
  void *v2;
  void *v3;
  void *v4;
  NSString *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IconColor"));
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

  return v5;
}

- (WFIcon)icon
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
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[WFAction iconName](self, "iconName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[WFAction iconSymbolName](self, "iconSymbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction iconBackgroundColorName](self, "iconBackgroundColorName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction definition](self, "definition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("IconSymbolColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v13 = v11;

    if (!v6 || !v8)
    {
      -[WFAction displayableAppDescriptor](self, "displayableAppDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7978]), "initWithBundleIdentifier:", v15);
      else
        v7 = 0;
      goto LABEL_33;
    }
    if (objc_msgSend(v13, "length"))
      +[WFAction colorForName:](WFAction, "colorForName:", v13);
    else
      objc_msgSend(MEMORY[0x1E0DC79F8], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("Tint")))
        +[WFAction tintedColorForName:](WFAction, "tintedColorForName:", v13);
      else
        +[WFAction colorForName:](WFAction, "colorForName:", v8);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B68]), "initWithColor:", v16);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7DB0]), "initWithSymbolName:symbolColor:background:", v6, v15, v17);

LABEL_32:
LABEL_33:

        goto LABEL_34;
      }
      getWFGeneralLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315394;
        v21 = "-[WFAction(Definition) icon]";
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s A custom icon color was specified (%@) but we could not find the color in the assets", (uint8_t *)&v20, 0x16u);
      }

      v16 = 0;
    }
    else
    {
      getWFGeneralLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315394;
        v21 = "-[WFAction(Definition) icon]";
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s A custom icon symbol color was specified (%@) but we could not find the color in the assets", (uint8_t *)&v20, 0x16u);
      }
    }
    v7 = 0;
    goto LABEL_32;
  }
  v4 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B78]), "initWithImage:", v6);
  }
  else
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[WFAction(Definition) icon]";
      v22 = 2112;
      v23 = v3;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s A custom icon was specified (%@) but we could not find the icon in our image assets", (uint8_t *)&v20, 0x16u);
    }

    v6 = 0;
    v7 = 0;
  }
LABEL_34:

  return (WFIcon *)v7;
}

- (WFColor)iconColor
{
  void *v2;
  void *v3;
  void *v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IconSymbolColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[WFAction colorForName:](WFAction, "colorForName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (WFColor *)v4;
}

- (WFActionDescriptionDefinition)descriptionDefinition
{
  void *v2;
  void *v3;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFActionDescriptionDefinition *)v3;
}

- (NSDictionary)outputDictionary
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Output"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (NSString)localizedDescriptionSummary
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDescriptionSummaryWithContext:](self, "localizedDescriptionSummaryWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DescriptionSummary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)descriptionInputIncludesSupportingItemClasses
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InputIncludesSupportingItemClassesKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (id)typeDescriptionWithTypes:(id)a3 explanationText:(id)a4 multiple:(BOOL)a5 optional:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
        if (a5)
          objc_msgSend(v17, "localizedPluralTypeDescription");
        else
          objc_msgSend(v17, "localizedTypeDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v11, "addObject:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  WFLocalizedString(CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v21 = 0;
    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  v21 = objc_msgSend(v20, "length") != 0;
  if (v10)
  {
LABEL_17:
    v22 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("(%@) %@"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v23, v20, v10, (_QWORD)v28);
    v24 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v24;
  }
LABEL_18:
  if (v21)
  {
    WFLocalizedString(CFSTR(" (optional)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v26;
  }

  return v20;
}

- (id)descriptionInput
{
  void *v2;
  void *v3;

  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DescriptionInput"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)localizedDescriptionInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDescriptionInputWithContext:](self, "localizedDescriptionInputWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFAction descriptionInputIncludesSupportingItemClasses](self, "descriptionInputIncludesSupportingItemClasses"))
    -[WFAction inputContentClasses](self, "inputContentClasses");
  else
    -[WFAction specifiedInputContentClasses](self, "specifiedInputContentClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction typeDescriptionWithTypes:explanationText:multiple:optional:](self, "typeDescriptionWithTypes:explanationText:multiple:optional:", v5, v4, -[WFAction inputsMultipleItems](self, "inputsMultipleItems"), -[WFAction inputRequired](self, "inputRequired") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)localizedDescriptionInputWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DescriptionInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionResult
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDescriptionResultWithContext:](self, "localizedDescriptionResultWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFAction descriptionInputIncludesSupportingItemClasses](self, "descriptionInputIncludesSupportingItemClasses"))
    -[WFAction outputContentClasses](self, "outputContentClasses");
  else
    -[WFAction specifiedOutputContentClasses](self, "specifiedOutputContentClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFAction inputPassthrough](self, "inputPassthrough") && !v4)
  {
    if (objc_msgSend(v5, "count"))
    {
      WFLocalizedString(CFSTR("The input"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  -[WFAction typeDescriptionWithTypes:explanationText:multiple:optional:](self, "typeDescriptionWithTypes:explanationText:multiple:optional:", v5, v4, -[WFAction outputsMultipleItems](self, "outputsMultipleItems"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DescriptionResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionNote
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDescriptionNoteWithContext:](self, "localizedDescriptionNoteWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDescriptionNoteWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DescriptionNote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)localizedFocusFilterDescription
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedFocusFilterDescriptionWithContext:](self, "localizedFocusFilterDescriptionWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedFocusFilterDescriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("FocusFilterDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionRequires
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDescriptionRequiresWithContext:](self, "localizedDescriptionRequiresWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDescriptionRequiresWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DescriptionRequires"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFAction unevaluatedResourceObjectsOfClass:](self, "unevaluatedResourceObjectsOfClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __64__WFAction_Definition__localizedDescriptionRequiresWithContext___block_invoke;
    v21 = &unk_1E7AF1178;
    v10 = v4;
    v22 = v10;
    objc_msgSend(v9, "if_compactMap:", &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedStringResourceWithKey(CFSTR("Access to %@"), CFSTR("Access to %@"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localize:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v16, v13, v18, v19, v20, v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (NSString)localizedDescriptionAttributionMarkdownString
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDescriptionAttributionMarkdownStringWithContext:](self, "localizedDescriptionAttributionMarkdownStringWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDescriptionAttributionMarkdownStringWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction descriptionDefinition](self, "descriptionDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DescriptionAttribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)localizedKeywords
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedKeywordsWithContext:](self, "localizedKeywordsWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ActionKeywords"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("|"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (NSArray)disabledOnPlatforms
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DisabledOnPlatforms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)isDiscontinued
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Discontinued"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)localizedDiscontinuedDescription
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedDiscontinuedDescriptionWithContext:](self, "localizedDiscontinuedDescriptionWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDiscontinuedDescriptionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[WFAction isDiscontinued](self, "isDiscontinued"))
  {
    -[WFAction displayableAppDescriptor](self, "displayableAppDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      WFLocalizedStringResourceWithKey(CFSTR("Shortcuts"), CFSTR("Shortcuts"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localize:", v10);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedStringResourceWithKey(CFSTR("This action won’t be supported in future versions of %@."), CFSTR("This action won’t be supported in future versions of %@."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v13, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isMissing
{
  return 0;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  char v4;
  void *v5;
  void *v6;

  if (-[WFAction isDiscontinued](self, "isDiscontinued", a3))
    return 0;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Discoverable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v4 = objc_msgSend(v6, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)isResidentCompatible
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ResidentCompatible"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isConstructorAction
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Constructor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSArray)remoteExecuteOnPlatforms
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RemoteExecuteOnPlatforms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (BOOL)requiresRemoteExecution
{
  __CFString *v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  char v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  WFAction *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFAction remoteExecuteOnPlatforms](self, "remoteExecuteOnPlatforms");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    getWFRemoteExecutionLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = "-[WFAction(Definition) requiresRemoteExecution]";
      v13 = 2114;
      v14 = self;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition requires remote execution on platforms: %{public}@", (uint8_t *)&v11, 0x20u);
    }

  }
  if (-[__CFString count](v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject idiom](v5, "idiom");
    if (v6 >= 6)
    {
      getWFRemoteExecutionLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 136315394;
        v12 = "-[WFAction(Definition) requiresRemoteExecution]";
        v13 = 2114;
        v14 = (WFAction *)v5;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Current platform is unspecified for device: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      v8 = 0;
    }
    else
    {
      v7 = off_1E7AF12C8[v6];
      v8 = -[__CFString containsObject:](v3, "containsObject:", v7);
      getWFRemoteExecutionLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = "-[WFAction(Definition) requiresRemoteExecution]";
        v13 = 2114;
        v14 = self;
        v15 = 2114;
        v16 = v7;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition requires remote execution for current platform (%{public}@)", (uint8_t *)&v11, 0x20u);
      }
    }

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[WFAction(Definition) requiresRemoteExecution]";
      v13 = 2114;
      v14 = self;
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition doesn't require remote execution", (uint8_t *)&v11, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (NSArray)userInterfaceTypes
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UserInterfaces"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)requiredResources
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RequiredResources"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSDictionary)userInterfaceClasses
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UserInterfaceClasses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (NSString)fillingProvider
{
  void *v2;
  void *v3;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("FillingProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ICApp)app
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFAction appDescriptor](self, "appDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (ICApp *)v5;
}

- (NSString)localizedCategory
{
  void *v3;
  void *v4;

  -[WFAction defaultLocalizationContext](self, "defaultLocalizationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction localizedCategoryWithContext:](self, "localizedCategoryWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "localize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldBeIncludedInAppsList
{
  void *v3;
  _BOOL4 v4;

  -[WFAction app](self, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInstalled"))
    v4 = !-[WFAction isDiscontinued](self, "isDiscontinued");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)inputRequired
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction inputDictionary](self, "inputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Required"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)inputPassthrough
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InputPassthrough"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)blocksSnapping
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BlocksSnapping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)snappingPassthrough
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SnappingPassthrough"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)inputTypeDeterminesOutputType
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction inputDictionary](self, "inputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InputTypeDeterminesOutputType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSArray)inputTypes
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction inputDictionary](self, "inputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Types"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSArray)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction outputDictionary](self, "outputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Types"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSString)outputMeasurementUnitType
{
  return 0;
}

- (BOOL)inputsMultipleItems
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction inputDictionary](self, "inputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Multiple"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)outputsMultipleItems
{
  void *v4;
  void *v5;
  char v6;

  if (-[WFAction inputPassthrough](self, "inputPassthrough"))
    return -[WFAction inputsMultipleItems](self, "inputsMultipleItems");
  -[WFAction outputDictionary](self, "outputDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Multiple"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (unint64_t)outputDisclosureLevel
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WFAction outputDictionary](self, "outputDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DisclosureLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Public")) ^ 1;
  return v4;
}

- (BOOL)highRisk
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HighRisk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)neverSuggested
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SuggestedNever"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)initialSuggestionBehavior
{
  void *v2;
  void *v3;
  int64_t v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SuggestedAsInitialAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (objc_msgSend(v3, "BOOLValue"))
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)rateLimitThreshold
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RateLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Threshold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (int64_t)rateLimitTimeout
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RateLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Timeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (int64_t)rateLimitDelay
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RateLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Delay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (WFActionParameterSummary)parameterSummary
{
  void *v2;
  void *v3;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ParameterSummary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFActionParameterSummary *)v3;
}

- (NSArray)additionalParameterSummaries
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AdditionalParameterSummaries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (NSString)parameterSummaryString
{
  return 0;
}

- (BOOL)displaysParameterSummary
{
  return 1;
}

- (unint64_t)parameterCollapsingBehavior
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[WFAction parameterSummary](self, "parameterSummary");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 2;
  v4 = (void *)v3;
  v5 = -[WFAction displaysParameterSummary](self, "displaysParameterSummary");

  if (!v5)
    return 2;
  -[WFAction definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("ParameterCollapsingBehavior"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DefaultBeginExpanded")) & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Never")))
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)requiresUnlock
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RequiresUnlock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)locallyProcessesData
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LocallyProcessesData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)deletesInput
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("DeletesInput"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (unint64_t)appearance
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Appearance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("Normal")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Comment")) & 1) != 0)
      v4 = 2;
    else
      v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Input"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldLocalizeValueForSelector:(SEL)a3
{
  return 1;
}

- (BOOL)mightSuppressRunningProgress
{
  void *v3;
  void *v5;
  void *v6;
  char v7;

  -[WFAction sessionKitSessionConfiguration](self, "sessionKitSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("MightSuppressRunningProgress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)mightStartAudioRecording
{
  void *v2;
  void *v3;
  char v4;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MightStartAudioRecording"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSDictionary)sessionKitSessionConfigurationDefinition
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[WFAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SessionConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSDictionary)sessionKitToastDurationsPerRunSourceDefinition
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[WFAction sessionKitSessionConfigurationDefinition](self, "sessionKitSessionConfigurationDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ToastDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (WFActionSessionKitSessionConfiguration)sessionKitSessionConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  WFActionSessionKitSessionConfiguration *v8;
  void *v9;

  -[WFAction sessionKitSessionConfigurationDefinition](self, "sessionKitSessionConfigurationDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFAction appDescriptor](self, "appDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = 0;
  if (v3 && v6)
  {
    -[WFAction sessionKitToastDurationsPerRunSourceDefinition](self, "sessionKitToastDurationsPerRunSourceDefinition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFActionSessionKitSessionConfiguration initWithBundleIdentifier:toastDurationPerRunSource:]([WFActionSessionKitSessionConfiguration alloc], "initWithBundleIdentifier:toastDurationPerRunSource:", v6, v9);

  }
  return v8;
}

- (NSString)sessionKitSessionInvocationType
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[WFAction sessionKitSessionConfiguration](self, "sessionKitSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = CFSTR("Automatic");
    v5 = CFSTR("Automatic");
  }
  else
  {
    -[WFAction sessionKitSessionConfigurationDefinition](self, "sessionKitSessionConfigurationDefinition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InvocationType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

uint64_t __64__WFAction_Definition__localizedDescriptionRequiresWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedProtectedResourceDescriptionWithContext:", *(_QWORD *)(a1 + 32));
}

+ (id)iconCache
{
  if (iconCache_onceToken != -1)
    dispatch_once(&iconCache_onceToken, &__block_literal_global_144_32222);
  return (id)iconCache_iconCache;
}

+ (id)colorForName:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Black")))
  {
    objc_msgSend(MEMORY[0x1E0DC79F8], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("White")))
  {
    objc_msgSend(MEMORY[0x1E0DC79F8], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Label")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 1;
LABEL_35:
    objc_msgSend(v5, "colorWithSystemColor:", v6);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Red")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 2;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Green")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 3;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Blue")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 4;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Orange")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 5;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Yellow")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 6;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Yellow_Accessibility")))
  {
    objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithRed:green:blue:alpha:", 1.0, 0.764999986, 0.0, 1.0);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Pink")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 7;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Purple")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 8;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Teal")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 9;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Indigo")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 10;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Brown")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 11;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mint")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 12;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cyan")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 13;
    goto LABEL_35;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gray")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    v6 = 14;
    goto LABEL_35;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Clear")))
  {
    v7 = 0;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0DC79F8], "clearColor");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_36:
  v7 = (void *)v4;
LABEL_37:

  return v7;
}

+ (id)tintedColorForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Red")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("systemRedTint");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Green")))
  {
    v5 = (void *)MEMORY[0x1E0DC79F8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("systemGreenTint");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Blue")))
    {
      objc_msgSend(a1, "colorForName:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "colorWithAlphaComponent:", 0.1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v5 = (void *)MEMORY[0x1E0DC79F8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("systemBlueTint");
  }
  objc_msgSend(v5, "colorNamed:inBundle:", v7, v6);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (void *)v8;

  return v9;
}

void __33__WFAction_Definition__iconCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)iconCache_iconCache;
  iconCache_iconCache = v0;

}

- (BOOL)isFavorite
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFActionFavorites"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (void)setFavorite:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD block[5];

  v3 = a3;
  -[WFAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(v6, "objectForKey:", CFSTR("WFActionFavorites"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "containsObject:", v5);
  if (v3)
    objc_msgSend(v9, "addObject:", v5);
  else
    objc_msgSend(v9, "removeObject:", v5);
  if (v10 != v3)
  {
    objc_msgSend(v9, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("WFActionFavorites"));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__WFAction_Favoriting__setFavorite___block_invoke;
    block[3] = &unk_1E7AF94B0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __36__WFAction_Favoriting__setFavorite___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WFActionFavoritesChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  -[WFAction app](self, "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)usesCompactUnlockService
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFAction runningDelegate](self, "runningDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRunningContextForAction:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC8478]);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "runSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC8440]);

  }
  return v9;
}

- (void)requestUnlockIfNeeded:(id)a3
{
  id v4;
  WFCompactUnlockService *v5;
  WFCompactUnlockService *v6;
  _QWORD v7[4];
  WFCompactUnlockService *v8;
  id v9;

  v4 = a3;
  if (-[WFAction requiresUnlock](self, "requiresUnlock"))
  {
    if (-[WFAction usesCompactUnlockService](self, "usesCompactUnlockService"))
    {
      v5 = objc_alloc_init(WFCompactUnlockService);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __49__WFAction_RequestUnlock__requestUnlockIfNeeded___block_invoke;
      v7[3] = &unk_1E7AF6BB0;
      v8 = v5;
      v9 = v4;
      v6 = v5;
      -[WFCompactUnlockService requestUnlockIfNeeded:](v6, "requestUnlockIfNeeded:", v7);

    }
    else
    {
      -[WFAction requestUnlock:](self, "requestUnlock:", v4);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)requestUnlock:(id)a3
{
  id v4;
  void *v5;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v4 = a3;
  if ((VCIsDeviceLocked() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setPreferredStyle:", 1);
    -[WFAction localizedName](self, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction workflow](self, "workflow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "workflowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuredTriggersForWorkflowID:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "trigger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescriptionWithConfigurationSummary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v14);

      objc_msgSend(MEMORY[0x1E0DC7AD0], "attributionWithAppBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttribution:", v15);
    }
    else
    {
      -[WFAction workflow](self, "workflow");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x1E0DC7AD0]);
      objc_msgSend(v15, "attributionTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributionIcon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "icon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v16, "initWithTitle:icon:workflowIcon:", v17, v18, v19);
      objc_msgSend(v5, "setAttribution:", v20);

    }
    v21 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedStringWithKey(CFSTR("TapToRunAction"), CFSTR("Tap to run “%@”"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction localizedName](self, "localizedName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v24);

    v25 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __41__WFAction_RequestUnlock__requestUnlock___block_invoke;
    v33[3] = &unk_1E7AF8F48;
    v26 = v4;
    v34 = v26;
    objc_msgSend(v5, "setCancellationHandler:", v33);
    v31[0] = v25;
    v31[1] = 3221225472;
    v31[2] = __41__WFAction_RequestUnlock__requestUnlock___block_invoke_2;
    v31[3] = &unk_1E7AF8F48;
    v27 = v26;
    v32 = v27;
    objc_msgSend(v5, "setSuccessHandler:", v31);
    v29[0] = v25;
    v29[1] = 3221225472;
    v29[2] = __41__WFAction_RequestUnlock__requestUnlock___block_invoke_3;
    v29[3] = &unk_1E7AF76F0;
    v29[4] = self;
    v30 = v27;
    objc_msgSend(v5, "setFailureHandler:", v29);
    -[WFAction userInterface](self, "userInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presentAlert:", v5);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (id)deviceLockedError
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v17[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "idiom");

  switch(v5)
  {
    case 0:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_PHONE");
      v7 = CFSTR("This shortcut requires your iPhone to be unlocked.");
      break;
    case 1:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_PAD");
      v7 = CFSTR("This shortcut requires your iPad to be unlocked.");
      break;
    case 2:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_MAC");
      v7 = CFSTR("This shortcut requires your Mac to be unlocked.");
      break;
    case 3:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_WATCH");
      v7 = CFSTR("This shortcut requires your Apple Watch to be unlocked.");
      break;
    case 4:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_POD");
      v7 = CFSTR("This shortcut requires your iPod to be unlocked.");
      break;
    default:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_UNSPECIFIED");
      v7 = CFSTR("This shortcut requires your device to be unlocked.");
      break;
  }
  WFLocalizedStringWithKey(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = *MEMORY[0x1E0CB2D68];
  v9 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Couldn’t run “%@”"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 17, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __41__WFAction_RequestUnlock__requestUnlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __41__WFAction_RequestUnlock__requestUnlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41__WFAction_RequestUnlock__requestUnlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceLockedError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __49__WFAction_RequestUnlock__requestUnlockIfNeeded___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

- (NSDictionary)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("WFWorkflowActionIdentifier");
  -[WFAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WFWorkflowActionParameters");
  v8[0] = v3;
  -[WFAction serializedParameters](self, "serializedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

+ (id)actionFromSerializedRepresentation:(id)a3 actionRegistry:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "actionsFromSerializedRepresentations:actionRegistry:", v9, v7, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)actionsFromSerializedRepresentations:(id)a3 actionRegistry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "valueForKey:", CFSTR("WFWorkflowActionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_map:", &__block_literal_global_59916);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createActionsWithIdentifiers:serializedParameterArray:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __79__WFAction_Serialization__actionsFromSerializedRepresentations_actionRegistry___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("WFWorkflowActionParameters"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

@end
