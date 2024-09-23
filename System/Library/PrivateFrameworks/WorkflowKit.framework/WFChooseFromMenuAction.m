@implementation WFChooseFromMenuAction

- (WFChooseFromMenuAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  WFChooseFromMenuAction *v17;
  WFVariableString *v18;
  WFVariableString *itemTitle;
  WFChooseFromMenuAction *v20;
  objc_super v22;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v10, "wf_popObjectForKey:", CFSTR("WFMenuItemTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  WFEnforceClass(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "wf_popObjectForKey:", CFSTR("WFMenuItemAttributedTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  WFEnforceClass(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22.receiver = self;
  v22.super_class = (Class)WFChooseFromMenuAction;
  v17 = -[WFControlFlowAction initWithIdentifier:definition:serializedParameters:](&v22, sel_initWithIdentifier_definition_serializedParameters_, v9, v8, v10);

  if (v17)
  {
    if (v16)
    {
      v18 = -[WFVariableString initWithSerializedRepresentation:variableProvider:parameter:]([WFVariableString alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v16, v17, 0);
    }
    else
    {
      if (!v13)
        goto LABEL_7;
      v18 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v13);
    }
    itemTitle = v17->_itemTitle;
    v17->_itemTitle = v18;

LABEL_7:
    -[WFVariableString addVariableDelegate:](v17->_itemTitle, "addVariableDelegate:", v17);
    v20 = v17;
  }

  return v17;
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromMenuAction;
  -[WFAction initializeParameters](&v4, sel_initializeParameters);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMenuItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEventObserver:", self);

}

- (id)serializedParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v14.receiver = self;
  v14.super_class = (Class)WFChooseFromMenuAction;
  -[WFControlFlowAction serializedParameters](&v14, sel_serializedParameters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  -[WFChooseFromMenuAction itemTitle](self, "itemTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingVariablesWithNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("WFMenuItemTitle"));

  -[WFChooseFromMenuAction itemTitle](self, "itemTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[WFChooseFromMenuAction itemTitle](self, "itemTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serializedRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v12, CFSTR("WFMenuItemAttributedTitle"));

  }
  return v5;
}

- (void)setItemTitle:(id)a3
{
  int64_t v4;
  WFVariableString *itemTitle;
  BOOL v6;
  WFVariableString *v7;
  WFVariableString *v8;
  WFVariableString *v9;
  WFVariableString *v10;
  id v11;

  v11 = a3;
  v4 = -[WFControlFlowAction mode](self, "mode");
  itemTitle = self->_itemTitle;
  if (v4 == 1)
  {
    v6 = -[WFVariableString isEqual:](itemTitle, "isEqual:", v11);
    -[WFVariableString removeVariableDelegate:](self->_itemTitle, "removeVariableDelegate:", self);
    v7 = (WFVariableString *)objc_msgSend(v11, "copy");
    v8 = self->_itemTitle;
    self->_itemTitle = v7;

    -[WFVariableString addVariableDelegate:](self->_itemTitle, "addVariableDelegate:", self);
    if (!v6)
      -[WFAction nameUpdated](self, "nameUpdated");
  }
  else
  {
    -[WFVariableString removeVariableDelegate:](itemTitle, "removeVariableDelegate:", self);
    v9 = (WFVariableString *)objc_msgSend(v11, "copy");
    v10 = self->_itemTitle;
    self->_itemTitle = v9;

    -[WFVariableString addVariableDelegate:](self->_itemTitle, "addVariableDelegate:", self);
  }

}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v5 = -[WFControlFlowAction mode](self, "mode");
  if (v5 == 2)
  {
    WFLocalizedStringResourceWithKey(CFSTR("Choose From Menu - End Menu"), CFSTR("End Menu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 1)
    {
      v10.receiver = self;
      v10.super_class = (Class)WFChooseFromMenuAction;
      -[WFAction localizedNameWithContext:](&v10, sel_localizedNameWithContext_, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[WFChooseFromMenuAction itemTitle](self, "itemTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingVariablesWithNames");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (BOOL)inputRequired
{
  return -[WFControlFlowAction mode](self, "mode") != 0;
}

- (BOOL)inputPassthrough
{
  return 1;
}

- (id)inputSourceInWorkflow:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[WFControlFlowAction mode](self, "mode");
  if (v5 == 1)
  {
    -[WFControlFlowAction groupedOpenAction](self, "groupedOpenAction");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v9.receiver = self;
    v9.super_class = (Class)WFChooseFromMenuAction;
    -[WFAction inputSourceInWorkflow:](&v9, sel_inputSourceInWorkflow_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)createAccompanyingActions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[WFControlFlowAction mode](self, "mode"))
    return 0;
  v4 = (void *)objc_opt_new();
  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFMenuItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "values", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        WFTitleForParameterValue(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[WFChooseFromMenuAction newIntermediaryActionWithMenuItemTitle:](self, "newIntermediaryActionWithMenuItemTitle:", v11);
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[WFControlFlowAction createAccompanyingActionWithMode:](self, "createAccompanyingActionWithMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  return v4;
}

- (id)newIntermediaryActionWithMenuItemTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WFControlFlowAction createAccompanyingActionWithMode:](self, "createAccompanyingActionWithMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemTitle:", v4);

  return v5;
}

- (void)showAlertWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMenuItems"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMenuPrompt"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "setTitle:", v6);
    }
    else
    {
      -[WFAction localizedDefaultDisambiguationPrompt](self, "localizedDefaultDisambiguationPrompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v7);

    }
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke;
    v15[3] = &unk_1E7AF7468;
    v15[4] = self;
    v9 = v5;
    v16 = v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
    -[WFAction userInterface](self, "userInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRunningWithSiriUI");

    if ((v11 & 1) == 0)
    {
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_3;
      v14[3] = &unk_1E7AF94B0;
      v14[4] = self;
      objc_msgSend(MEMORY[0x1E0D13DE8], "cancelButtonWithHandler:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addButton:", v12);

    }
    -[WFAction userInterface](self, "userInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentAlert:", v9);

  }
  else
  {
    self->_latestMenuChoice = -1;
    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;

  v4 = a3;
  if (-[WFControlFlowAction mode](self, "mode"))
  {
    self->_latestMenuChoice = -1;
    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }
  else
  {
    -[WFChooseFromMenuAction showAlertWithInput:](self, "showAlertWithInput:", v4);
  }

}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Menu Result"), CFSTR("Menu Result"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[WFControlFlowAction mode](self, "mode"))
    v8 = v6 == 0;
  else
    v8 = -[WFAction legacyBehaviorIgnoresOutputFromAction:inWorkflow:](self, "legacyBehaviorIgnoresOutputFromAction:inWorkflow:", v6, v7);

  return v8;
}

- (unint64_t)numberOfActionsIncludedWithAction:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  void *v16;
  void *v17;

  v5 = a3;
  -[WFChooseFromMenuAction intermediaryActions](self, "intermediaryActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFChooseFromMenuAction.m"), 197, CFSTR("action must be an intermediary action"));

  }
  if (objc_msgSend(v6, "count") - 1 <= v7)
    -[WFControlFlowAction groupedCloseAction](self, "groupedCloseAction");
  else
    objc_msgSend(v6, "objectAtIndex:", v7 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "indexOfObject:", v8);
  v12 = objc_msgSend(v10, "indexOfObject:", v5);
  v13 = v11 >= v12;
  v14 = v11 - v12;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFChooseFromMenuAction.m"), 208, CFSTR("Found a fatal ordering inconsistency between the actions in the grouping cache and the workflow"));

  }
  return v14;
}

