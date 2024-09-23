@implementation WFModuleSummaryEditor

- (WFModuleSummaryEditor)initWithParameter:(id)a3 arrayIndex:(unint64_t)a4 processing:(BOOL)a5
{
  id v9;
  WFModuleSummaryEditor *v10;
  WFModuleSummaryEditor *v11;
  WFModuleSummaryEditor *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFModuleSummaryEditor;
  v10 = -[WFModuleSummaryEditor init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameter, a3);
    v11->_arrayIndex = a4;
    v11->_processing = a5;
    v12 = v11;
  }

  return v11;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (WFParameterState)currentState
{
  WFParameterState *currentState;

  currentState = self->_currentState;
  if (currentState)
    return currentState;
  -[WFModuleSummaryEditor initialState](self, "initialState");
  return (WFParameterState *)(id)objc_claimAutoreleasedReturnValue();
}

- (WFParameterState)initialState
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[WFModuleSummaryEditor arrayIndex](self, "arrayIndex");
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialStateForSummaryEditor:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (v6)
  {
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "parameterStates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 >= objc_msgSend(v8, "count"))
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return (WFParameterState *)v7;
}

- (WFMultipleValueParameterState)initialArrayState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  WFMultipleValueParameterState *v7;

  -[WFModuleSummaryEditor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialStateForSummaryEditor:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v6;
    else
      v5 = 0;
  }
  v7 = (WFMultipleValueParameterState *)v5;

  return v7;
}

- (void)stageState:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_currentState, a3);
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFModuleSummaryEditor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summaryEditor:didStageParameterState:", self, v8);

  }
}

- (void)commitState:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_currentState, a3);
  v5 = a3;
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summaryEditor:didCommitParameterState:", self, v5);

}

- (void)commitAuxiliaryState:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFModuleSummaryEditor delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summaryEditor:didCommitAuxiliaryParameterState:forKey:", self, v10, v6);

  }
}

- (void)completeEditing
{
  -[WFModuleSummaryEditor completeEditingWithTextAttachmentToEdit:](self, "completeEditingWithTextAttachmentToEdit:", 0);
}

- (void)completeEditingWithTextAttachmentToEdit:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryEditorDidFinish:returnToKeyboard:withTextAttachmentToEdit:", self, -[WFModuleSummaryEditor returnToKeyboardOnComplete](self, "returnToKeyboardOnComplete"), v4);

}

- (void)requestTextEntry
{
  id v3;

  -[WFModuleSummaryEditor delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summaryEditorDidRequestTextEntry:", self);

}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  objc_storeWeak((id *)&self->_textEntry, a3);
}

- (BOOL)textEntryShouldChangeText:(id)a3
{
  return 1;
}

- (void)textEntryDidCutWithOriginalBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)textEntryDidCopyWithOriginalBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)textEntryDidPasteWithOriginalBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)textEntryDidFinish
{
  objc_storeWeak((id *)&self->_textEntry, 0);
}

- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[WFModuleSummaryEditor parameter](self, "parameter", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "stateClass");

  return objc_msgSend(v4, "instancesRespondToSelector:", sel_initWithVariable_);
}

- (id)variableMenuElementsForSlotWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  if (!-[WFModuleSummaryEditor variableMenuSupportsVariableSelectionForSlotWithIdentifier:](self, "variableMenuSupportsVariableSelectionForSlotWithIdentifier:", a3)|| !-[WFModuleSummaryEditor allowsPickingVariables](self, "allowsPickingVariables"))
  {
    return 0;
  }
  -[WFModuleSummaryEditor parameter](self, "parameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor initialState](self, "initialState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containedVariables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[WFModuleSummaryEditor initialState](self, "initialState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor variableProvider](self, "variableProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor variableUIDelegate](self, "variableUIDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__WFModuleSummaryEditor_variableMenuElementsForSlotWithIdentifier___block_invoke;
  v14[3] = &unk_24EE25210;
  v14[4] = self;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v4, "variableMenuElementsWithVariable:parameterState:variableProvider:variableUIDelegate:setVariableHandler:", v12, v9, v10, v11, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  if (!-[WFModuleSummaryEditor allowsPickingVariables](self, "allowsPickingVariables", a3))
    return 0;
  -[WFModuleSummaryEditor initialState](self, "initialState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containedVariables");
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
  -[WFModuleSummaryEditor parameter](self, "parameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor initialState](self, "initialState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__WFModuleSummaryEditor_clearButtonMenuItemForSlotWithIdentifier___block_invoke;
  v12[3] = &unk_24EE25210;
  v12[4] = self;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v8, "clearButtonMenuItemWithVariable:parameterState:setVariableHandler:", v10, v9, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  return 0;
}

- (BOOL)menuElementsContainDeferredElement:(id)a3 withEstimatedCountGreaterThan:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int64_t v12;
  BOOL v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(v11, "estimatedItemCount", (_QWORD)v16);
          v13 = 1;
          if (v12 < 0 || v12 > a4)
            goto LABEL_15;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "menuElements", (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[WFModuleSummaryEditor menuElementsContainDeferredElement:withEstimatedCountGreaterThan:](self, "menuElementsContainDeferredElement:withEstimatedCountGreaterThan:", v14, a4);

            goto LABEL_15;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)menuForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v41;
  _BOOL4 v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WFModuleSummaryEditor clearButtonMenuItemForSlotWithIdentifier:](self, "clearButtonMenuItemForSlotWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor variableMenuElementsForSlotWithIdentifier:](self, "variableMenuElementsForSlotWithIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor customMenuElementsForSlotWithIdentifier:style:](self, "customMenuElementsForSlotWithIdentifier:style:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && (a4 != 1 || v7 || objc_msgSend(v8, "count")) || objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    v46 = v9;
    v47 = v7;
    v45 = v10;
    if (objc_msgSend(v9, "count"))
    {
      v41 = -[WFModuleSummaryEditor menuElementsContainDeferredElement:withEstimatedCountGreaterThan:](self, "menuElementsContainDeferredElement:withEstimatedCountGreaterThan:", v9, 5);
      v11 = (unint64_t)objc_msgSend(v8, "count") > 1;
      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "menuElements");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (unint64_t)objc_msgSend(v13, "count") > 1;

          }
        }
        v42 = v11;

      }
      else
      {
        v42 = v11;
      }
      v43 = v8;
      v44 = v6;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v15 = v9;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v53 != v19)
              objc_enumerationMutation(v15);
            v21 = *(id *)(*((_QWORD *)&v52 + 1) + 8 * i);
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
            v23 = v22;

            if (v23)
              ++v18;
            v24 = v21;
            if (v21)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (objc_msgSend(v24, "shouldCollapse"))
                {
                  ++v18;
                }
                else
                {
                  objc_msgSend(v24, "menuElements");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 += objc_msgSend(v25, "count");

                }
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      v8 = v43;
      if (v42)
        v14 = v18 > 10 || v41;
      else
        v14 = 0;
      v6 = v44;
      v10 = v45;
      v9 = v46;
      v7 = v47;
    }
    else
    {
      v14 = 0;
    }
    -[WFModuleSummaryEditor initialState](self, "initialState");
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

    objc_msgSend(v28, "variable");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v14)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v8 = v8;
      v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v49 != v32)
              objc_enumerationMutation(v8);
            v34 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * j);
            v35 = v34;
            if (v34 && objc_msgSend(v34, "conformsToProtocol:", &unk_255903FE8))
              objc_msgSend(v35, "setStyle:", 0);

          }
          v31 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v31);
      }

      v7 = v47;
      if (v47)
      {
        v10 = v45;
        v9 = v46;
        if (v29)
        {
          objc_msgSend(v8, "arrayByAddingObject:", v47);
          v36 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v36;
        }
        else
        {
          objc_msgSend(v45, "addObject:", v47);
        }
      }
      else
      {
        v10 = v45;
        v9 = v46;
      }
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5180]), "initWithMenuElements:", v8);
      objc_msgSend(v38, "setStyle:", 1);
      WFLocalizedString(CFSTR("Variables…"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTitle:", v39);

      objc_msgSend(v10, "insertObject:atIndex:", v38, 0);
    }
    else
    {
      objc_msgSend(v10, "addObjectsFromArray:", v8);
      if (v7)
        objc_msgSend(v10, "addObject:", v7);
    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC5170]), "initWithElements:", v10);
    objc_msgSend(v37, "setShouldDisplayInFixedOrder:", v14);

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)requestEditingSlotIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryEditor:didRequestEditingSlotWithIdentifier:", self, v4);

}

- (void)beginEditingTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4 presentationAnchor:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[WFModuleSummaryEditor _beginEditingVariableAttachment:slotIdentifier:presentationAnchor:](self, "_beginEditingVariableAttachment:slotIdentifier:presentationAnchor:", v10, v8, v9);
  else
    -[WFModuleSummaryEditor completeEditing](self, "completeEditing");

}

