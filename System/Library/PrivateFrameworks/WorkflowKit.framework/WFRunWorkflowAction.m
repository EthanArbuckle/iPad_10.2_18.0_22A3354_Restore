@implementation WFRunWorkflowAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_1E7AF6458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WFRunWorkflowAction performWithSandboxExtensions:](self, "performWithSandboxExtensions:", v6);

}

- (void)performWithSandboxExtensions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7C88], "all");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WFRunWorkflowAction_performWithSandboxExtensions___block_invoke;
  v7[3] = &unk_1E7AF6480;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "performWithSandboxExtensions:asynchronousBlock:", v5, v7);

}

- (void)stop
{
  id v2;

  -[WFRunWorkflowAction workflowController](self, "workflowController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)cancel
{
  objc_super v3;

  -[WFRunWorkflowAction stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)WFRunWorkflowAction;
  -[WFAction cancel](&v3, sel_cancel);
}

- (id)workflowNameFromParameter
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkflow"), objc_opt_class());
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

  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkflow"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    return 0;
  }
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction runningDelegate](self, "runningDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFAction runningDelegate](self, "runningDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentRunningContextForAction:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workflowIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isEqualToString:", v10))
    {
      getWFSecurityLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v18 = 136315138;
        v19 = "-[WFRunWorkflowAction contentDestinationWithError:]";
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEBUG, "%s Returning nil to avoid prompting for recursion.", (uint8_t *)&v18, 0xCu);
      }

      v12 = 0;
      goto LABEL_11;
    }

  }
  v14 = objc_alloc(MEMORY[0x1E0CBD728]);
  v15 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolvedAppMatchingDescriptor:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13E00], "locationWithAppDescriptor:promptingBehaviour:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v12;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;

  if ((void *)WFRunWorkflowActionProgressContext == a6)
  {
    -[WFRunWorkflowAction workflowController](self, "workflowController", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "progress");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "fractionCompleted");
    v9 = (uint64_t)(v8 * 100.0);
    -[WFAction progress](self, "progress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompletedUnitCount:", v9);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFRunWorkflowAction;
    -[WFRunWorkflowAction observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)getWorkflowWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkflow"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workflowRecordForDescriptor:error:", v4, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v27 = "WFEnforceClass";
        v28 = 2114;
        v29 = v8;
        v30 = 2114;
        v31 = (id)objc_opt_class();
        v32 = 2114;
        v33 = v7;
        v13 = v31;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v9 = 0;
    }
    else
    {
      v9 = v8;
    }

    if (v9)
    {
      a3 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v9, v4, 0, 1, 0, a3);
LABEL_15:

      goto LABEL_16;
    }
    if (!a3)
    {
      v9 = 0;
      goto LABEL_15;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v22[0] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Shortcut Not Found"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v22[1] = *MEMORY[0x1E0CB2D50];
    v16 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("An occurred while preparing “%@” to run."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, v20);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
LABEL_14:
    a3 = 0;
    goto LABEL_15;
  }
  if (a3)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v24[0] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Shortcut Not Found"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v5;
    v24[1] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Make sure a valid shortcut is selected in the Run Shortcut action."));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 5, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
LABEL_16:

  return a3;
}

- (void)setHandoffWorkflowControllerState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB36F8], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAction processedParameters](self, "processedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("WFHandoffWorkflowControllerState"));
  -[WFAction setProcessedParameters:](self, "setProcessedParameters:", v8);

}

- (void)getHandoffWorkflowControllerState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(id, _QWORD);

  v9 = (void (**)(id, _QWORD))a3;
  -[WFAction processedParameters](self, "processedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("WFHandoffWorkflowControllerState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v7, v9);

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  Class v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);

  v8 = a4;
  v9 = (void (**)(_QWORD))a6;
  -[WFAction userInterface](self, "userInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dialogTransformer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCurrentAction:", v8);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resignIssuedExtensionsWithReason:", CFSTR("Run Workflow running Run Workflow"));

    v9[2](v9);
  }
  else
  {
    v15 = NSClassFromString(CFSTR("WFHealthKitResource"));
    if (!v15
      || (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v15, 0),
          (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "resourceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resourceObjectsOfClasses:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "if_compactMap:", &__block_literal_global_52669);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__WFRunWorkflowAction_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2;
    v21[3] = &unk_1E7AF64E8;
    v22 = v9;
    objc_msgSend(v20, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v19, v21);

  }
}

- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  char isKindOfClass;
  void *v9;
  char v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v10 = objc_msgSend(v9, "retakeResignedExtensionsWithReason:error:", CFSTR("Run Workflow finished Run Workflow"), &v12);
    v11 = v12;

    if ((v10 & 1) == 0)
      objc_msgSend(v6, "stopWithError:", v11);

  }
}

- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[WFAction userInterface](self, "userInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[WFAction userInterface](self, "userInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dialogTransformer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCurrentAction:", self);

    -[WFAction userInterface](self, "userInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dialogTransformer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction workflow](self, "workflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWorkflow:", v16);

  }
  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)WFRunWorkflowAction;
    -[WFAction cancel](&v18, sel_cancel);
  }
  else
  {
    objc_msgSend(v8, "output");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAction setOutput:](self, "setOutput:", v17);

    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v9);
  }

}

- (BOOL)workflowController:(id)a3 handleUnsupportedUserInterfaceForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  -[WFRunWorkflowAction setHandoffWorkflowControllerState:](self, "setHandoffWorkflowControllerState:", a5, a4);
  return 0;
}

- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[WFAction userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction runningDelegate](self, "runningDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "runSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = WFRemoteExecuteActionIfApplicable(v12, v10, v14, v15, v16, v11);
  if ((v17 & 1) == 0)
    -[WFRunWorkflowAction setHandoffWorkflowControllerState:](self, "setHandoffWorkflowControllerState:", v10);

  return v17;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to run another shortcut?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  void *v7;
  BOOL v8;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("WFWorkflow"))
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("WFWorkflow"));
  }
  else
  {
    v6 = 0;
  }

  -[WFAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, _QWORD);

  v11 = (void (**)(id, void *, _QWORD))a4;
  -[WFAction systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:](self, "systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collectionWithIdentifier:error:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedVisibleWorkflowsInCollection:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_map:", &__block_literal_global_172);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10, 0);

  }
  else
  {
    v11[2](v11, 0, 0);
  }

}

- (WFWorkflowController)workflowController
{
  return (WFWorkflowController *)objc_loadWeakRetained((id *)&self->_workflowController);
}

- (void)setWorkflowController:(id)a3
{
  objc_storeWeak((id *)&self->_workflowController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workflowController);
}

id __85__WFRunWorkflowAction_fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFWorkflowParameterStateDescriptor *v3;
  WFWorkflowParameterState *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = a2;
  v3 = -[WFWorkflowParameterStateDescriptor initWithWorkflowReference:isSelf:]([WFWorkflowParameterStateDescriptor alloc], "initWithWorkflowReference:isSelf:", v2, 0);
  v4 = -[WFVariableSubstitutableParameterState initWithValue:]([WFWorkflowParameterState alloc], "initWithValue:", v3);
  objc_msgSend(v2, "associatedAppBundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v2, "associatedAppBundleIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0DC7978]);
    objc_msgSend(v2, "associatedAppBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithBundleIdentifier:", v10);
  }
  else
  {
    objc_msgSend(v2, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icon");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;

  v13 = objc_alloc(MEMORY[0x1E0DC7A00]);
  objc_msgSend(v2, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableSubstitutableParameterState serializedRepresentation](v4, "serializedRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithIdentifier:name:entryIcon:accessoryIcon:serializedParameterState:", v14, v15, v12, 0, v16);

  return v17;
}

uint64_t __89__WFRunWorkflowAction_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __89__WFRunWorkflowAction_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke()
{
  objc_class *v0;
  void *v1;
  id v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC7C60], "hasExtensionForResourceClassName:", v1))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

uint64_t __52__WFRunWorkflowAction_performWithSandboxExtensions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  WFWorkflowController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  WFWorkflowController *v21;
  _QWORD v22[4];
  WFWorkflowController *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v6, "finishRunningWithError:", a3);
  }
  else
  {
    v27 = 0;
    objc_msgSend(v6, "getWorkflowWithError:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    v9 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v9, "userInterface");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "userInterface");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dialogTransformer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWorkflow:", v7);

      }
      v14 = objc_alloc_init(WFWorkflowController);
      -[WFWorkflowController setWorkflow:](v14, "setWorkflow:", v7);
      -[WFWorkflowController setDelegate:](v14, "setDelegate:", *(_QWORD *)(a1 + 32));
      -[WFWorkflowController setInput:](v14, "setInput:", *(_QWORD *)(a1 + 40));
      -[WFWorkflowController setDonateInteraction:](v14, "setDonateInteraction:", 0);
      objc_msgSend(*(id *)(a1 + 32), "variableSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "listenerEndpoints");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController setListenerEndpoints:](v14, "setListenerEndpoints:", v16);

      -[WFWorkflowController setOutputBehavior:](v14, "setOutputBehavior:", 2);
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 336), v14);
      objc_msgSend(*(id *)(a1 + 32), "progress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTotalUnitCount:", objc_msgSend(v17, "totalUnitCount") + 100);

      -[WFWorkflowController addObserver:forKeyPath:options:context:](v14, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("progress.fractionCompleted"), 0, WFRunWorkflowActionProgressContext);
      v18 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke_2;
      v22[3] = &unk_1E7AF6430;
      v23 = v14;
      v19 = v7;
      v20 = *(_QWORD *)(a1 + 32);
      v24 = v19;
      v25 = v20;
      v26 = v5;
      v21 = v14;
      objc_msgSend(v18, "getHandoffWorkflowControllerState:", v22);

    }
    else
    {
      objc_msgSend(v9, "finishRunningWithError:", v8);
    }

  }
}

void __50__WFRunWorkflowAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setRunSource:", *MEMORY[0x1E0DC8490]);
  v3 = objc_alloc(MEMORY[0x1E0DC7E80]);
  objc_msgSend(*(id *)(a1 + 40), "workflowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithWorkflowIdentifier:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setRunningContext:", v5);

  v6 = *MEMORY[0x1E0DC8438];
  objc_msgSend(*(id *)(a1 + 32), "runningContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRunKind:", v6);

  objc_msgSend(*(id *)(a1 + 48), "runningDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "runningDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentRunningContextForAction:", *(_QWORD *)(a1 + 48));
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v11 = v16;
  }
  else
  {
    v11 = 0;
  }
  v17 = v11;
  objc_msgSend(v11, "rootWorkflowIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "workflow");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "workflowID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "runningContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRootWorkflowIdentifier:", v13);

  if (!v12)
  {

  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(void))(v15 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "run");

}

@end