- (void)arrayParameter:(id)a3 itemWasInserted:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[WFChooseFromMenuAction intermediaryActions](self, "intermediaryActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subarrayWithRange:", 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v10);
        v13 += -[WFChooseFromMenuAction numberOfActionsIncludedWithAction:](self, "numberOfActionsIncludedWithAction:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (_QWORD)v27);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
    v16 = v13 + 1;
  }
  else
  {
    v16 = 1;
  }

  WFTitleForParameterValue(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WFChooseFromMenuAction newIntermediaryActionWithMenuItemTitle:](self, "newIntermediaryActionWithMenuItemTitle:", v17);

  -[WFAction workflow](self, "workflow");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v16 + objc_msgSend(v20, "indexOfObject:", self);

  -[WFAction workflow](self, "workflow");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "editingDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction workflow](self, "workflow");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "workflow:insertActions:atIndexes:", v24, v25, v26);

}

- (void)arrayParameter:(id)a3 itemWasMovedFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[WFChooseFromMenuAction intermediaryActions](self, "intermediaryActions", a3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count") > a4)
  {
    v8 = (__PAIR128__(a5, a4) - a5) >> 64;
    if (v8 < objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction workflow](self, "workflow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "indexOfObject:", v22);
      v13 = objc_msgSend(v11, "indexOfObject:", v9);
      v14 = -[WFChooseFromMenuAction numberOfActionsIncludedWithAction:](self, "numberOfActionsIncludedWithAction:", v22);
      v15 = -[WFChooseFromMenuAction numberOfActionsIncludedWithAction:](self, "numberOfActionsIncludedWithAction:", v9);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v12, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15 - v14;
      if (v8 <= a4)
        v17 = 0;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v17 + v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction workflow](self, "workflow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "editingDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction workflow](self, "workflow");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "workflow:moveActionsAtIndexes:toIndexes:", v21, v16, v18);

    }
  }

}

- (void)arrayParameter:(id)a3 itemWasUpdatedAtIndex:(unint64_t)a4 toValue:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  WFTitleForParameterValue(a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFChooseFromMenuAction intermediaryActions](self, "intermediaryActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemTitle:", v9);

}

- (void)arrayParameter:(id)a3 confirmDeletionOfItemAtIndex:(unint64_t)a4 withHandler:(id)a5
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, _QWORD);

  v14 = (void (**)(id, _QWORD))a5;
  -[WFChooseFromMenuAction intermediaryActions](self, "intermediaryActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
  {
    v14[2](v14, 0);
  }
  else
  {
    -[WFAction workflow](self, "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction workflow](self, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChooseFromMenuAction intermediaryActions](self, "intermediaryActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workflow:removeAction:completionHandler:", v11, v13, v14);

  }
}

- (int64_t)latestMenuChoice
{
  return self->_latestMenuChoice;
}

- (WFVariableString)itemTitle
{
  return self->_itemTitle;
}

- (WFChooseFromMenuActionEventCoordinator)eventCoordinator
{
  return (WFChooseFromMenuActionEventCoordinator *)objc_loadWeakRetained((id *)&self->_eventCoordinator);
}

- (void)setEventCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_eventCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventCoordinator);
  objc_storeStrong((id *)&self->_itemTitle, 0);
}

void __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];

  v5 = a2;
  objc_msgSend(v5, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  v8 = (void *)MEMORY[0x1E0D14080];
  objc_msgSend(v5, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_2;
  v12[3] = &unk_1E7AF7440;
  v12[4] = *(_QWORD *)(a1 + 32);
  v12[5] = a3;
  objc_msgSend(v8, "buttonWithTitle:subtitle:selected:style:handler:", v9, v7, 0, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "synonyms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlternativeSpeakableMatches:", v11);

  objc_msgSend(*(id *)(a1 + 40), "addButton:", v10);
}

void __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = -1;
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

uint64_t __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

@end
