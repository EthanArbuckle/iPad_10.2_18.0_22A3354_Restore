@implementation WFModuleSummaryCoordinator

- (WFModuleSummaryCoordinator)init
{
  WFModuleSummaryCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *mutableStagedParameterStates;
  uint64_t v5;
  NSHashTable *variablesBeingObserved;
  uint64_t v7;
  NSArray *contents;
  WFModuleSummaryCoordinator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFModuleSummaryCoordinator;
  v2 = -[WFModuleSummaryCoordinator init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mutableStagedParameterStates = v2->_mutableStagedParameterStates;
    v2->_mutableStagedParameterStates = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    variablesBeingObserved = v2->_variablesBeingObserved;
    v2->_variablesBeingObserved = (NSHashTable *)v5;

    v7 = objc_opt_new();
    contents = v2->_contents;
    v2->_contents = (NSArray *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)setTemplateView:(id)a3
{
  id v5;
  WFSlotTemplateView **p_templateView;
  WFSlotTemplateView *v7;
  WFSlotTemplateView *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFSlotTemplateView *v16;

  v5 = a3;
  p_templateView = &self->_templateView;
  v7 = self->_templateView;
  v8 = (WFSlotTemplateView *)v5;
  v16 = v8;
  if (v7 == v8)
  {

    v10 = v16;
LABEL_13:

    goto LABEL_14;
  }
  if (v8 && v7)
  {
    v9 = -[WFSlotTemplateView isEqual:](v7, "isEqual:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  -[WFSlotTemplateView setDelegate:](*p_templateView, "setDelegate:", 0);
  -[WFSlotTemplateView deselectSlot](*p_templateView, "deselectSlot");
  -[WFSlotTemplateView typingSlotIdentifier](*p_templateView, "typingSlotIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[WFSlotTemplateView endTyping](*p_templateView, "endTyping");
  objc_storeStrong((id *)&self->_templateView, a3);
  -[WFSlotTemplateView setDelegate:](v16, "setDelegate:", self);
  -[WFModuleSummaryCoordinator contents](self, "contents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotTemplateView setContents:animated:](v16, "setContents:animated:", v12, 0);

  -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSlotTemplateView selectSlotWithIdentifier:](v16, "selectSlotWithIdentifier:", v14);

    -[WFModuleSummaryCoordinator currentlyTypingSlotIdentifier](self, "currentlyTypingSlotIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WFModuleSummaryCoordinator currentlyTypingSlotIdentifier](self, "currentlyTypingSlotIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotTemplateView beginTypingInSlotWithIdentifier:](v16, "beginTypingInSlotWithIdentifier:", v10);
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)updateTemplateContentsAnimated:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  v5 = (void *)objc_opt_class();
  -[WFModuleSummaryCoordinator stagedParameterStates](self, "stagedParameterStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator parameterStates](self, "parameterStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameterStatesByApplyingStaging:toOriginal:", v6, v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[WFModuleSummaryCoordinator templateBuilder](self, "templateBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator parameters](self, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator editableParameters](self, "editableParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator variableBeingEdited](self, "variableBeingEdited");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buildContentWithParameters:editableParameters:parameterStates:variableBeingEdited:", v9, v10, v16, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator setContents:](self, "setContents:", v12);

  -[WFModuleSummaryCoordinator contents](self, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator updateVariableObservationsWithContents:](self, "updateVariableObservationsWithContents:", v13);

  -[WFModuleSummaryCoordinator templateView](self, "templateView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator contents](self, "contents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:animated:", v15, v3);

}

- (void)setSummaryFormatString:(id)a3 withParameters:(id)a4 editableParameters:(id)a5 parameterStates:(id)a6
{
  id v10;
  id v11;
  NSString *summaryFormatString;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  void *v17;
  NSSet *editableParameters;
  NSSet *v19;
  NSSet *v20;
  NSSet *v21;
  int v22;
  NSSet *parameters;
  id v24;
  NSSet *v25;
  void *v26;
  char v27;
  NSDictionary *parameterStates;
  NSDictionary *v29;
  char v30;
  NSString *v31;
  NSString *v32;
  NSSet *v33;
  NSSet *v34;
  NSDictionary *v35;
  NSDictionary *v36;
  WFModuleSummaryTemplateBuilder *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  NSString *v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v50 = a4;
  v11 = a5;
  v51 = a6;
  summaryFormatString = self->_summaryFormatString;
  v13 = (NSString *)v10;
  v14 = summaryFormatString;
  v15 = v14;
  if (v14 == v13)
  {
    v16 = 1;
    goto LABEL_6;
  }
  v16 = 0;
  if (!v13)
  {
LABEL_6:
    v17 = v50;
    goto LABEL_7;
  }
  v17 = v50;
  if (v14)
    v16 = -[NSString isEqualToString:](v13, "isEqualToString:", v14);
LABEL_7:

  editableParameters = self->_editableParameters;
  v19 = (NSSet *)v11;
  v20 = editableParameters;
  v21 = v20;
  if (v20 == v19)
  {
    v22 = 1;
  }
  else
  {
    v22 = 0;
    if (v19 && v20)
      v22 = -[NSSet isEqual:](v19, "isEqual:", v20);
  }

  if (v16)
  {
    parameters = self->_parameters;
    v24 = v17;
    v25 = parameters;
    v26 = v25;
    if (v25 == v24)
    {
      v27 = 0;
    }
    else
    {
      if (!v24 || !v25)
      {
LABEL_25:

        goto LABEL_26;
      }
      v27 = objc_msgSend(v24, "isEqual:", v25) ^ 1;
    }

    if ((v27 & 1) == 0 && ((v22 ^ 1) & 1) == 0)
    {
      parameterStates = self->_parameterStates;
      v24 = v51;
      v29 = parameterStates;
      if (v29 == v24)
      {

        goto LABEL_41;
      }
      v26 = v29;
      if (v24 && v29)
      {
        v30 = objc_msgSend(v24, "isEqual:", v29);

        if ((v30 & 1) != 0)
          goto LABEL_41;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
LABEL_26:
  v31 = (NSString *)-[NSString copy](v13, "copy");
  v32 = self->_summaryFormatString;
  self->_summaryFormatString = v31;

  -[WFModuleSummaryCoordinator setParameters:](self, "setParameters:", v17);
  v33 = (NSSet *)-[NSSet copy](v19, "copy");
  v34 = self->_editableParameters;
  self->_editableParameters = v33;

  v35 = (NSDictionary *)objc_msgSend(v51, "copy");
  v36 = self->_parameterStates;
  self->_parameterStates = v35;

  if ((v16 & 1) == 0)
  {
    v37 = -[WFModuleSummaryTemplateBuilder initWithFormatString:]([WFModuleSummaryTemplateBuilder alloc], "initWithFormatString:", v13);
    -[WFModuleSummaryCoordinator setTemplateBuilder:](self, "setTemplateBuilder:", v37);

    v22 = 0;
  }
  -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", v22 ^ 1u);
  -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v49 = v13;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[WFModuleSummaryCoordinator contents](self, "contents");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v53 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v44, "identifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v45, "isEqual:", v46);

            if ((v47 & 1) != 0)
            {

              goto LABEL_40;
            }
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v41)
          continue;
        break;
      }
    }

    -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setDelegate:", 0);

    -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", 0);
LABEL_40:
    v13 = v49;
    v17 = v50;
  }
LABEL_41:

}

- (void)setParameters:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *v6;
  NSSet *v7;
  BOOL v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSSet *v21;
  NSSet *parameters;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_parameters;
  v6 = (NSSet *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v8 = -[NSSet isEqualToSet:](v5, "isEqualToSet:", v6);

      if (v8)
        goto LABEL_27;
    }
    else
    {

    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = self->_parameters;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (!-[NSSet containsObject:](v7, "containsObject:", v14))
            objc_msgSend(v14, "removeEventObserver:", self);
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v7;
    v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (!-[NSSet containsObject:](self->_parameters, "containsObject:", v20, (_QWORD)v23))
            objc_msgSend(v20, "addEventObserver:", self);
        }
        v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }

    v21 = (NSSet *)-[NSSet copy](v15, "copy");
    parameters = self->_parameters;
    self->_parameters = v21;

  }
LABEL_27:

}

- (void)slotTemplateViewTintColorDidChange:(id)a3
{
  id v3;

  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceViewTintColorDidChange");

}

- (void)setVariableProvider:(id)a3
{
  WFVariableProvider **p_variableProvider;
  id v5;
  id v6;

  p_variableProvider = &self->_variableProvider;
  v5 = a3;
  objc_storeWeak((id *)p_variableProvider, v5);
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariableProvider:", v5);

}

- (void)slotTemplateView:(id)a3 didSelectSlotWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  WFModuleSummaryCoordinator *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__WFModuleSummaryCoordinator_slotTemplateView_didSelectSlotWithIdentifier___block_invoke;
  v10[3] = &unk_24EE25290;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", v10);

}

