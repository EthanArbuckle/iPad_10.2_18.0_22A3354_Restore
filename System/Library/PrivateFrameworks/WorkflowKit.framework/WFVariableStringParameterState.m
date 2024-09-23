@implementation WFVariableStringParameterState

- (WFVariableStringParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4
{
  id v7;
  WFVariableStringParameterState *v8;
  uint64_t v9;
  WFVariableString *variableString;
  void *v11;
  uint64_t v12;
  WFVariable *variable;
  WFVariableStringParameterState *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableStringParameterState.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variableString"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFVariableStringParameterState;
  v8 = -[WFVariableStringParameterState init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    variableString = v8->_variableString;
    v8->_variableString = (WFVariableString *)v9;

    v8->_userInputInsertionIndex = a4;
    objc_msgSend(v7, "variables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
    variable = v8->_variable;
    v8->_variable = (WFVariable *)v12;

    v14 = v8;
  }

  return v8;
}

- (WFVariableStringParameterState)initWithVariableString:(id)a3
{
  return -[WFVariableStringParameterState initWithVariableString:userInputInsertionIndex:](self, "initWithVariableString:userInputInsertionIndex:", a3, -1);
}

- (WFVariableStringParameterState)initWithVariable:(id)a3
{
  id v4;
  WFVariableString *v5;
  WFVariableStringParameterState *v6;

  v4 = a3;
  v5 = -[WFVariableString initWithVariable:]([WFVariableString alloc], "initWithVariable:", v4);

  v6 = -[WFVariableStringParameterState initWithVariableString:](self, "initWithVariableString:", v5);
  return v6;
}

- (WFVariableStringParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFVariableString *v11;
  WFVariableStringParameterState *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_9;
    }
    WFDeserializedVariableObject(v8, v9, v10);
    v11 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_4;
    }
  }
  self = -[WFVariableStringParameterState initWithVariableString:](self, "initWithVariableString:", v11);
  v12 = self;
LABEL_4:

LABEL_9:
  return v12;
}

- (WFPropertyListObject)serializedRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFVariableStringParameterState variableString](self, "variableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[WFVariableStringParameterState variableString](self, "variableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    WFSerializedVariableObject(v6);
  else
    objc_msgSend(v6, "stringByRemovingVariables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFPropertyListObject *)v8;
}

- (id)stateByReplacingVariable:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  WFVariableString *v12;
  WFVariableString *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[WFVariableStringParameterState variableString](self, "variableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringsAndVariables");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v6 && (v11 = objc_msgSend(v10, "indexOfObject:", v6), v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (v7)
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v11, v7);
    else
      objc_msgSend(v10, "removeObjectAtIndex:", v11);
    v12 = -[WFVariableString initWithStringsAndVariables:]([WFVariableString alloc], "initWithStringsAndVariables:", v10);
  }
  else if (v7)
  {
    v12 = -[WFVariableString initWithVariable:]([WFVariableString alloc], "initWithVariable:", v7);
  }
  else
  {
    v12 = objc_alloc_init(WFVariableString);
  }
  v13 = v12;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVariableString:", v12);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  WFVariableStringParameterState *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFVariableStringParameterState *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFVariableStringParameterState variableString](v4, "variableString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVariableStringParameterState variableString](self, "variableString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFVariableStringParameterState variableString](self, "variableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)containedVariables
{
  void *v2;
  void *v3;

  -[WFVariableStringParameterState variableString](self, "variableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  WFVariableStringParameterState *v21;
  void (**v22)(id, void *, void *);
  id v23;

  v8 = a3;
  v9 = (void (**)(id, void *, void *))a4;
  v10 = a5;
  -[WFVariableStringParameterState variableString](self, "variableString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableStringParameterState variableString](self, "variableString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "variablesOfType:", CFSTR("Ask"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v8, "isInputParameter"))
    {
      -[WFVariableStringParameterState parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex](self, "parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "prompt");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v16, v15);

    }
    else
    {
      -[WFVariableStringParameterState variableString](self, "variableString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __91__WFVariableStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v19[3] = &unk_1E7AEEC78;
      v20 = v14;
      v21 = self;
      v22 = v9;
      v23 = v10;
      v18 = v14;
      objc_msgSend(v17, "processWithContext:completionHandler:", v8, v19);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex
{
  void *v2;
  void *v3;
  void *v4;
  WFVariableString *v5;
  id v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  -[WFVariableStringParameterState variableString](self, "variableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringsAndVariables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__WFVariableStringParameterState_parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex__block_invoke;
  v9[3] = &unk_1E7AEE9C0;
  v9[4] = &v11;
  v9[5] = v10;
  objc_msgSend(v3, "if_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFVariableString initWithStringsAndVariables:]([WFVariableString alloc], "initWithStringsAndVariables:", v4);
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)objc_msgSend(v6, "initWithVariableString:userInputInsertionIndex:", v5, v12[3]);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (BOOL)shouldSerializeAsPlainString
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFVariableStringParameterState variableString](self, "variableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (WFVariableString)variableString
{
  return self->_variableString;
}

- (int64_t)userInputInsertionIndex
{
  return self->_userInputInsertionIndex;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_variableString, 0);
}

__CFString *__97__WFVariableStringParameterState_parameterStateByRemovingAskVariablesAndPopulatingInsertionIndex__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  __CFString *v8;

  v3 = a2;
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
  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Ask"));

  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    v8 = &stru_1E7AFA810;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v3, "wf_lengthInVariableString");
    v8 = (__CFString *)v3;
  }

  return v8;
}

void __91__WFVariableStringParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9;
  id v10;
  id v11;
  WFVariableString *v12;
  void *v13;
  uint64_t v14;
  void (*v15)(uint64_t, WFVariableString *, uint64_t);
  id v16;

  v16 = a4;
  if (a1[4])
  {
    v9 = a1[6];
    v10 = a2;
    v11 = objc_alloc((Class)objc_opt_class());
    v12 = -[WFVariableString initWithString:]([WFVariableString alloc], "initWithString:", v10);

    v13 = (void *)objc_msgSend(v11, "initWithVariableString:userInputInsertionIndex:", v12, a3);
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v16, v13);

  }
  else
  {
    v14 = a1[7];
    v15 = *(void (**)(uint64_t, WFVariableString *, uint64_t))(v14 + 16);
    v12 = a2;
    v15(v14, v12, a5);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
