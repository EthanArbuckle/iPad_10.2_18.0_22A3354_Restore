@implementation WFVariableSuggester

- (WFVariableSuggester)init
{
  char *v2;
  WFVariableSuggester *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFVariableSuggester;
  v2 = -[WFVariableSuggester init](&v6, sel_init);
  v3 = (WFVariableSuggester *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 56) = xmmword_1C1B47E40;
    v4 = v2;
  }

  return v3;
}

- (void)setSuggestedVariables:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_suggestedVariables) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestedVariables, a3);
    -[WFVariableSuggester delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "variableSuggesterSuggestionsDidChange:", self);

  }
}

- (void)setCurrentVariables:(id)a3
{
  NSArray *v4;
  NSArray *currentVariables;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_currentVariables) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    currentVariables = self->_currentVariables;
    self->_currentVariables = v4;

    -[WFVariableSuggester availableVariablesDidChange](self, "availableVariablesDidChange");
  }

}

- (void)setUserDefinedVariableNames:(id)a3
{
  NSArray *v4;
  NSArray *userDefinedVariableNames;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_userDefinedVariableNames) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    userDefinedVariableNames = self->_userDefinedVariableNames;
    self->_userDefinedVariableNames = v4;

  }
}

- (void)setOutputActions:(id)a3
{
  NSArray *v4;
  NSArray *outputActions;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_outputActions) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    outputActions = self->_outputActions;
    self->_outputActions = v4;

  }
}

- (void)setMaxSuggestionsCount:(unint64_t)a3
{
  if (self->_maxSuggestionsCount != a3)
  {
    self->_maxSuggestionsCount = a3;
    -[WFVariableSuggester availableVariablesDidChange](self, "availableVariablesDidChange");
  }
}

- (void)setMinSuggestionsCount:(unint64_t)a3
{
  if (self->_minSuggestionsCount != a3)
  {
    self->_minSuggestionsCount = a3;
    -[WFVariableSuggester availableVariablesDidChange](self, "availableVariablesDidChange");
  }
}

- (void)availableVariablesDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  WFVariableSuggester *v38;
  _QWORD *v39;
  _QWORD v40[4];
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[WFVariableSuggester outputActions](self, "outputActions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableSuggester userDefinedVariableNames](self, "userDefinedVariableNames");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableSuggester currentVariables](self, "currentVariables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_44074);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v34, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v11, "outputName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v12);
          if (objc_msgSend(v4, "containsObject:", v12))
            objc_msgSend(v6, "insertObject:atIndex:", v11, 0);
          else
            objc_msgSend(v6, "addObject:", v11);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v8);
  }

  v13 = -[WFVariableSuggester maxSuggestionsCount](self, "maxSuggestionsCount");
  v14 = objc_msgSend(v32, "count");
  v15 = objc_msgSend(v6, "count");
  if ((uint64_t)(v13 - v14) >= v15)
    v16 = v15;
  else
    v16 = v13 - v14;
  v17 = objc_msgSend(v6, "count");
  v18 = -[WFVariableSuggester minSuggestionsCount](self, "minSuggestionsCount");
  if (v17 >= v18)
    v19 = v18;
  else
    v19 = v17;
  if (v16 <= v19)
    v20 = v19;
  else
    v20 = v16;
  objc_msgSend(v6, "subarrayWithRange:", 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v21, "mutableCopy");

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v35);
  v23 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __50__WFVariableSuggester_availableVariablesDidChange__block_invoke_2;
  v41[3] = &unk_1E7AF4600;
  v31 = v22;
  v42 = v31;
  objc_msgSend(v6, "if_compactMap:", v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  objc_msgSend(v35, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v23;
  v36[1] = 3221225472;
  v36[2] = __50__WFVariableSuggester_availableVariablesDidChange__block_invoke_3;
  v36[3] = &unk_1E7AF4628;
  v39 = v40;
  v27 = v24;
  v37 = v27;
  v38 = self;
  objc_msgSend(v26, "if_map:", v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reverseObjectEnumerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableSuggester setSuggestedVariables:](self, "setSuggestedVariables:", v30);

  _Block_object_dispose(v40, 8);
}

- (WFVariableSuggesterDelegate)delegate
{
  return (WFVariableSuggesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFVariableProvider)variableProvider
{
  return (WFVariableProvider *)objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (void)setVariableProvider:(id)a3
{
  objc_storeWeak((id *)&self->_variableProvider, a3);
}

- (NSArray)suggestedVariables
{
  return self->_suggestedVariables;
}

- (NSArray)currentVariables
{
  return self->_currentVariables;
}

- (NSArray)userDefinedVariableNames
{
  return self->_userDefinedVariableNames;
}

- (NSArray)outputActions
{
  return self->_outputActions;
}

- (unint64_t)maxSuggestionsCount
{
  return self->_maxSuggestionsCount;
}

- (unint64_t)minSuggestionsCount
{
  return self->_minSuggestionsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputActions, 0);
  objc_storeStrong((id *)&self->_userDefinedVariableNames, 0);
  objc_storeStrong((id *)&self->_currentVariables, 0);
  objc_storeStrong((id *)&self->_suggestedVariables, 0);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

id __50__WFVariableSuggester_availableVariablesDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "outputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDefaultOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) | v6)
    v7 = 0;
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

WFActionOutputVariable *__50__WFVariableSuggester_availableVariablesDidChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  WFActionOutputVariable *v10;
  void *v11;
  WFActionOutputVariable *v12;

  v3 = a2;
  objc_msgSend(v3, "outputName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDefaultOutputName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 <= 4)
  {
    if (v7 < objc_msgSend(*(id *)(a1 + 32), "count"))
      v8 = v6;
    else
      v8 = 0;
    if (v8 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "count") + ~*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v9 = objc_claimAutoreleasedReturnValue();

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v3 = (id)v9;
    }
  }
  v10 = [WFActionOutputVariable alloc];
  objc_msgSend(*(id *)(a1 + 40), "variableProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFActionOutputVariable initWithAction:variableProvider:aggrandizements:](v10, "initWithAction:variableProvider:aggrandizements:", v3, v11, 0);

  return v12;
}

id __50__WFVariableSuggester_availableVariablesDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "action");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "outputName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