- (void)slotTemplateView:(id)a3 didDeselectSlotWithIdentifier:(id)a4 completionHandler:(id)a5
{
  -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", a5, a4);
}

- (id)slotTemplateView:(id)a3 menuForSlotIdentifier:(id)a4 style:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  -[WFModuleSummaryCoordinator createSummaryEditorForSlotWithIdentifier:](self, "createSummaryEditorForSlotWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuForSlotWithIdentifier:style:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__WFModuleSummaryCoordinator_slotTemplateView_menuForSlotIdentifier_style___block_invoke;
    v12[3] = &unk_24EE25290;
    v12[4] = self;
    v13 = v8;
    v14 = v7;
    -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", v12);
    v10 = v9;

  }
  return v9;
}

- (void)menuDidDismissInSlotTemplateView:(id)a3
{
  if (!-[WFModuleSummaryCoordinator currentEditorIsEditing](self, "currentEditorIsEditing", a3))
    -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", 0);
}

- (BOOL)slotTemplateView:(id)a3 shouldTapTextAttachment:(id)a4 inSlotWithIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "parameterKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v9 && v10)
  {
    -[WFModuleSummaryCoordinator parameterForKey:](self, "parameterForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[objc_class supportsEditingTextAttachment:inSlotWithIdentifier:](-[WFModuleSummaryCoordinator editorClassForParameter:](self, "editorClassForParameter:", v13), "supportsEditingTextAttachment:inSlotWithIdentifier:", v7, v8);

  }
  return v12;
}

