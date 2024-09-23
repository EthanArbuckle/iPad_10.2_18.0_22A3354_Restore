@implementation WFFileParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, void *, _QWORD);
  id v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)WFFileParameterState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v19, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }
  else
  {
    v18 = 0;
    -[WFFileParameterState resolveFileURLWithContext:error:](self, "resolveFileURLWithContext:error:", v8, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    v14 = v13;
    if (v12)
    {
      v10[2](v10, v12, 0);
    }
    else if (WFShouldRequestAccessToFile(v13))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__WFFileParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v15[3] = &unk_1E7AF71F0;
      v17 = v10;
      v16 = v8;
      -[WFFileParameterState requestAccessToFileWithContext:completionHandler:](self, "requestAccessToFileWithContext:completionHandler:", v16, v15);

    }
    else
    {
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v14);
    }

  }
}

- (id)processForMultipleStateWithContext:(id)a3 error:(id *)a4 resolution:(int64_t *)a5
{
  uint64_t v7;
  void *v8;
  int64_t v9;
  int v10;

  -[WFFileParameterState resolveFileURLWithContext:error:](self, "resolveFileURLWithContext:error:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a5)
  {
    if (v7)
    {
      v9 = 1;
    }
    else
    {
      v10 = WFShouldRequestAccessToFile(*a4);
      v9 = 2;
      if (!v10)
        v9 = 0;
    }
    *a5 = v9;
  }
  return v8;
}

- (id)resolveFileURLWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  uint64_t v22;

  v6 = a3;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isSupportedOnCurrentDevice"))
  {
    objc_msgSend(v6, "parameter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    objc_msgSend(v11, "workflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "workflowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "resolveURLWithWorkflowID:error:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D13F78], "fileWithURL:options:", v14, 8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "wf_fileIsDirectory");

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v6, "variableSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "captureFileRepresentation:", v10);
    }
    else
    {
      objc_msgSend(v7, "fileLocation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v10 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v7, "fileLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v20, "resolveLocationWithError:", &v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D13F78], "fileWithURL:options:", v17, 8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (void)requestAccessToFileWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFVariableSubstitutableParameterState value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "variableSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__WFFileParameterState_requestAccessToFileWithContext_completionHandler___block_invoke;
    v13[3] = &unk_1E7AED5D0;
    v16 = v7;
    v14 = v6;
    v15 = v8;
    objc_msgSend(v10, "requestAccessToFileAtLocations:completionHandler:", v12, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __73__WFFileParameterState_requestAccessToFileWithContext_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;

    objc_msgSend(v8, "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "workflowID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 40);
    v14 = v5;
    objc_msgSend(v11, "resolveURLWithWorkflowID:error:", v10, &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = v13;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __81__WFFileParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D13F78], "fileWithURL:options:", a2, 8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wf_fileIsDirectory");

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "variableSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captureFileRepresentation:", v6);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
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
  WFFileValue *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFFileValue initWithSerializedRepresentation:variableProvider:parameter:]([WFFileValue alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v9, v8, v7);

  return v10;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileParameterState.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFFileValue class]]"));

  }
  objc_msgSend(v5, "serializedRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
