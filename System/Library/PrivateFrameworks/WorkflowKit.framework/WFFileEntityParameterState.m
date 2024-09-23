@implementation WFFileEntityParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      v14 = (void *)objc_msgSend((id)objc_opt_class(), "processingValueClass");
      if (objc_msgSend(v14, "isEqual:", objc_opt_class())
        && (-[WFVariableSubstitutableParameterState variable](self, "variable"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v15, "possibleContentClasses"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "firstObject"), "superclass"), "isEqual:", objc_opt_class()), v16, v15, (v17 & 1) == 0))
      {
        -[WFVariableSubstitutableParameterState variable](self, "variable");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
        v23[3] = &unk_1E7AF1E08;
        v24 = v10;
        objc_msgSend(v20, "getFileRepresentationWithContext:completionHandler:", v8, v23);

        v12 = v24;
      }
      else
      {
        -[WFVariableSubstitutableParameterState variable](self, "variable");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_class();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
        v21[3] = &unk_1E7AF1DE0;
        v22 = v10;
        objc_msgSend(v18, "getObjectRepresentationForClass:context:completionHandler:", v19, v8, v21);

        v12 = v22;
      }
    }

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WFFileEntityParameterState;
    -[WFFileParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v25, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }

}

uint64_t __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__WFFileEntityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