- (void)slotTemplateView:(id)a3 didTapTextAttachment:(id)a4 inSlotWithIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v7, "variable"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[WFModuleSummaryCoordinator variableBeingEdited](self, "variableBeingEdited"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 == v10))
  {
    -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", 0);
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __89__WFModuleSummaryCoordinator_slotTemplateView_didTapTextAttachment_inSlotWithIdentifier___block_invoke;
    v11[3] = &unk_24EE25290;
    v11[4] = self;
    v12 = v8;
    v13 = v7;
    -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", v11);

  }
}

- (void)slotTemplateView:(id)a3 willBeginTypingInSlotWithIdentifier:(id)a4 usingTextEntry:(id)a5 allowMultipleLines:(BOOL *)a6
{
  id v8;
  id v9;

  v8 = a5;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textEntryWillBegin:allowMultipleLines:", v8, a6);

}

- (BOOL)slotTemplateView:(id)a3 shouldChangeText:(id)a4 forSlotWithIdentifier:(id)a5
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "textEntryShouldChangeText:", v6);

  return v8;
}

- (void)slotTemplateView:(id)a3 didChangeText:(id)a4 forSlotWithIdentifier:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textEntryTextDidChange:", v6);

}

- (void)slotTemplateView:(id)a3 typingDidCutWithOriginalBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textEntryDidCutWithOriginalBlock:", v5);

}

- (void)slotTemplateView:(id)a3 typingDidCopyWithOriginalBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textEntryDidCopyWithOriginalBlock:", v5);

}

- (void)slotTemplateView:(id)a3 typingDidPasteWithOriginalBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textEntryDidPasteWithOriginalBlock:", v5);

}

- (void)slotTemplateView:(id)a3 didEndTypingInSlotWithIdentifier:(id)a4
{
  id v4;

  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textEntryDidFinish");

}

- (void)slotTemplateView:(id)a3 deletePressedOnSlotWithIdentifier:(id)a4 allowResettingValue:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v5 = a5;
  v7 = a4;
  objc_msgSend(v7, "parameterKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_array_add_"));

    if ((v10 & 1) == 0)
    {
      v11 = objc_msgSend(v7, "arrayIndex");
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v5)
        {
          -[WFModuleSummaryCoordinator parameterForKey:](self, "parameterForKey:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[WFModuleSummaryCoordinator updateBlock](self, "updateBlock");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              v14[0] = MEMORY[0x24BDAC760];
              v14[1] = 3221225472;
              v14[2] = __101__WFModuleSummaryCoordinator_slotTemplateView_deletePressedOnSlotWithIdentifier_allowResettingValue___block_invoke;
              v14[3] = &unk_24EE252E0;
              v14[4] = self;
              v15 = v8;
              -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", v14);

            }
          }

        }
      }
      else
      {
        -[WFModuleSummaryCoordinator removeElementFromArrayAtIndex:forParameterKey:](self, "removeElementFromArrayAtIndex:forParameterKey:", v11, v8);
      }
    }
  }

}

- (void)slotTemplateViewDidInvalidateSize:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[WFModuleSummaryCoordinator delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFModuleSummaryCoordinator delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "summaryCoordinatorDidInvalidateSize:", self);

  }
}

- (void)slotTemplateView:(id)a3 disclosureArrowDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[WFModuleSummaryCoordinator delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFModuleSummaryCoordinator delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "summaryCoordinator:disclosureArrowDidChange:", self, v4);

  }
}

- (void)slotTemplateView:(id)a3 outputButtonDidChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[WFModuleSummaryCoordinator delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFModuleSummaryCoordinator delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "summaryCoordinator:outputButtonDidChange:", self, v4);

  }
}

