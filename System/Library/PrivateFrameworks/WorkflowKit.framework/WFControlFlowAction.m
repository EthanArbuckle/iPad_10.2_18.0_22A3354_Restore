@implementation WFControlFlowAction

- (WFControlFlowAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  WFControlFlowAction *v16;
  WFControlFlowAction *v17;
  WFControlFlowAction *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v10, "wf_popObjectForKey:", CFSTR("WFControlFlowMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14)
  {
    objc_msgSend(v9, "definitionByRemovingKey:", CFSTR("Parameters"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "definitionByRemovingKey:", CFSTR("RequiredResources"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v20.receiver = self;
  v20.super_class = (Class)WFControlFlowAction;
  v16 = -[WFAction initWithIdentifier:definition:serializedParameters:](&v20, sel_initWithIdentifier_definition_serializedParameters_, v8, v9, v10);
  v17 = v16;
  if (v16)
  {
    v16->_mode = v14;
    v18 = v16;
  }

  return v17;
}

- (BOOL)isCollapsed
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[WFControlFlowAction mode](self, "mode") == 2)
    return 0;
  -[WFAction workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workflowID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAction UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WFCollapsedActions-%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringArrayForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v9, "containsObject:", v6);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v3 = a3;
  if (-[WFControlFlowAction mode](self, "mode") != 2)
  {
    -[WFAction workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workflowID");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      v6 = -[WFAction generateUUIDIfNecessaryWithUUIDProvider:](self, "generateUUIDIfNecessaryWithUUIDProvider:", 0);
      -[WFAction UUID](self, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WFCollapsedActions-%@"), v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringArrayForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = (void *)MEMORY[0x1E0C9AA60];
      if (v10)
        v12 = (void *)v10;
      v13 = v12;

      if (v3)
        objc_msgSend(v13, "arrayByAddingObject:", v7);
      else
        objc_msgSend(v13, "if_arrayByRemovingObject:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
        objc_msgSend(v8, "setObject:forKey:", v14, v9);
      else
        objc_msgSend(v8, "removeObjectForKey:", v9);

    }
  }
}

- (void)generateGroupingIdentifierIfNecessary
{
  void *v3;
  void *v4;
  id v5;

  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setGroupingIdentifier:](self, "setGroupingIdentifier:", v4);

  }
}

- (id)serializedParameters
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[WFControlFlowAction generateGroupingIdentifierIfNecessary](self, "generateGroupingIdentifierIfNecessary");
  v7.receiver = self;
  v7.super_class = (Class)WFControlFlowAction;
  -[WFAction serializedParameters](&v7, sel_serializedParameters);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFControlFlowAction mode](self, "mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("WFControlFlowMode"));

  return v4;
}

- (id)createAccompanyingActionWithMode:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[WFControlFlowAction generateGroupingIdentifierIfNecessary](self, "generateGroupingIdentifierIfNecessary");
  v11 = CFSTR("WFControlFlowMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)WFControlFlowAction;
  v7 = -[WFAction copyWithSerializedParameters:](&v10, sel_copyWithSerializedParameters_, v6);

  -[WFAction groupingIdentifier](self, "groupingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGroupingIdentifier:", v8);

  return v7;
}

- (BOOL)displaysParameterSummary
{
  return -[WFControlFlowAction mode](self, "mode") == 0;
}

- (id)iconName
{
  objc_super v4;

  if (-[WFControlFlowAction mode](self, "mode"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  -[WFAction iconName](&v4, sel_iconName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)inputPassthrough
{
  return -[WFControlFlowAction mode](self, "mode") == 0;
}

- (BOOL)snappingPassthrough
{
  objc_super v4;

  if (-[WFControlFlowAction mode](self, "mode") == 2)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return -[WFAction snappingPassthrough](&v4, sel_snappingPassthrough);
}

- (BOOL)inputTypePassthrough
{
  objc_super v4;

  if (-[WFControlFlowAction mode](self, "mode") == 2 || !-[WFControlFlowAction mode](self, "mode"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return -[WFAction inputTypePassthrough](&v4, sel_inputTypePassthrough);
}

- (BOOL)isDeletable
{
  objc_super v4;

  if (-[WFControlFlowAction mode](self, "mode"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return -[WFAction isDeletable](&v4, sel_isDeletable);
}

- (BOOL)hasChildren
{
  objc_super v4;

  if (!-[WFControlFlowAction mode](self, "mode"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)WFControlFlowAction;
  return -[WFAction hasChildren](&v4, sel_hasChildren);
}

- (id)outputContentClasses
{
  void *v3;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[WFControlFlowAction mode](self, "mode") == 2)
  {
    v6[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFControlFlowAction;
    -[WFAction outputContentClasses](&v5, sel_outputContentClasses);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  void *v4;
  id v7;
  id v8;
  int64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[WFControlFlowAction mode](self, "mode");
  switch(v9)
  {
    case 2:
      if ((objc_msgSend(v8, "containsObject:", self) & 1) != 0)
      {
LABEL_17:
        v4 = (void *)MEMORY[0x1E0C9AA60];
        break;
      }
      v10 = objc_alloc(MEMORY[0x1E0C99E10]);
      v29.receiver = self;
      v29.super_class = (Class)WFControlFlowAction;
      -[WFAction inheritedOutputContentClassesInWorkflow:context:](&v29, sel_inheritedOutputContentClassesInWorkflow_context_, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

      objc_msgSend(v8, "addObject:", self);
      -[WFControlFlowAction groupedIntermediaryActions](self, "groupedIntermediaryActions");
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
            objc_msgSend(v7, "actions", (_QWORD)v25);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "indexOfObject:", v18);
            v21 = v20 - 1;
            if (v20 < 1 || v21 >= objc_msgSend(v19, "count"))
            {
              objc_msgSend(v12, "array");
              v4 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_20;
            }
            objc_msgSend(v19, "objectAtIndex:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "inheritedOutputContentClassesInWorkflow:context:", v7, v8);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObjectsFromArray:", v23);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
          if (v15)
            continue;
          break;
        }
      }

      objc_msgSend(v12, "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
      break;
    case 1:
      if ((objc_msgSend(v8, "containsObject:", self) & 1) != 0)
        goto LABEL_17;
      objc_msgSend(v8, "addObject:", self);
      -[WFControlFlowAction groupedOpenAction](self, "groupedOpenAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inheritedOutputContentClassesInWorkflow:context:", v7, v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 0:
      v30.receiver = self;
      v30.super_class = (Class)WFControlFlowAction;
      -[WFAction inheritedOutputContentClassesInWorkflow:context:](&v30, sel_inheritedOutputContentClassesInWorkflow_context_, v7, v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v4;
}

- (id)groupedOpenAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsGroupedWithAction:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__WFControlFlowAction_groupedOpenAction__block_invoke;
  v7[3] = &unk_1E7AF2200;
  v7[4] = self;
  objc_msgSend(v4, "if_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)groupedCloseAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsGroupedWithAction:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__WFControlFlowAction_groupedCloseAction__block_invoke;
  v7[3] = &unk_1E7AF2200;
  v7[4] = self;
  objc_msgSend(v4, "if_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)groupedIntermediaryActions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[WFAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsGroupedWithAction:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__WFControlFlowAction_groupedIntermediaryActions__block_invoke;
  v7[3] = &unk_1E7AF2200;
  v7[4] = self;
  objc_msgSend(v4, "if_objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)mode
{
  return self->_mode;
}

- (WFControlFlowAttributionTracker)controlFlowTracker
{
  return (WFControlFlowAttributionTracker *)objc_loadWeakRetained((id *)&self->_controlFlowTracker);
}

- (void)setControlFlowTracker:(id)a3
{
  objc_storeWeak((id *)&self->_controlFlowTracker, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlFlowTracker);
}

BOOL __49__WFControlFlowAction_groupedIntermediaryActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "mode") == 1;
  return v5;
}

BOOL __41__WFControlFlowAction_groupedCloseAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "mode") == 2;
  return v5;
}

BOOL __40__WFControlFlowAction_groupedOpenAction__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  v3 = objc_opt_class();
  WFEnforceClass(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "mode") == 0;
  return v5;
}

@end
