@implementation WFMultipleValueParameterState

- (WFMultipleValueParameterState)initWithValue:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WFMultipleValueParameterState *v11;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMultipleValueParameterState.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[entry isKindOfClass:[WFMultipleValueParameterStateEntry class]]"));

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v13.receiver = self;
  v13.super_class = (Class)WFMultipleValueParameterState;
  v11 = -[WFVariableSubstitutableParameterState initWithValue:](&v13, sel_initWithValue_, v5);

  return v11;
}

- (WFMultipleValueParameterState)initWithParameterStates:(id)a3
{
  void *v4;
  WFMultipleValueParameterState *v5;

  objc_msgSend(a3, "if_map:", &__block_literal_global_137);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFMultipleValueParameterState initWithValue:](self, "initWithValue:", v4);

  return v5;
}

- (NSArray)parameterStates
{
  void *v2;
  void *v3;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)containedVariables
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18.receiver = self;
  v18.super_class = (Class)WFMultipleValueParameterState;
  -[WFVariableSubstitutableParameterState containedVariables](&v18, sel_containedVariables);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[WFVariableSubstitutableParameterState value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "parameterState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "containedVariables");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)stateByReplacingVariable:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  WFMultipleValueParameterStateEntry *(*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = objc_alloc((Class)objc_opt_class());
    -[WFVariableSubstitutableParameterState value](self, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __71__WFMultipleValueParameterState_stateByReplacingVariable_withVariable___block_invoke;
    v20 = &unk_1E7AEE0D0;
    v21 = v6;
    v22 = v7;
    objc_msgSend(v11, "if_map:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithValue:", v12, v17, v18, v19, v20);

  }
  else
  {
    v14 = objc_alloc((Class)objc_opt_class());
    if (v7)
      v15 = objc_msgSend(v14, "initWithVariable:", v7);
    else
      v15 = objc_msgSend(v14, "initWithParameterStates:", MEMORY[0x1E0C9AA60]);
    v13 = (void *)v15;
  }

  return v13;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  WFMultipleValueParameterState *v47;
  id v48;
  _QWORD *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[3];
  char v72;
  _QWORD v73[5];
  id v74;
  objc_class *v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[5];
  id v79;
  _QWORD aBlock[4];
  id v81;
  id v82;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  aBlock[3] = &unk_1E7AEE0F8;
  v12 = v8;
  v81 = v12;
  v13 = v10;
  v82 = v13;
  v14 = _Block_copy(aBlock);
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    v72 = 0;
    objc_msgSend(v12, "parameter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "singleStateClass");

    if (!objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()))
    {
      -[WFMultipleValueParameterState parameterStates](self, "parameterStates");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v11;
      v45[1] = 3221225472;
      v45[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5_171;
      v45[3] = &unk_1E7AEE228;
      v46 = v12;
      v47 = self;
      v49 = v71;
      v48 = v9;
      v42[0] = v11;
      v42[1] = 3221225472;
      v42[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_12;
      v42[3] = &unk_1E7AEE250;
      v44 = v71;
      v43 = v14;
      objc_msgSend(v36, "if_flatMapAsynchronously:completionHandler:", v45, v42);

      v37 = v46;
LABEL_22:

      _Block_object_dispose(v71, 8);
      goto LABEL_23;
    }
    -[WFMultipleValueParameterState parameterStates](self, "parameterStates");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_new();
    v25 = (void *)objc_opt_new();
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__16206;
    v69 = __Block_byref_object_dispose__16207;
    v70 = 0;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    v55[0] = v11;
    v55[1] = 3221225472;
    v55[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_161;
    v55[3] = &unk_1E7AEE148;
    v26 = v12;
    v56 = v26;
    v59 = &v65;
    v60 = &v61;
    v27 = v24;
    v57 = v27;
    v28 = v25;
    v58 = v28;
    objc_msgSend(v41, "enumerateObjectsUsingBlock:", v55);
    if (v62[3])
    {
      objc_msgSend(v28, "allValues");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        objc_msgSend(v28, "allValues");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "if_compactMap:", &__block_literal_global_166);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "variableSource");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3_167;
        v50[3] = &unk_1E7AEE1D8;
        v54 = v14;
        v51 = v28;
        v52 = v26;
        v53 = v27;
        objc_msgSend(v33, "requestAccessToFileAtLocations:completionHandler:", v32, v50);

LABEL_21:
        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(&v65, 8);

        v37 = v41;
        goto LABEL_22;
      }
      v39 = 0;
      v38 = v27;
    }
    else
    {
      v38 = 0;
      v39 = v66[5];
    }
    (*((void (**)(void *, id, uint64_t))v14 + 2))(v14, v38, v39);
    goto LABEL_21;
  }
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "prompt");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v17, 0);