- (NSDictionary)stagedParameterStates
{
  void *v2;
  void *v3;

  -[WFModuleSummaryCoordinator mutableStagedParameterStates](self, "mutableStagedParameterStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (id)parameterForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFModuleSummaryCoordinator parameters](self, "parameters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)currentParameterStateForParameterKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[WFModuleSummaryCoordinator stagedParameterStates](self, "stagedParameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[WFModuleSummaryCoordinator parameterStates](self, "parameterStates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (Class)editorClassForParameter:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  return WFModuleSummaryEditorClassForParameterClass(v3);
}

- (id)createSummaryEditorForSlotWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "parameterKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "arrayIndex");

  v8 = 0;
  if (v5 && v6)
  {
    -[WFModuleSummaryCoordinator parameterForKey:](self, "parameterForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = (void *)objc_msgSend(objc_alloc(-[WFModuleSummaryCoordinator editorClassForParameter:](self, "editorClassForParameter:", v9)), "initWithParameter:arrayIndex:processing:", v9, v7, -[WFModuleSummaryCoordinator processing](self, "processing"));
      objc_msgSend(v8, "setDelegate:", self);
      -[WFModuleSummaryCoordinator variableProvider](self, "variableProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setVariableProvider:", v10);

      objc_msgSend(v8, "setVariableUIDelegate:", self);
      -[WFModuleSummaryCoordinator auxiliaryViewPresenter](self, "auxiliaryViewPresenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAuxiliaryViewPresenter:", v11);

      objc_msgSend(v8, "setAllowsPickingVariables:", -[WFModuleSummaryCoordinator allowsPickingVariables](self, "allowsPickingVariables"));
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)presentationAnchorForSlotWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WFModalPresentationAnchor *v12;

  v4 = a3;
  -[WFModuleSummaryCoordinator templateView](self, "templateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFModuleSummaryCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForCoordinator:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "sourceRectForSlotWithIdentifier:", v4);
      v12 = -[WFModalPresentationAnchor initWithSourceViewController:sourceView:sourceRect:]([WFModalPresentationAnchor alloc], "initWithSourceViewController:sourceView:sourceRect:", v7, v5, v8, v9, v10, v11);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)beginEditingSlotWithIdentifier:(id)a3 fromTextAttachment:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFModuleSummaryCoordinator.m"), 365, CFSTR("There's an active editor that hasn't been cancelled"));

  }
  -[WFModuleSummaryCoordinator createSummaryEditorForSlotWithIdentifier:](self, "createSummaryEditorForSlotWithIdentifier:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator presentationAnchorForSlotWithIdentifier:](self, "presentationAnchorForSlotWithIdentifier:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[WFModuleSummaryCoordinator templateView](self, "templateView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "key");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      -[WFModuleSummaryCoordinator setCurrentEditor:](self, "setCurrentEditor:", v9);
      -[WFModuleSummaryCoordinator setCurrentlyEditingSlotIdentifier:](self, "setCurrentlyEditingSlotIdentifier:", v19);
      -[WFModuleSummaryCoordinator setCurrentEditorIsEditing:](self, "setCurrentEditorIsEditing:", 1);
      -[WFModuleSummaryCoordinator delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[WFModuleSummaryCoordinator delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "summaryCoordinatorWillBeginEditing:", self);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "variable");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFModuleSummaryCoordinator setVariableBeingEdited:](self, "setVariableBeingEdited:", v17);

        -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 1);
      }
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("_array_add_")))
      {
        objc_msgSend(v9, "beginEditingNewArrayElementFromPresentationAnchor:", v10);
      }
      else if (v7)
      {
        objc_msgSend(v9, "beginEditingTextAttachment:inSlotWithIdentifier:presentationAnchor:", v7, v19, v10);
      }
      else
      {
        objc_msgSend(v9, "beginEditingSlotWithIdentifier:presentationAnchor:", v19, v10);
      }
    }

  }
}

- (id)addElementToArrayForParameterKey:(id)a3
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFModuleSummaryCoordinator parameterForKey:](self, "parameterForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFModuleSummaryCoordinator currentParameterStateForParameterKey:](self, "currentParameterStateForParameterKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "defaultStateForNewArrayElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "stateByAppendingValue:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = objc_alloc((Class)objc_msgSend(v5, "multipleStateClass"));
        v22[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v10, "initWithParameterStates:", v11);

      }
      -[WFModuleSummaryCoordinator mutableStagedParameterStates](self, "mutableStagedParameterStates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v8, v4);

      objc_msgSend(v8, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count") - 1;

      objc_msgSend(v5, "moduleSummarySlotForState:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "identifierBySettingParameterKey:arrayIndex:", v4, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIdentifier:", v16);

      -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 1);
      -[WFModuleSummaryCoordinator delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[WFModuleSummaryCoordinator delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "summaryCoordinatorDidInvalidateSize:", self);

      }
      -[WFModuleSummaryCoordinator templateView](self, "templateView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectSlotWithIdentifier:", v20);

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

  return v9;
}

