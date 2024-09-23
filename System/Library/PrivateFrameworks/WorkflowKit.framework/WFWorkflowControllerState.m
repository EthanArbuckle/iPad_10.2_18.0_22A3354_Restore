@implementation WFWorkflowControllerState

- (WFWorkflowControllerState)initWithWorkflow:(id)a3 variables:(id)a4 currentActionIndex:(unint64_t)a5 runningContext:(id)a6 currentInput:(id)a7 currentProcessedParameters:(id)a8 startDate:(id)a9 currentRunSource:(id)a10 numberOfDialogsPresented:(int64_t)a11 outputBehavior:(unint64_t)a12 contentAttributionTracker:(id)a13 contentItemCache:(id)a14 flowTracker:(id)a15 allowedOnceSmartPromptStates:(id)a16 extensionResourceClasses:(id)a17 shouldDisablePrivacyPrompts:(BOOL)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  WFWorkflowControllerState *v26;
  WFWorkflowControllerState *v27;
  uint64_t v28;
  NSDictionary *variables;
  uint64_t v30;
  NSDictionary *currentProcessedParameters;
  uint64_t v32;
  NSSet *allowedOnceSmartPromptStates;
  uint64_t v34;
  NSSet *extensionResourceClasses;
  WFWorkflowControllerState *v36;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v46 = a3;
  v48 = a4;
  v45 = a6;
  v44 = a7;
  v47 = a8;
  v43 = a9;
  v42 = a10;
  v41 = a13;
  v22 = a14;
  v23 = a15;
  v24 = a16;
  v25 = a17;
  v49.receiver = self;
  v49.super_class = (Class)WFWorkflowControllerState;
  v26 = -[WFWorkflowControllerState init](&v49, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_workflow, a3);
    v28 = objc_msgSend(v48, "copy");
    variables = v27->_variables;
    v27->_variables = (NSDictionary *)v28;

    v27->_currentActionIndex = a5;
    objc_storeStrong((id *)&v27->_runningContext, a6);
    objc_storeStrong((id *)&v27->_currentInput, a7);
    v30 = objc_msgSend(v47, "copy");
    currentProcessedParameters = v27->_currentProcessedParameters;
    v27->_currentProcessedParameters = (NSDictionary *)v30;

    objc_storeStrong((id *)&v27->_startDate, a9);
    objc_storeStrong((id *)&v27->_currentRunSource, a10);
    v27->_numberOfDialogsPresented = a11;
    v27->_outputBehavior = a12;
    objc_storeStrong((id *)&v27->_currentActionContentAttributionTracker, a13);
    objc_storeStrong((id *)&v27->_contentItemCache, a14);
    objc_storeStrong((id *)&v27->_flowTracker, a15);
    v32 = objc_msgSend(v24, "copy");
    allowedOnceSmartPromptStates = v27->_allowedOnceSmartPromptStates;
    v27->_allowedOnceSmartPromptStates = (NSSet *)v32;

    v34 = objc_msgSend(v25, "copy");
    extensionResourceClasses = v27->_extensionResourceClasses;
    v27->_extensionResourceClasses = (NSSet *)v34;

    v27->_shouldDisablePrivacyPrompts = a18;
    v36 = v27;
  }

  return v27;
}

