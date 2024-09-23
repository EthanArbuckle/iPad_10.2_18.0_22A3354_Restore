@implementation WFInputAction

- (WFInputAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8;
  WFActionDefinition *v9;
  id v10;
  WFActionDefinition *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  WFInputAction *v23;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (WFActionDefinition *)a4;
  v10 = a5;
  if (!v9)
  {
    v11 = [WFActionDefinition alloc];
    v9 = -[WFActionDefinition initWithDictionary:](v11, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
  -[WFActionDefinition objectForKey:](v9, "objectForKey:", CFSTR("WFContentSelectionParametersAreInjected"));
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
  v14 = v13;

  v15 = objc_msgSend(v14, "BOOLValue");
  if ((v15 & 1) == 0)
  {
    WFContentSelectionActionParameterDefinitions();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFActionDefinition objectForKey:](v9, "objectForKey:", CFSTR("Parameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = CFSTR("Parameters");
    v26[1] = CFSTR("WFContentSelectionParametersAreInjected");
    v27[0] = v20;
    v27[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFActionDefinition definitionByAddingEntriesInDictionary:](v9, "definitionByAddingEntriesInDictionary:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v9 = (WFActionDefinition *)v22;
  }
  v25.receiver = self;
  v25.super_class = (Class)WFInputAction;
  v23 = -[WFAction initWithIdentifier:definition:serializedParameters:](&v25, sel_initWithIdentifier_definition_serializedParameters_, v8, v9, v10);

  return v23;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFInputAction;
  v5 = -[WFAction setParameterState:forKey:](&v7, sel_setParameterState_forKey_, a3, a4);
  if (v5)
    -[WFInputAction updateWorkflowState](self, "updateWorkflowState");
  return v5;
}

- (void)updateWorkflowState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WFInputAction noInputBehavior](self, "noInputBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNoInputBehavior:", v3);

  -[WFInputAction selectedInputTypes](self, "selectedInputTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInputClasses:", v5);

  -[WFAction workflow](self, "workflow");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "save");

}

- (void)removedFromWorkflow
{
  void *v3;
  id v4;

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNoInputBehavior:", 0);

  -[WFAction workflow](self, "workflow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "save");

}

- (id)minimumSupportedClientVersion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFNoInputBehavior"));
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

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", CFSTR("Continue"));
  if ((v5 & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFInputAction;
    -[WFAction minimumSupportedClientVersion](&v10, sel_minimumSupportedClientVersion);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFInputAction;
    -[WFAction minimumSupportedClientVersion](&v11, sel_minimumSupportedClientVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFMaximumBundleVersion(v8, CFSTR("1113"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
}

- (id)selectedBehavior
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFNoInputBehavior"));
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

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)selectedAskForType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFInputAction selectedBehavior](self, "selectedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Ask For"));

  if (v4)
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFAskForType"));
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
    v8 = v6;

    objc_msgSend(v8, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)selectedInputTypes
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFInputType"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v7 = 0;
LABEL_11:
    objc_msgSend(v7, "parameterStates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "if_map:", &__block_literal_global_7370);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v4)
    goto LABEL_11;
  objc_msgSend(v4, "value");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12[0] = NSClassFromString(v8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v9;
}

- (id)actionSerializedParametersForSelectionOfItemClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v12[4];
  id v13;
  id v14;

  if (a3)
  {
    WFInputActionParameterKeysForSelectingItemOfClass(a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    -[WFAction serializedParameters](self, "serializedParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__WFInputAction_actionSerializedParametersForSelectionOfItemClass___block_invoke;
    v12[3] = &unk_1E7AEC618;
    v13 = v4;
    v14 = v5;
    v7 = v5;
    v8 = v4;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

    v9 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInputAction.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClass"));
    v9 = 0;
  }

  return v9;
}

- (id)noInputBehavior
{
  void *v3;
  WFWorkflowNoInputBehaviorGetClipboard *v4;
  void *v5;
  id v6;
  id v7;
  WFWorkflowNoInputBehaviorAskForInput *v8;
  void *v9;
  WFWorkflowNoInputBehaviorShowError *v10;
  void *v11;
  void *v12;

  -[WFInputAction selectedBehavior](self, "selectedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")) & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Ask For")))
  {
    -[WFInputAction selectedAskForType](self, "selectedAskForType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = WFInputActionContentItemClassCorrespondingToAskForParameterValue(v5);
    if (v6)
    {
      v7 = v6;
      v8 = [WFWorkflowNoInputBehaviorAskForInput alloc];
      -[WFInputAction actionSerializedParametersForSelectionOfItemClass:](self, "actionSerializedParametersForSelectionOfItemClass:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[WFWorkflowNoInputBehaviorAskForInput initWithContentItemClass:serializedParameters:](v8, "initWithContentItemClass:serializedParameters:", v7, v9);

    }
    else
    {
      v4 = 0;
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Stop and Respond")))
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFStopAndRespondResponse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [WFWorkflowNoInputBehaviorShowError alloc];
    objc_msgSend(v5, "variableString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByRemovingVariables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WFWorkflowNoInputBehaviorShowError initWithErrorString:](v10, "initWithErrorString:", v12);

LABEL_11:
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("Get Clipboard")))
  {
    v4 = objc_alloc_init(WFWorkflowNoInputBehaviorGetClipboard);
    goto LABEL_12;
  }
LABEL_2:
  v4 = 0;
LABEL_12:

  return v4;
}

- (NSSet)inputSurfaces
{
  return self->_inputSurfaces;
}

- (void)setInputSurfaces:(id)a3
{
  objc_storeStrong((id *)&self->_inputSurfaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSurfaces, 0);
}

void __67__WFInputAction_actionSerializedParametersForSelectionOfItemClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

id __35__WFInputAction_selectedInputTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  NSString *v5;
  void *v6;

  v2 = a2;
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
  objc_msgSend(v4, "value");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)inputActionForWorkflow:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFInputAction.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  objc_msgSend(a1, "serializedParametersForWorkflow:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.input"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "workflowTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInputSurfaces:", v11);

    objc_msgSend(v8, "willBeAddedToWorkflow:", v5);
    objc_msgSend(v8, "wasAddedToWorkflow:", v5);
    v12 = v8;
  }

  return v8;
}

+ (id)serializedParametersFromActionSerializedParameters:(id)a3 itemClass:(Class)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = v7;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFInputAction.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemClass"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  WFInputActionParameterKeysForSelectingItemOfClass(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__WFInputAction_serializedParametersFromActionSerializedParameters_itemClass___block_invoke;
  v16[3] = &unk_1E7AEC618;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
  v13 = (void *)objc_msgSend(v11, "copy");

LABEL_6:
  return v13;
}

+ (id)serializedParametersForWorkflow:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFInputAction.m"), 399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "inputClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v5, "inputClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_map:", &__block_literal_global_175);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("WFInputType"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], CFSTR("WFInputType"));
  }
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nullable WFDescribeWorkflowInputSurfaces(WFWorkflow * _Nonnull __strong)");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("WFInputAction.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "workflowTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0DC8500]);

  if (v14)
  {
    WFLocalizedString(CFSTR("Share Sheet"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  objc_msgSend(v11, "workflowTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", *MEMORY[0x1E0DC84F0]);

  if (v17)
  {
    WFLocalizedString(CFSTR("Quick Actions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

  }
  objc_msgSend(v11, "workflowTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", *MEMORY[0x1E0DC84F8]);

  if (v20)
  {
    WFLocalizedString(CFSTR("What’s On Screen"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v21);

  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  if (v22)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("WFInputSurface"));
  objc_msgSend(v11, "noInputBehavior");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  v26 = v23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  v29 = v26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  if (v25)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Stop and Respond"), CFSTR("WFNoInputBehavior"));
    objc_msgSend(v25, "errorString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("WFStopAndRespondResponse"));
    v33 = (void *)objc_msgSend(v6, "copy");

    v34 = v29;
    goto LABEL_60;
  }
  if (!v28)
  {
    if (v31)
    {
      v38 = CFSTR("Get Clipboard");
LABEL_40:
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("WFNoInputBehavior"));
      v33 = (void *)objc_msgSend(v6, "copy");
      v34 = 0;
      v28 = 0;
      v31 = v29;
      goto LABEL_60;
    }
LABEL_39:
    v29 = 0;
    v38 = CFSTR("Continue");
    goto LABEL_40;
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Ask For"), CFSTR("WFNoInputBehavior"));
  v35 = (void *)objc_msgSend(v28, "contentItemClass");
  if (v35)
  {
    v36 = v35;
    if ((objc_msgSend(v35, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Files");
    }
    else if ((objc_msgSend(v36, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Text");
    }
    else if ((objc_msgSend(v36, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Date");
    }
    else if ((objc_msgSend(v36, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Photos");
    }
    else if ((objc_msgSend(v36, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Contacts");
    }
    else if ((objc_msgSend(v36, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Email Address");
    }
    else if ((objc_msgSend(v36, "isEqual:", objc_opt_class()) & 1) != 0)
    {
      v37 = CFSTR("Music");
    }
    else if (objc_msgSend(v36, "isEqual:", objc_opt_class()))
    {
      v37 = CFSTR("Phone Number");
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("WFAskForType"));
    objc_msgSend(v28, "serializedParameters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      +[WFInputAction serializedParametersFromActionSerializedParameters:itemClass:](WFInputAction, "serializedParametersFromActionSerializedParameters:itemClass:", v39, v36);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "if_dictionaryByAddingEntriesFromDictionary:", v40);
      v41 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v41;
    }

  }
  v33 = (void *)objc_msgSend(v6, "copy");
  v34 = 0;
  v28 = v29;
LABEL_60:

  return v33;
}

NSString *__49__WFInputAction_serializedParametersForWorkflow___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

void __78__WFInputAction_serializedParametersFromActionSerializedParameters_itemClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

@end