- (void)removeElementFromArrayAtIndex:(unint64_t)a3 forParameterKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a4;
  -[WFModuleSummaryCoordinator parameterForKey:](self, "parameterForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFModuleSummaryCoordinator currentParameterStateForParameterKey:](self, "currentParameterStateForParameterKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFModuleSummaryCoordinator updateBlock](self, "updateBlock");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v12 = v8;
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 > a3)
        {
          objc_msgSend(v12, "stateByRemovingValueAtIndex:", a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __76__WFModuleSummaryCoordinator_removeElementFromArrayAtIndex_forParameterKey___block_invoke;
          v17[3] = &unk_24EE25290;
          v17[4] = self;
          v18 = v6;
          v19 = v15;
          v16 = v15;
          -[WFModuleSummaryCoordinator cancelEditingWithCompletionHandler:](self, "cancelEditingWithCompletionHandler:", v17);

        }
      }
    }

  }
}

- (void)destroyCurrentEditor
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[WFModuleSummaryCoordinator setCurrentEditor:](self, "setCurrentEditor:", 0);
  -[WFModuleSummaryCoordinator setCurrentlyTypingSlotIdentifier:](self, "setCurrentlyTypingSlotIdentifier:", 0);
  -[WFModuleSummaryCoordinator setCurrentlyEditingSlotIdentifier:](self, "setCurrentlyEditingSlotIdentifier:", 0);
  -[WFModuleSummaryCoordinator setCurrentEditorIsEditing:](self, "setCurrentEditorIsEditing:", 0);
  -[WFModuleSummaryCoordinator mutableStagedParameterStates](self, "mutableStagedParameterStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WFModuleSummaryCoordinator variableBeingEdited](self, "variableBeingEdited");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFModuleSummaryCoordinator setVariableBeingEdited:](self, "setVariableBeingEdited:", 0);
    -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 1);
  }
  -[WFModuleSummaryCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFModuleSummaryCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summaryCoordinatorDidEndEditing:", self);

  }
  -[WFModuleSummaryCoordinator templateView](self, "templateView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectSlot");

}

- (id)firstSlotIdentifierWithParameterKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFModuleSummaryCoordinator contents](self, "contents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "parameterKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {

            goto LABEL_13;
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFModuleSummaryCoordinator templateView](self, "templateView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endTyping");

    -[WFModuleSummaryCoordinator destroyCurrentEditor](self, "destroyCurrentEditor");
    objc_msgSend(v4, "setDelegate:", 0);
    if (v7)
      v6 = v7;
    else
      v6 = (void (**)(void))&__block_literal_global_135;
    objc_msgSend(v4, "cancelEditingWithCompletionHandler:", v6);
  }
  else if (v7)
  {
    v7[2]();
  }

}

- (id)initialStateForSummaryEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFModuleSummaryCoordinator parameterStates](self, "parameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v9, "parameterStateIsValid:", v8);
  if ((_DWORD)v4)
    v10 = v8;
  else
    v10 = 0;

  return v10;
}

- (void)summaryEditor:(id)a3 didRequestEditingSlotWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v15)
    goto LABEL_2;
  -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v9;
  if (v8 == v9)
  {

LABEL_10:
    -[WFModuleSummaryCoordinator presentationAnchorForSlotWithIdentifier:](self, "presentationAnchorForSlotWithIdentifier:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WFModuleSummaryCoordinator setCurrentEditorIsEditing:](self, "setCurrentEditorIsEditing:", 1);
      -[WFModuleSummaryCoordinator delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[WFModuleSummaryCoordinator delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "summaryCoordinatorWillBeginEditing:", self);

      }
      objc_msgSend(v15, "beginEditingSlotWithIdentifier:presentationAnchor:", v10, v7);
    }
    goto LABEL_2;
  }
  if (v9 && v8)
  {
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_3;
    goto LABEL_10;
  }

  v7 = v15;
LABEL_2:

LABEL_3:
}

- (void)summaryEditorDidRequestTextEntry:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator setCurrentlyTypingSlotIdentifier:](self, "setCurrentlyTypingSlotIdentifier:", v4);

  -[WFModuleSummaryCoordinator templateView](self, "templateView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTypingInSlotWithIdentifier:", v5);

}

- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  WFModuleSummaryCoordinator *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a5;
  -[WFModuleSummaryCoordinator currentlyEditingSlotIdentifier](self, "currentlyEditingSlotIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator destroyCurrentEditor](self, "destroyCurrentEditor");
  if (v7)
  {
    if (v5)
    {
      -[WFModuleSummaryCoordinator templateView](self, "templateView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectSlotWithIdentifier:", v7);

      v9 = self;
      v10 = v7;
      v11 = 0;
LABEL_6:
      -[WFModuleSummaryCoordinator beginEditingSlotWithIdentifier:fromTextAttachment:](v9, "beginEditingSlotWithIdentifier:fromTextAttachment:", v10, v11);
      goto LABEL_7;
    }
    if (v13)
    {
      -[WFModuleSummaryCoordinator templateView](self, "templateView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endTyping");

      v9 = self;
      v10 = v7;
      v11 = v13;
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)summaryEditor:(id)a3 didStageParameterState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "parameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "arrayIndex");
  objc_msgSend(v7, "parameter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFModuleSummaryCoordinator transformParameterStateForSerialization:arrayIndex:parameter:](self, "transformParameterStateForSerialization:arrayIndex:parameter:", v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFModuleSummaryCoordinator mutableStagedParameterStates](self, "mutableStagedParameterStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setObject:forKey:", v11, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v16);

  }
  -[WFModuleSummaryCoordinator currentlyTypingSlotIdentifier](self, "currentlyTypingSlotIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 0);

}

- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "parameter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator commitParameterState:forKey:](self, "commitParameterState:forKey:", v6, v7);

}

- (void)summaryEditor:(id)a3 didCommitAuxiliaryParameterState:(id)a4 forKey:(id)a5
{
  -[WFModuleSummaryCoordinator commitParameterState:forKey:](self, "commitParameterState:forKey:", a4, a5);
}

- (void)commitParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *parameterStates;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  id v24;

  v24 = a4;
  v6 = a3;
  -[WFModuleSummaryCoordinator parameterForKey:](self, "parameterForKey:", v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", v24))
  {
    -[WFModuleSummaryCoordinator currentEditor](self, "currentEditor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "arrayIndex");

  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  -[WFModuleSummaryCoordinator transformParameterStateForSerialization:arrayIndex:parameter:](self, "transformParameterStateForSerialization:arrayIndex:parameter:", v6, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFModuleSummaryCoordinator mutableStagedParameterStates](self, "mutableStagedParameterStates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v24);

  -[WFModuleSummaryCoordinator parameterStates](self, "parameterStates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_opt_new();
  v19 = v18;

  if (v13)
    objc_msgSend(v19, "setObject:forKey:", v13, v24);
  else
    objc_msgSend(v19, "removeObjectForKey:", v24);
  v20 = (NSDictionary *)objc_msgSend(v19, "copy");
  parameterStates = self->_parameterStates;
  self->_parameterStates = v20;

  -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 0);
  -[WFModuleSummaryCoordinator updateBlock](self, "updateBlock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[WFModuleSummaryCoordinator updateBlock](self, "updateBlock");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v23)[2](v23, v24, v13);

  }
}

- (id)transformParameterStateForSerialization:(id)a3 arrayIndex:(unint64_t)a4 parameter:(id)a5
{
  id v8;
  id v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (v9)
      {
        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend(v9, "key");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFModuleSummaryCoordinator currentParameterStateForParameterKey:](self, "currentParameterStateForParameterKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(v13, "value");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "count");

            if (v15 > a4)
            {
              objc_msgSend(v13, "stateByReplacingValueAtIndex:withValue:", a4, v8);
              v16 = objc_claimAutoreleasedReturnValue();
LABEL_14:
              v17 = (id)v16;

              goto LABEL_15;
            }
            if (objc_msgSend(v9, "isRangedSizeArray"))
            {
              v18 = objc_msgSend(v9, "arrayMaxCountForWidgetFamily:", 3);
              objc_msgSend(v13, "value");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "count");

              if (v20 < v18)
              {
                objc_msgSend(v13, "stateByAppendingValue:", v8);
                v16 = objc_claimAutoreleasedReturnValue();
                goto LABEL_14;
              }
            }

          }
          v21 = objc_alloc((Class)objc_msgSend(v9, "multipleStateClass"));
          v23[0] = v8;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v21, "initWithParameterStates:", v13);
          goto LABEL_14;
        }
      }
    }
  }
  v17 = v8;
LABEL_15:

  return v17;
}

- (void)summaryEditor:(id)a3 willUpdateVariable:(id)a4
{
  -[WFModuleSummaryCoordinator setVariableBeingEdited:](self, "setVariableBeingEdited:", a4);
}

- (void)updateVariableObservationsWithContents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFModuleSummaryCoordinator variablesBeingObserved](self, "variablesBeingObserved");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "removeDelegate:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[WFModuleSummaryCoordinator variablesBeingObserved](self, "variablesBeingObserved");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  v11 = (void *)objc_opt_class();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__WFModuleSummaryCoordinator_updateVariableObservationsWithContents___block_invoke;
  v12[3] = &unk_24EE24940;
  v12[4] = self;
  objc_msgSend(v11, "enumerateVariableAttachmentsInContents:withBlock:", v4, v12);

}