LABEL_15:
      goto LABEL_23;
    }
  }

  objc_msgSend(v12, "parameter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (objc_class *)objc_msgSend(v18, "singleStateClass");

  if (-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()))
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v11;
    v78[1] = 3221225472;
    v78[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v78[3] = &unk_1E7AF6F98;
    v78[4] = self;
    v79 = v14;
    objc_msgSend(v20, "getContentWithContext:completionHandler:", v12, v78);

    v21 = v79;
  }
  else
  {
    if ((-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
      || -[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", objc_opt_class()))
    {
      v34 = [v19 alloc];
      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v34, "initWithVariable:", v35);

      v76[0] = v11;
      v76[1] = 3221225472;
      v76[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5;
      v76[3] = &unk_1E7AEF370;
      v77 = v14;
      objc_msgSend(v16, "processWithContext:userInputRequiredHandler:valueHandler:", v12, v9, v76);

      goto LABEL_15;
    }
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v11;
    v73[1] = 3221225472;
    v73[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6;
    v73[3] = &unk_1E7AEE120;
    v73[4] = self;
    v75 = v19;
    v74 = v14;
    objc_msgSend(v40, "getContentWithContext:completionHandler:", v12, v73);

    v21 = v74;
  }

LABEL_23:
}

- (void)finishProcessingWithContent:(id)a3 error:(id)a4 forParameterStateClass:(Class)a5 valueHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(void);
  _QWORD v15[4];
  _QWORD *v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    v14 = (void (*)(void))*((_QWORD *)v11 + 2);
LABEL_8:
    v14();
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v14 = (void (*)(void))v12[2];
    goto LABEL_8;
  }
  v13 = -[objc_class processingValueClass](a5, "processingValueClass");
  if (v13 == objc_opt_class())
  {
    v14 = (void (*)(void))v12[2];
    goto LABEL_8;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __103__WFMultipleValueParameterState_finishProcessingWithContent_error_forParameterStateClass_valueHandler___block_invoke;
  v15[3] = &unk_1E7AF0C10;
  v16 = v12;
  objc_msgSend(v9, "getObjectRepresentations:forClass:", v15, v13);

LABEL_9:
}

- (id)stateByTogglingValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  WFMultipleValueParameterStateEntry *v9;
  void *v10;
  WFMultipleValueParameterStateEntry *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[WFMultipleValueParameterState parameterStates](self, "parameterStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[WFVariableSubstitutableParameterState value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [WFMultipleValueParameterStateEntry alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v9, "initWithIdentity:parameterState:", v10, v4);
    objc_msgSend(v8, "arrayByAddingObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v7, "initWithValue:", v12);

  }
  else
  {
    -[WFVariableSubstitutableParameterState value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v8, "removeObjectAtIndex:", v6);
    if (objc_msgSend(v8, "count"))
      v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v8);
    else
      v13 = 0;
  }

  return v13;
}

- (id)stateByReplacingValueAtIndex:(unint64_t)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  WFMultipleValueParameterStateEntry *v9;
  void *v10;
  WFMultipleValueParameterStateEntry *v11;
  void *v12;

  v6 = a4;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = [WFMultipleValueParameterStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v9, "initWithIdentity:parameterState:", v10, v6);

  objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v11);
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v8);

  return v12;
}

- (id)stateByReplacingValueAtIndexes:(id)a3 withValues:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v6, "if_map:", &__block_literal_global_182);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "replaceObjectsAtIndexes:withObjects:", v7, v10);
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v9);

  return v11;
}

