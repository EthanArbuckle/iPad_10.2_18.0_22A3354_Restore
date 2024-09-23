@implementation WFHFTriggerActionSetsBuilderParameterState

- (HMHome)home
{
  void *v3;
  void *v4;
  void *v5;

  +[WFHomeManager sharedManager](WFHomeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v5;
}

- (NSArray)actionSets
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[WFHFTriggerActionSetsBuilderParameterState home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFHFTriggerActionSetsBuilderParameterState serializedActionSets](self, "serializedActionSets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__WFHFTriggerActionSetsBuilderParameterState_actionSets__block_invoke;
    v7[3] = &unk_1E7AF1900;
    v8 = v3;
    objc_msgSend(v4, "if_compactMap:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (HFTriggerActionSetsBuilder)triggerActionSetsBuilder
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFHFTriggerActionSetsBuilderParameterState home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFHFTriggerActionSetsBuilderParameterState actionSets](self, "actionSets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(getHFTriggerActionSetsBuilderClass_33839()), "initWithActionSets:inHome:", v4, v3);

  }
  else
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](self, "homeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[WFHFTriggerActionSetsBuilderParameterState triggerActionSetsBuilder]";
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to find home with identifier: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    v5 = 0;
  }

  return (HFTriggerActionSetsBuilder *)v5;
}

- (WFHFTriggerActionSetsBuilderParameterState)initWithActionSets:(id)a3 homeIdentifier:(id)a4
{
  id v7;
  id v8;
  WFHFTriggerActionSetsBuilderParameterState *v9;
  uint64_t v10;
  NSString *homeIdentifier;
  uint64_t v12;
  NSArray *serializedActionSets;
  WFHFTriggerActionSetsBuilderParameterState *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHFTriggerActionSetsBuilderParameterState.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFHFTriggerActionSetsBuilderParameterState;
  v9 = -[WFHFTriggerActionSetsBuilderParameterState init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    homeIdentifier = v9->_homeIdentifier;
    v9->_homeIdentifier = (NSString *)v10;

    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_33833);
    v12 = objc_claimAutoreleasedReturnValue();
    serializedActionSets = v9->_serializedActionSets;
    v9->_serializedActionSets = (NSArray *)v12;

    v14 = v9;
  }

  return v9;
}

- (WFHFTriggerActionSetsBuilderParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6;
  WFHFTriggerActionSetsBuilderParameterState *v7;
  id v8;
  uint64_t v9;
  NSString *homeIdentifier;
  uint64_t v11;
  NSArray *serializedActionSets;
  WFHFTriggerActionSetsBuilderParameterState *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFHFTriggerActionSetsBuilderParameterState;
  v7 = -[WFHFTriggerActionSetsBuilderParameterState init](&v15, sel_init);
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v6;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WFHFTriggerActionSetsBuilderParameterStateHome"));
    v9 = objc_claimAutoreleasedReturnValue();
    homeIdentifier = v7->_homeIdentifier;
    v7->_homeIdentifier = (NSString *)v9;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WFHFTriggerActionSetsBuilderParameterStateActionSets"));
    v11 = objc_claimAutoreleasedReturnValue();

    serializedActionSets = v7->_serializedActionSets;
    v7->_serializedActionSets = (NSArray *)v11;

    v13 = v7;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[WFHFTriggerActionSetsBuilderParameterState serializedActionSets](self, "serializedActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("WFHFTriggerActionSetsBuilderParameterStateActionSets"));

  -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](self, "homeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](self, "homeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("WFHFTriggerActionSetsBuilderParameterStateHome"));

  }
  return (WFPropertyListObject *)v3;
}

- (BOOL)isEqual:(id)a3
{
  WFHFTriggerActionSetsBuilderParameterState *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WFHFTriggerActionSetsBuilderParameterState *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFHFTriggerActionSetsBuilderParameterState serializedActionSets](v4, "serializedActionSets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHFTriggerActionSetsBuilderParameterState serializedActionSets](self, "serializedActionSets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](v4, "homeIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](self, "homeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  v3 = (void *)objc_opt_new();
  -[WFHFTriggerActionSetsBuilderParameterState serializedActionSets](self, "serializedActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combine:", v4);

  -[WFHFTriggerActionSetsBuilderParameterState homeIdentifier](self, "homeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combine:", v6);

  v8 = objc_msgSend(v3, "finalize");
  return v8;
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (NSArray)serializedActionSets
{
  return self->_serializedActionSets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedActionSets, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

uint64_t __80__WFHFTriggerActionSetsBuilderParameterState_initWithActionSets_homeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortcutsDictionaryRepresentation");
}

id __56__WFHFTriggerActionSetsBuilderParameterState_actionSets__block_invoke(uint64_t a1, void *a2)
{
  Class (__cdecl *v3)();
  id v4;
  void *v5;

  v3 = (Class (__cdecl *)())getHMActionSetClass;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(v3()), "initWithShortcutsDictionaryRepresentation:home:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

@end