- (BOOL)canTypeAlongsideVariables
{
  void *v2;
  void *v3;

  -[WFModuleSummaryEditor parameter](self, "parameter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "stateClass");

  return objc_msgSend(v3, "isSubclassOfClass:", objc_opt_class());
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t arrayIndex;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  -[WFModuleSummaryEditor delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "initialStateForSummaryEditor:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
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
  v12 = v11;

  if (!v7 && v12)
  {
    objc_msgSend(v12, "parameterStates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    arrayIndex = self->_arrayIndex;
    if (arrayIndex != 0x7FFFFFFFFFFFFFFFLL && arrayIndex < objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "removeObjectAtIndex:", self->_arrayIndex);
      v16 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParameterStates:", v14);

      goto LABEL_20;
    }

  }
  -[WFModuleSummaryEditor parameter](self, "parameter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "stateClass");

  if (v18 == (void *)objc_opt_class() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "stateByReplacingVariable:withVariable:", v6, v7);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v7 || !objc_msgSend(v18, "instancesRespondToSelector:", sel_initWithVariable_))
    {
      v16 = 0;
      goto LABEL_20;
    }
    v19 = objc_msgSend(objc_alloc((Class)v18), "initWithVariable:", v7);
  }
  v16 = (void *)v19;
LABEL_20:

  return v16;
}

- (void)_beginEditingVariableAttachment:(id)a3 slotIdentifier:(id)a4 presentationAnchor:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  WFVariableEditingAnchor *v17;
  void *v18;
  void *v19;
  void *v20;
  WFVariableEditingAnchor *v21;
  WFVariableEditingOptions *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD aBlock[5];

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "variable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryEditor setLastValueForEditingVariable:](self, "setLastValueForEditingVariable:", v9);

  -[WFModuleSummaryEditor variableUIDelegate](self, "variableUIDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  -[WFModuleSummaryEditor variableProvider](self, "variableProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke;
    aBlock[3] = &unk_24EE25238;
    aBlock[4] = self;
    v10 = _Block_copy(aBlock);
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke_2;
    v24[3] = &unk_24EE25B00;
    v24[4] = self;
    v13 = _Block_copy(v24);
    v14 = (void *)objc_opt_class();
    -[WFModuleSummaryEditor parameter](self, "parameter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "variableResultTypeForParameter:", v15);

    v17 = [WFVariableEditingAnchor alloc];
    objc_msgSend(v7, "variable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFModuleSummaryEditor variableProvider](self, "variableProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFModuleSummaryEditor parameter](self, "parameter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WFVariableEditingAnchor initWithVariable:variableProvider:parameter:](v17, "initWithVariable:variableProvider:parameter:", v18, v19, v20);

    v22 = -[WFVariableEditingOptions initWithAnchor:resultType:onChange:onFinish:]([WFVariableEditingOptions alloc], "initWithAnchor:resultType:onChange:onFinish:", v21, v16, v10, v13);
    -[WFModuleSummaryEditor variableUIDelegate](self, "variableUIDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sourceRect");
    objc_msgSend(v23, "showVariableEditorWithOptions:fromSourceRect:", v22);

LABEL_4:
  }

}

- (WFModuleSummarySupporting)parameter
{
  return self->_parameter;
}

- (unint64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (BOOL)isProcessing
{
  return self->_processing;
}

- (WFModuleSummaryEditorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (WFVariableProvider)variableProvider
{
  return (WFVariableProvider *)objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (void)setVariableProvider:(id)a3
{
  objc_storeWeak((id *)&self->_variableProvider, a3);
}

- (WFVariableUIDelegate)variableUIDelegate
{
  return (WFVariableUIDelegate *)objc_loadWeakRetained((id *)&self->_variableUIDelegate);
}

- (void)setVariableUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_variableUIDelegate, a3);
}

- (BOOL)allowsPickingVariables
{
  return self->_allowsPickingVariables;
}

- (void)setAllowsPickingVariables:(BOOL)a3
{
  self->_allowsPickingVariables = a3;
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  return (WFEditorAuxiliaryViewPresenter *)objc_loadWeakRetained((id *)&self->_auxiliaryViewPresenter);
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_auxiliaryViewPresenter, a3);
}

- (WFSlotTemplateTextEntry)textEntry
{
  return (WFSlotTemplateTextEntry *)objc_loadWeakRetained((id *)&self->_textEntry);
}

- (BOOL)returnToKeyboardOnComplete
{
  return self->_returnToKeyboardOnComplete;
}

- (void)setReturnToKeyboardOnComplete:(BOOL)a3
{
  self->_returnToKeyboardOnComplete = a3;
}

- (WFVariable)lastValueForEditingVariable
{
  return self->_lastValueForEditingVariable;
}

- (void)setLastValueForEditingVariable:(id)a3
{
  objc_storeStrong((id *)&self->_lastValueForEditingVariable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastValueForEditingVariable, 0);
  objc_destroyWeak((id *)&self->_textEntry);
  objc_destroyWeak((id *)&self->_auxiliaryViewPresenter);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

void __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summaryEditor:willUpdateVariable:", *(_QWORD *)(a1 + 32), v9);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "lastValueForEditingVariable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stateByReplacingVariableFromCurrentState:withVariable:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitState:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setLastValueForEditingVariable:", v9);
}

uint64_t __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setLastValueForEditingVariable:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setReturnToKeyboardOnComplete:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "completeEditing");
}

uint64_t __66__WFModuleSummaryEditor_clearButtonMenuItemForSlotWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "stateByReplacingVariableFromCurrentState:withVariable:", *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitState:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "completeEditing");
}

uint64_t __67__WFModuleSummaryEditor_variableMenuElementsForSlotWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "stateByReplacingVariableFromCurrentState:withVariable:", *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitState:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "completeEditing");
}

+ (BOOL)supportsEditingTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 0;
}

@end
