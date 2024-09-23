@implementation WFOutputAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFOutputAction *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v4 = a3;
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNoOutputSurfaceBehavior"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFOutputAction outputSurfaceIsAvailable](self, "outputSurfaceIsAvailable")
    || !objc_msgSend(v4, "numberOfItems"))
  {
    v8 = self;
    v9 = v4;
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Respond")))
    {
      -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFResponse"), objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[WFOutputAction finishRunningWithOutput:error:](self, "finishRunningWithOutput:error:", 0, 0);
        goto LABEL_13;
      }
      -[WFAction userInterface](self, "userInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke;
      v15[3] = &unk_1E7AF7B78;
      v15[4] = self;
      WFShowResult(v6, v7, 1, v15);
LABEL_10:

LABEL_13:
      goto LABEL_14;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Copy to Clipboard")))
    {
      +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createActionWithIdentifier:serializedParameters:", CFSTR("is.workflow.actions.setclipboard"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFAction userInterface](self, "userInterface");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction runningDelegate](self, "runningDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction variableSource](self, "variableSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction workQueue](self, "workQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke_2;
      v14[3] = &unk_1E7AF7CF0;
      v14[4] = self;
      objc_msgSend(v6, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", v4, v7, v11, v12, v13, v14);

      goto LABEL_10;
    }
    v8 = self;
    v9 = 0;
  }
  -[WFOutputAction finishRunningWithOutput:error:](v8, "finishRunningWithOutput:error:", v9, 0);
LABEL_14:

}

- (void)finishRunningWithOutput:(id)a3 error:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", a4);
  }
  else
  {
    -[WFAction setOutput:](self, "setOutput:", a3);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("User requested shortcut exit."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v8);
  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFOutputAction;
  v7 = -[WFAction setParameterState:forKey:](&v16, sel_setParameterState_forKey_, a3, v6);
  if (v7)
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFResponse"));
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
    v10 = v9;

    v11 = objc_msgSend(v6, "isEqualToString:", CFSTR("WFNoOutputSurfaceBehavior"));
    objc_msgSend(v10, "variableString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "isEmpty");
    if (v11 && v13)
    {
      -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFOutput"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOutputAction setParameterState:forKey:](self, "setParameterState:forKey:", v14, CFSTR("WFResponse"));

    }
  }

  return v7;
}

- (BOOL)outputSurfaceIsAvailable
{
  void *v3;
  char v4;

  -[WFOutputAction runSource](self, "runSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC84A0]);

  return (v4 & 1) != 0 || -[WFOutputAction outputBehavior](self, "outputBehavior") != 1;
}

- (unint64_t)outputBehavior
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WFOutputAction runningContext](self, "runningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "outputBehavior");
  else
    v4 = 0;

  return v4;
}

- (id)runSource
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[WFOutputAction runningContext](self, "runningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)*MEMORY[0x1E0DC84D8];
  v5 = v3;

  return v5;
}

- (id)runningContext
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFAction runningDelegate](self, "runningDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentRunningContextForAction:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)hasOutputFallback
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFNoOutputSurfaceBehavior"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("Do Nothing")) ^ 1;
  return (char)v4;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "containsObject:", self) & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "addObject:", self);
    v10.receiver = self;
    v10.super_class = (Class)WFOutputAction;
    -[WFAction inheritedOutputContentClassesInWorkflow:context:](&v10, sel_inheritedOutputContentClassesInWorkflow_context_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)outputVariableString
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFOutput"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "variableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((WFGetVariableInputContentForPreviewing(v8, v9, v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFOutputAction;
    v11 = -[WFAction getInputContentFromVariablesInParameterState:context:completionHandler:](&v13, sel_getInputContentFromVariablesInParameterState_context_completionHandler_, v8, v9, v10);
  }

  return v11;
}

- (id)outputContentClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[WFOutputAction outputVariableString](self, "outputVariableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "variables");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(v3, "stringsAndVariables");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v5 == v7)
    {
      v8 = (void *)objc_opt_new();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v3, "variables", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "possibleAggrandizedContentClasses");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "unionOrderedSet:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v11);
      }

      objc_msgSend(v8, "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

uint64_t __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithOutput:error:", 0, a2);
}

uint64_t __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithOutput:error:", 0, a3);
}

@end