- (void)variableDidChange:(id)a3
{
  -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 1);
}

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  v10 = -[WFModuleSummaryCoordinator currentEditorIsEditing](self, "currentEditorIsEditing");
  -[WFModuleSummaryCoordinator setCurrentEditorIsEditing:](self, "setCurrentEditorIsEditing:", 1);
  -[WFModuleSummaryCoordinator variableUIDelegate](self, "variableUIDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __109__WFModuleSummaryCoordinator_showActionOutputPickerAllowingShortcutInput_variableProvider_completionHandler___block_invoke;
  v13[3] = &unk_24EE24990;
  v15 = v10;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "showActionOutputPickerAllowingShortcutInput:variableProvider:completionHandler:", v6, v9, v13);

}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WFModuleSummaryCoordinator variableUIDelegate](self, "variableUIDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "revealAction:preScrollHandler:goBackHandler:scrolledAwayHandler:", v13, v12, v11, v10);

}

- (void)showParameterEditingHint:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFModuleSummaryCoordinator variableUIDelegate](self, "variableUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFModuleSummaryCoordinator variableUIDelegate](self, "variableUIDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showParameterEditingHint:", v7);

  }
}

- (void)showVariableEditorWithOptions:(id)a3 fromSourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  -[WFModuleSummaryCoordinator variableUIDelegate](self, "variableUIDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFModuleSummaryCoordinator variableUIDelegate](self, "variableUIDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showVariableEditorWithOptions:fromSourceRect:", v12, x, y, width, height);

  }
}

- (void)parameterAttributesDidChange:(id)a3
{
  -[WFModuleSummaryCoordinator updateTemplateContentsAnimated:](self, "updateTemplateContentsAnimated:", 0);
}

- (NSString)summaryFormatString
{
  return self->_summaryFormatString;
}

- (NSSet)parameters
{
  return self->_parameters;
}

- (NSSet)editableParameters
{
  return self->_editableParameters;
}

- (NSDictionary)parameterStates
{
  return self->_parameterStates;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)processing
{
  return self->_processing;
}

- (void)setProcessing:(BOOL)a3
{
  self->_processing = a3;
}

- (WFModuleSummaryCoordinatorDelegate)delegate
{
  return (WFModuleSummaryCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFVariableProvider)variableProvider
{
  return (WFVariableProvider *)objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (WFVariableUIDelegate)variableUIDelegate
{
  return (WFVariableUIDelegate *)objc_loadWeakRetained((id *)&self->_variableUIDelegate);
}

- (void)setVariableUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_variableUIDelegate, a3);
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  return (WFEditorAuxiliaryViewPresenter *)objc_loadWeakRetained((id *)&self->_auxiliaryViewPresenter);
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_auxiliaryViewPresenter, a3);
}

- (BOOL)allowsPickingVariables
{
  return self->_allowsPickingVariables;
}

- (void)setAllowsPickingVariables:(BOOL)a3
{
  self->_allowsPickingVariables = a3;
}

- (WFSlotTemplateView)templateView
{
  return self->_templateView;
}

- (BOOL)currentEditorIsEditing
{
  return self->_currentEditorIsEditing;
}

- (void)setCurrentEditorIsEditing:(BOOL)a3
{
  self->_currentEditorIsEditing = a3;
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSMutableDictionary)mutableStagedParameterStates
{
  return self->_mutableStagedParameterStates;
}

- (void)setMutableStagedParameterStates:(id)a3
{
  objc_storeStrong((id *)&self->_mutableStagedParameterStates, a3);
}

- (WFModuleSummaryEditor)currentEditor
{
  return self->_currentEditor;
}

- (void)setCurrentEditor:(id)a3
{
  objc_storeStrong((id *)&self->_currentEditor, a3);
}

- (WFSlotIdentifier)currentlyEditingSlotIdentifier
{
  return self->_currentlyEditingSlotIdentifier;
}

- (void)setCurrentlyEditingSlotIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyEditingSlotIdentifier, a3);
}

- (WFSlotIdentifier)currentlyTypingSlotIdentifier
{
  return self->_currentlyTypingSlotIdentifier;
}

- (void)setCurrentlyTypingSlotIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyTypingSlotIdentifier, a3);
}

- (WFModuleSummaryTemplateBuilder)templateBuilder
{
  return self->_templateBuilder;
}

- (void)setTemplateBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_templateBuilder, a3);
}

- (WFVariable)variableBeingEdited
{
  return self->_variableBeingEdited;
}

- (void)setVariableBeingEdited:(id)a3
{
  objc_storeStrong((id *)&self->_variableBeingEdited, a3);
}

- (NSHashTable)variablesBeingObserved
{
  return self->_variablesBeingObserved;
}

- (void)setVariablesBeingObserved:(id)a3
{
  objc_storeStrong((id *)&self->_variablesBeingObserved, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variablesBeingObserved, 0);
  objc_storeStrong((id *)&self->_variableBeingEdited, 0);
  objc_storeStrong((id *)&self->_templateBuilder, 0);
  objc_storeStrong((id *)&self->_currentlyTypingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_currentlyEditingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_currentEditor, 0);
  objc_storeStrong((id *)&self->_mutableStagedParameterStates, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_templateView, 0);
  objc_destroyWeak((id *)&self->_auxiliaryViewPresenter);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_parameterStates, 0);
  objc_storeStrong((id *)&self->_editableParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_summaryFormatString, 0);
}