- (WFWorkflowControllerState)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowControllerState *v5;
  uint64_t v6;
  WFWorkflowReference *workflow;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *variables;
  void *v15;
  uint64_t v16;
  WFWorkflowRunningContext *runningContext;
  uint64_t v18;
  WFContentCollection *currentInput;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *currentProcessedParameters;
  uint64_t v24;
  NSDate *startDate;
  uint64_t v26;
  NSString *currentRunSource;
  uint64_t v28;
  WFContentAttributionTracker *currentActionContentAttributionTracker;
  uint64_t v30;
  WFContentItemCache *contentItemCache;
  uint64_t v32;
  WFControlFlowAttributionTracker *flowTracker;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSSet *allowedOnceSmartPromptStates;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSSet *extensionResourceClasses;
  uint64_t v44;
  WFWorkflowControllerState *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)WFWorkflowControllerState;
  v5 = -[WFWorkflowControllerState init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflow"));
    v6 = objc_claimAutoreleasedReturnValue();
    workflow = v5->_workflow;
    v5->_workflow = (WFWorkflowReference *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("variables"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    variables = v5->_variables;
    v5->_variables = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentActionIndex"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentActionIndex = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("runningContext"));
    v16 = objc_claimAutoreleasedReturnValue();
    runningContext = v5->_runningContext;
    v5->_runningContext = (WFWorkflowRunningContext *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentInput"));
    v18 = objc_claimAutoreleasedReturnValue();
    currentInput = v5->_currentInput;
    v5->_currentInput = (WFContentCollection *)v18;

    +[WFParameterValueRegistry registeredValueClasses](WFParameterValueRegistry, "registeredValueClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("currentProcessedParameters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    currentProcessedParameters = v5->_currentProcessedParameters;
    v5->_currentProcessedParameters = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentRunSource"));
    v26 = objc_claimAutoreleasedReturnValue();
    currentRunSource = v5->_currentRunSource;
    v5->_currentRunSource = (NSString *)v26;

    v5->_numberOfDialogsPresented = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfDialogsPresented"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentActionContentAttributionTracker"));
    v28 = objc_claimAutoreleasedReturnValue();
    currentActionContentAttributionTracker = v5->_currentActionContentAttributionTracker;
    v5->_currentActionContentAttributionTracker = (WFContentAttributionTracker *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentItemCache"));
    v30 = objc_claimAutoreleasedReturnValue();
    contentItemCache = v5->_contentItemCache;
    v5->_contentItemCache = (WFContentItemCache *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowTracker"));
    v32 = objc_claimAutoreleasedReturnValue();
    flowTracker = v5->_flowTracker;
    v5->_flowTracker = (WFControlFlowAttributionTracker *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("allowedOnceSmartPromptStates"));
    v37 = objc_claimAutoreleasedReturnValue();
    allowedOnceSmartPromptStates = v5->_allowedOnceSmartPromptStates;
    v5->_allowedOnceSmartPromptStates = (NSSet *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("extensionResourceClasses"));
    v42 = objc_claimAutoreleasedReturnValue();
    extensionResourceClasses = v5->_extensionResourceClasses;
    v5->_extensionResourceClasses = (NSSet *)v42;

    v5->_shouldDisablePrivacyPrompts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldDisablePrivacyPrompts"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("outputBehavior")))
    {
      v44 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputBehavior"));
    }
    else if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoresOutput")))
    {
      v44 = 1;
    }
    else
    {
      v44 = 2;
    }
    v5->_outputBehavior = v44;
    v45 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  id v22;

  v22 = a3;
  -[WFWorkflowControllerState workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v4, CFSTR("workflow"));

  -[WFWorkflowControllerState variables](self, "variables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v5, CFSTR("variables"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFWorkflowControllerState currentActionIndex](self, "currentActionIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v6, CFSTR("currentActionIndex"));

  -[WFWorkflowControllerState runningContext](self, "runningContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v7, CFSTR("runningContext"));

  -[WFWorkflowControllerState currentInput](self, "currentInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfItems");

  if (v9)
  {
    -[WFWorkflowControllerState currentInput](self, "currentInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v10, CFSTR("currentInput"));

  }
  -[WFWorkflowControllerState currentProcessedParameters](self, "currentProcessedParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[WFWorkflowControllerState currentProcessedParameters](self, "currentProcessedParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "encodeObject:forKey:", v13, CFSTR("currentProcessedParameters"));

  }
  -[WFWorkflowControllerState startDate](self, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v14, CFSTR("startDate"));

  -[WFWorkflowControllerState currentRunSource](self, "currentRunSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v15, CFSTR("currentRunSource"));

  objc_msgSend(v22, "encodeInteger:forKey:", -[WFWorkflowControllerState numberOfDialogsPresented](self, "numberOfDialogsPresented"), CFSTR("numberOfDialogsPresented"));
  -[WFWorkflowControllerState currentActionContentAttributionTracker](self, "currentActionContentAttributionTracker");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v16, CFSTR("currentActionContentAttributionTracker"));

  -[WFWorkflowControllerState contentItemCache](self, "contentItemCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v17, CFSTR("contentItemCache"));

  -[WFWorkflowControllerState flowTracker](self, "flowTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v18, CFSTR("flowTracker"));

  -[WFWorkflowControllerState allowedOnceSmartPromptStates](self, "allowedOnceSmartPromptStates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v19, CFSTR("allowedOnceSmartPromptStates"));

  -[WFWorkflowControllerState extensionResourceClasses](self, "extensionResourceClasses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "encodeObject:forKey:", v20, CFSTR("extensionResourceClasses"));

  objc_msgSend(v22, "encodeBool:forKey:", -[WFWorkflowControllerState shouldDisablePrivacyPrompts](self, "shouldDisablePrivacyPrompts"), CFSTR("shouldDisablePrivacyPrompts"));
  v21 = -[WFWorkflowControllerState outputBehavior](self, "outputBehavior") == 1;
  objc_msgSend(v22, "encodeInteger:forKey:", -[WFWorkflowControllerState outputBehavior](self, "outputBehavior"), CFSTR("outputBehavior"));
  objc_msgSend(v22, "encodeBool:forKey:", v21, CFSTR("ignoresOutput"));

}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB36F8];
  v7 = a3;
  objc_msgSend(v6, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", self, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "writeToURL:options:error:", v7, 0, &v13);

  v10 = v13;
  v11 = v10;
  if (a4 && (v9 & 1) == 0)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

- (WFWorkflowReference)workflow
{
  return self->_workflow;
}

- (WFContentCollection)currentInput
{
  return self->_currentInput;
}

- (NSDictionary)currentProcessedParameters
{
  return self->_currentProcessedParameters;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (unint64_t)currentActionIndex
{
  return self->_currentActionIndex;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (NSString)currentRunSource
{
  return self->_currentRunSource;
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (WFContentAttributionTracker)currentActionContentAttributionTracker
{
  return self->_currentActionContentAttributionTracker;
}

- (WFContentItemCache)contentItemCache
{
  return self->_contentItemCache;
}

- (WFControlFlowAttributionTracker)flowTracker
{
  return self->_flowTracker;
}

- (NSSet)allowedOnceSmartPromptStates
{
  return self->_allowedOnceSmartPromptStates;
}

- (NSSet)extensionResourceClasses
{
  return self->_extensionResourceClasses;
}

- (BOOL)shouldDisablePrivacyPrompts
{
  return self->_shouldDisablePrivacyPrompts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionResourceClasses, 0);
  objc_storeStrong((id *)&self->_allowedOnceSmartPromptStates, 0);
  objc_storeStrong((id *)&self->_flowTracker, 0);
  objc_storeStrong((id *)&self->_contentItemCache, 0);
  objc_storeStrong((id *)&self->_currentActionContentAttributionTracker, 0);
  objc_storeStrong((id *)&self->_currentRunSource, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_currentProcessedParameters, 0);
  objc_storeStrong((id *)&self->_currentInput, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)getStateFromURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v15 = 0;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfURL:options:error:", v7, 0, &v15);

  v9 = v15;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__WFWorkflowControllerState_getStateFromURL_completionHandler___block_invoke;
    v13[3] = &unk_1E7AF0138;
    v14 = v5;
    v12 = (id)objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v8, v11, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v9);
  }

}

uint64_t __63__WFWorkflowControllerState_getStateFromURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
