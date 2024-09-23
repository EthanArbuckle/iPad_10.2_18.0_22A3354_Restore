@implementation WFDateFieldParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, void *, _QWORD);
  char v26;
  _QWORD v27[4];
  void (**v28)(id, void *, _QWORD);
  char v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableStringParameterState variableString](self, "variableString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "variablesOfType:", CFSTR("Ask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(v8, "parameter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resultType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("String")) & 1) != 0 || v13)
  {
    v30.receiver = self;
    v30.super_class = (Class)WFDateFieldParameterState;
    -[WFVariableStringParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v30, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("WFDetectedDate"));
    -[WFDateFieldParameterState preprocessedDate](self, "preprocessedDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v16)
      {
        v18 = objc_alloc(MEMORY[0x1E0D13F30]);
        -[WFDateFieldParameterState preprocessedDate](self, "preprocessedDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithDate:timeIsSignificant:", v19, 1);
        v10[2](v10, v20, 0);

      }
      else
      {
        -[WFDateFieldParameterState preprocessedDate](self, "preprocessedDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v19, 0);
      }

    }
    else
    {
      -[WFVariableStringParameterState variableString](self, "variableString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "representsSingleContentVariable"))
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v27[3] = &unk_1E7AF1070;
        v22 = (id *)&v28;
        v28 = v10;
        v29 = v16;
        objc_msgSend(v21, "processIntoContentItemsWithContext:completionHandler:", v8, v27);
      }
      else
      {
        -[WFVariableStringParameterState variableString](self, "variableString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
        v24[3] = &unk_1E7AF1098;
        v26 = v16;
        v22 = (id *)&v25;
        v25 = v10;
        objc_msgSend(v23, "processWithContext:completionHandler:", v8, v24);

      }
    }
  }

}

- (NSDate)preprocessedDate
{
  return self->_preprocessedDate;
}

- (void)setPreprocessedDate:(id)a3
{
  objc_storeStrong((id *)&self->_preprocessedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessedDate, 0);
}

void __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v4[3] = &unk_1E7AF1048;
    v5 = *(id *)(a1 + 32);
    v6 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = (void *)MEMORY[0x1E0D13F28];
  if (*(_BYTE *)(a1 + 40))
  {
    v17 = a5;
    v9 = a5;
    v10 = &v17;
    objc_msgSend(v8, "detectedDatesInString:error:", a2, &v17);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = a5;
    v12 = a5;
    v10 = &v16;
    objc_msgSend(v8, "datesInString:error:", a2, &v16);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;
  v14 = *v10;

  objc_msgSend(v13, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v15);
}

void __86__WFDateFieldParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (v12)
  {
    v9 = *(unsigned __int8 *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13F30]), "initWithDate:timeIsSignificant:", v12, 1);
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
  else
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }

}

+ (id)processingValueClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