uint64_t __109__WFModuleSummaryCoordinator_showActionOutputPickerAllowingShortcutInput_variableProvider_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (!*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "cancelEditingWithCompletionHandler:", 0);
  return result;
}

void __69__WFModuleSummaryCoordinator_updateVariableObservationsWithContents___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "variable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:", *(_QWORD *)(a1 + 32));

}

void __76__WFModuleSummaryCoordinator_removeElementFromArrayAtIndex_forParameterKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __101__WFModuleSummaryCoordinator_slotTemplateView_deletePressedOnSlotWithIdentifier_allowResettingValue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updateBlock");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), 0);

}

uint64_t __89__WFModuleSummaryCoordinator_slotTemplateView_didTapTextAttachment_inSlotWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginEditingSlotWithIdentifier:fromTextAttachment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __75__WFModuleSummaryCoordinator_slotTemplateView_menuForSlotIdentifier_style___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentEditor:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentlyEditingSlotIdentifier:", *(_QWORD *)(a1 + 48));
}

void __75__WFModuleSummaryCoordinator_slotTemplateView_didSelectSlotWithIdentifier___block_invoke(id *a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a1[4];
  objc_msgSend(a1[4], "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_array_add_"));

  if (v3)
  {
    objc_msgSend(a1[5], "deselectSlot");
    v4 = a1[6];
    objc_msgSend(a1[4], "parameterKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addElementToArrayForParameterKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v7;
    }

  }
  objc_msgSend(a1[6], "beginEditingSlotWithIdentifier:fromTextAttachment:", v8, 0);

}

+ (void)enumerateVariableAttachmentsInContents:(id)a3 withBlock:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x24BEBB318];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          objc_msgSend(v12, "contentAttributedString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "contentAttributedString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __79__WFModuleSummaryCoordinator_enumerateVariableAttachmentsInContents_withBlock___block_invoke;
          v17[3] = &unk_24EE24918;
          v18 = v16;
          objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v15, 0, v17);

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

+ (id)parameterStatesByApplyingStaging:(id)a3 toOriginal:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__WFModuleSummaryCoordinator_parameterStatesByApplyingStaging_toOriginal___block_invoke;
    v14[3] = &unk_24EE24968;
    v12 = v11;
    v15 = v12;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v14);
    v7 = v12;

  }
  return v7;
}

+ (double)heightForWidth:(double)a3 withSummaryFormatString:(id)a4 parameters:(id)a5 editableParameters:(id)a6 parameterStates:(id)a7 stagedParameterStates:(id)a8 horizontalPadding:(double)a9 font:(id)a10 unpopulatedFont:(id)a11 textAlignment:(int64_t)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  WFModuleSummaryTemplateBuilder *v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  _QWORD v33[4];
  id v34;

  v20 = a10;
  v21 = a11;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  objc_msgSend(a1, "parameterStatesByApplyingStaging:toOriginal:", a8, a7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[WFModuleSummaryTemplateBuilder initWithFormatString:]([WFModuleSummaryTemplateBuilder alloc], "initWithFormatString:", v24);

  -[WFModuleSummaryTemplateBuilder buildContentWithParameters:editableParameters:parameterStates:variableBeingEdited:](v26, "buildContentWithParameters:editableParameters:parameterStates:variableBeingEdited:", v23, v22, v25, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "count"))
  {
    v28 = (void *)objc_opt_class();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __190__WFModuleSummaryCoordinator_heightForWidth_withSummaryFormatString_parameters_editableParameters_parameterStates_stagedParameterStates_horizontalPadding_font_unpopulatedFont_textAlignment___block_invoke;
    v33[3] = &unk_24EE24940;
    v29 = v20;
    v34 = v29;
    objc_msgSend(v28, "enumerateVariableAttachmentsInContents:withBlock:", v27, v33);
    +[WFSlotTemplateView heightForWidth:withContents:horizontalPadding:font:unpopulatedFont:alignment:](WFSlotTemplateView, "heightForWidth:withContents:horizontalPadding:font:unpopulatedFont:alignment:", v27, v29, v21, a12, a3, a9);
    v31 = v30;

  }
  else
  {
    v31 = 0.0;
  }

  return v31;
}

uint64_t __190__WFModuleSummaryCoordinator_heightForWidth_withSummaryFormatString_parameters_editableParameters_parameterStates_stagedParameterStates_horizontalPadding_font_unpopulatedFont_textAlignment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFont:", *(_QWORD *)(a1 + 32));
}

void __74__WFModuleSummaryCoordinator_parameterStatesByApplyingStaging_toOriginal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v7, "removeObjectForKey:", v5);
  else
    objc_msgSend(v7, "setObject:forKey:", v8, v5);

}

void __79__WFModuleSummaryCoordinator_enumerateVariableAttachmentsInContents_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