- (id)stateByAppendingValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  WFMultipleValueParameterStateEntry *v7;
  void *v8;
  WFMultipleValueParameterStateEntry *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[WFVariableSubstitutableParameterState value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [WFMultipleValueParameterStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v7, "initWithIdentity:parameterState:", v8, v4);

  objc_msgSend(v6, "arrayByAddingObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithValue:", v10);

  return v11;
}

- (id)stateByRemovingValueAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[WFVariableSubstitutableParameterState value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectAtIndex:", a3);
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v5);

  return v6;
}

- (id)stateByInsertingValueAtIndex:(unint64_t)a3 withValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  WFMultipleValueParameterStateEntry *v9;
  void *v10;
  WFMultipleValueParameterStateEntry *v11;
  void *v12;

  v6 = a4;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = [WFMultipleValueParameterStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v9, "initWithIdentity:parameterState:", v10, v6);

  if (objc_msgSend(v8, "count") <= a3)
    objc_msgSend(v8, "addObject:", v11);
  else
    objc_msgSend(v8, "insertObject:atIndex:", v11, a3);
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithValue:", v8);

  return v12;
}

WFMultipleValueParameterStateEntry *__75__WFMultipleValueParameterState_stateByReplacingValueAtIndexes_withValues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFMultipleValueParameterStateEntry *v3;
  void *v4;
  WFMultipleValueParameterStateEntry *v5;

  v2 = a2;
  v3 = [WFMultipleValueParameterStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v3, "initWithIdentity:parameterState:", v4, v2);

  return v5;
}

uint64_t __103__WFMultipleValueParameterState_finishProcessingWithContent_error_forParameterStateClass_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = a3;
  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRangedSizeArray");

    if ((v7 & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "maximumItemCount");
      v9 = v24;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      if (v11 && objc_msgSend(v11, "count") > v8)
      {
        v12 = (void *)MEMORY[0x1E0CB36B8];
        v13 = objc_msgSend(v11, "count");
        if (v13 >= v8)
          v14 = v8;
        else
          v14 = v13;
        objc_msgSend(v12, "indexSetWithIndexesInRange:", 0, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v11, "objectsAtIndexes:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v17, v5);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v9, "items"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "count"),
              v18,
              v19 <= v8))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D13EA8];
        objc_msgSend(v9, "items");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectsAtIndexes:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "collectionWithItems:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

LABEL_18:
      goto LABEL_19;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "variable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "possibleContentClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "firstObject"), "superclass"), "isEqual:", objc_opt_class());

    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
      v13[3] = &unk_1E7AF0C10;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v5, "getObjectRepresentations:forClass:", v13, objc_opt_class());
      v10 = v14;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4;
      v11[3] = &unk_1E7AF6C78;
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v5, "getFileRepresentations:forType:", v11, 0);
      v10 = v12;
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v9 = *(_QWORD *)(a1 + 32);
      if ((isKindOfClass & 1) == 0)
      {
        v11[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

        goto LABEL_8;
      }
      v7 = *(void (**)(void))(v9 + 16);
    }
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();
LABEL_8:

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7;
  v7[3] = &unk_1E7AEF370;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "finishProcessingWithContent:error:forParameterStateClass:valueHandler:", a2, a3, v6, v7);

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_161(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v7, "processForMultipleStateWithContext:error:resolution:", v8, &obj, *(_QWORD *)(v9 + 8) + 24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 2)
  {
    v12 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v7, v13);

  }
  else
  {
    *a4 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3_167(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__16206;
    v22 = __Block_byref_object_dispose__16207;
    v23 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4_168;
    v9[3] = &unk_1E7AEE1B0;
    v6 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v12 = &v18;
    v13 = &v14;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
    if (v15[3])
    {
      v7 = 0;
      v8 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v8 = 0;
      v7 = v19[5];
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v8, v7);

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5_171(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "variableString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "containedVariables");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_type);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayForKey:value:", v12, CFSTR("Ask"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v13, "count") && objc_msgSend(v9, "representsSingleContentVariable"))
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6_175;
        v27[3] = &unk_1E7AF9A98;
        v14 = a1[4];
        v27[4] = a1[5];
        v28 = v6;
        v29 = v7;
        objc_msgSend(v9, "processIntoContentItemsWithContext:completionHandler:", v14, v27);

        goto LABEL_11;
      }

LABEL_10:
      v15 = a1[4];
      v16 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10;
      v20[3] = &unk_1E7AEE200;
      v17 = (void *)a1[6];
      v23 = a1[7];
      v21 = v17;
      v22 = v7;
      v18[0] = v16;
      v18[1] = 3221225472;
      v18[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11;
      v18[3] = &unk_1E7AF6F70;
      v19 = v22;
      objc_msgSend(v6, "processWithContext:userInputRequiredHandler:valueHandler:", v15, v20, v18);

      v9 = v21;
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v6, "variable");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_10;
  v9 = (void *)v8;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8;
  v24[3] = &unk_1E7AF9A98;
  v10 = a1[4];
  v24[4] = a1[5];
  v25 = v6;
  v26 = v7;
  objc_msgSend(v9, "getContentWithContext:completionHandler:", v10, v24);

LABEL_11:
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_12(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6_175(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7_176;
  v9[3] = &unk_1E7AEF370;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "finishProcessingWithContent:error:forParameterStateClass:valueHandler:", v7, v6, v8, v9);

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9;
  v9[3] = &unk_1E7AEF370;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v5, "finishProcessingWithContent:error:forParameterStateClass:valueHandler:", v7, v6, v8, v9);

}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10(_QWORD *a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    (*(void (**)(void))(a1[4] + 16))();
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:", a2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v8 = v5;
  objc_opt_class();
  v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7_176(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  v8 = v5;
  objc_opt_class();
  v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4_168(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(a3, "processForMultipleStateWithContext:error:resolution:", v8, &obj, *(_QWORD *)(v9 + 8) + 24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, objc_msgSend(v7, "unsignedIntegerValue"));
  }
  else
  {
    *a4 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

id __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2_164(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

WFMultipleValueParameterStateEntry *__71__WFMultipleValueParameterState_stateByReplacingVariable_withVariable___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  WFMultipleValueParameterStateEntry *v10;
  void *v11;
  void *v12;
  void *v13;
  WFMultipleValueParameterStateEntry *v14;

  v5 = a2;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v5, "parameterState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "containedVariables");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {

LABEL_8:
      v14 = v6;
      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "parameterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if (v7)
  {

  }
  if ((v9 & 1) == 0)
    goto LABEL_8;
  v10 = [WFMultipleValueParameterStateEntry alloc];
  objc_msgSend(v6, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parameterState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stateByReplacingVariable:withVariable:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v10, "initWithIdentity:parameterState:", v11, v13);

LABEL_9:
  return v14;
}

uint64_t __48__WFMultipleValueParameterState_parameterStates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "parameterState");
}

WFMultipleValueParameterStateEntry *__57__WFMultipleValueParameterState_initWithParameterStates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFMultipleValueParameterStateEntry *v3;
  void *v4;
  WFMultipleValueParameterStateEntry *v5;

  v2 = a2;
  v3 = [WFMultipleValueParameterStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v3, "initWithIdentity:parameterState:", v4, v2);

  return v5;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v9, "singleStateClass");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
  }
  else
  {
    if (!v7)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
LABEL_6:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__WFMultipleValueParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke;
  v17[3] = &unk_1E7AEE008;
  v19 = v9;
  v20 = v10;
  v18 = v8;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "if_compactMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "count") != 1)
    goto LABEL_5;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_5:
      objc_msgSend(v3, "if_compactMap:", &__block_literal_global_16241);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

id __67__WFMultipleValueParameterState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "parameterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

WFMultipleValueParameterStateEntry *__94__WFMultipleValueParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  WFMultipleValueParameterStateEntry *v6;
  void *v7;
  WFMultipleValueParameterStateEntry *v8;

  v3 = (objc_class *)a1[6];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v4, a1[4], a1[5]);

  if (v5)
  {
    v6 = [WFMultipleValueParameterStateEntry alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFMultipleValueParameterStateEntry initWithIdentity:parameterState:](v6, "initWithIdentity:parameterState:", v7, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
