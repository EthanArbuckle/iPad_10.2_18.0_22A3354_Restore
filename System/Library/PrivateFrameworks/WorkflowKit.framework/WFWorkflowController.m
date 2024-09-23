@implementation WFWorkflowController

- (WFWorkflowController)init
{
  WFWorkflowController *v2;
  WFWorkflowController *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *executionQueue;
  WFWorkflowController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowController;
  v2 = -[WFWorkflowController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_donateInteraction = 1;
    v2->_acquiresAssertionWhileRunning = 1;
    v2->_resumed = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.shortcuts.workflow-execution", v5);
    executionQueue = v3->_executionQueue;
    v3->_executionQueue = (OS_dispatch_queue *)v6;

    objc_storeStrong((id *)&v3->_delegateQueue, MEMORY[0x1E0C80D38]);
    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFWorkflowController workflowRunAssertion](self, "workflowRunAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateWithError:", 0);

  -[WFWorkflowController currentActionProgress](self, "currentActionProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), WFCurrentActionFractionCompletedContext);

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowController;
  -[WFWorkflowController dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)WFCurrentActionFractionCompletedContext == a6)
  {
    -[WFWorkflowController publishActionProgress](self, "publishActionProgress", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFWorkflowController;
    -[WFWorkflowController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setWorkflow:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WFWorkflowController_setWorkflow___block_invoke;
  block[3] = &unk_1E7AF92C0;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

- (void)queue_setWorkflow:(id)a3
{
  WFWorkflow *v4;
  uint64_t v5;
  WFWorkflow *workflow;

  v4 = (WFWorkflow *)a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  LOBYTE(v5) = -[WFWorkflow isEqual:](self->_workflow, "isEqual:", v4);
  workflow = self->_workflow;
  self->_workflow = v4;

  if ((v5 & 1) == 0)
    -[WFWorkflowController queue_reset](self, "queue_reset");
}

- (BOOL)isRunning
{
  return self->_running || self->_stepping;
}

- (WFAction)currentAction
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[WFWorkflowController currentIndex](self, "currentIndex");
  -[WFWorkflowController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFWorkflowController isRunning](self, "isRunning") && v3 < objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (WFAction *)v6;
}

- (WFWorkflowControllerState)currentState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFWorkflowController pendingState](self, "pendingState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowController pendingState](self, "pendingState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFWorkflowController workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v7 = -[WFWorkflowController currentIndex](self, "currentIndex");
      if (v7 >= objc_msgSend(v6, "count"))
        v7 = 0;
      objc_msgSend(v6, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "input");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "processedParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController stateWithActionIndex:input:processedParameters:](self, "stateWithActionIndex:input:processedParameters:", v7, v9, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return (WFWorkflowControllerState *)v4;
}

- (id)stateWithActionIndex:(unint64_t)a3 input:(id)a4 processedParameters:(id)a5
{
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  WFWorkflowControllerState *v30;
  void *v31;
  void *v32;
  id v33;
  WFWorkflowControllerState *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v37 = a5;
  v36 = a4;
  -[WFWorkflowController variableTable](self, "variableTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowController userInterface](self, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFWorkflowController userInterface](self, "userInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dialogTransformer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (id)objc_msgSend(v12, "numberOfDialogsPresented");

  }
  else
  {
    v33 = 0;
  }
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[WFWorkflowController workflow](self, "workflow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "if_flatMap:", &__block_literal_global_24303);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v16);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = [WFWorkflowControllerState alloc];
  -[WFWorkflowController workflow](self, "workflow");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reference");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController runningContext](self, "runningContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController startDate](self, "startDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController runSource](self, "runSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[WFWorkflowController outputBehavior](self, "outputBehavior");
  -[WFWorkflowController workflow](self, "workflow");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "actions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentAttributionTracker");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController contentItemCache](self, "contentItemCache");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController flowTracker](self, "flowTracker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController workflow](self, "workflow");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allowedOnceSmartPromptStates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = -[WFWorkflowController shouldDisablePrivacyPrompts](self, "shouldDisablePrivacyPrompts");
  v34 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v30, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", v40, v38, a3, v28, v36, v37, v39, v26, v33, v27, v17, v25, v18, v22, v41,
          v24);

  return v34;
}

- (id)currentStateWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  WFWorkflowControllerState *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFWorkflowControllerState *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a3;
  -[WFWorkflowController currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v27 = v4;
    if (v4)
    {
      v7 = v4;
    }
    else
    {
      objc_msgSend(v5, "runningContext");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v7;
    v21 = [WFWorkflowControllerState alloc];
    objc_msgSend(v6, "workflow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "variables");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v6, "currentActionIndex");
    objc_msgSend(v6, "currentInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentProcessedParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRunSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "numberOfDialogsPresented");
    v10 = objc_msgSend(v6, "outputBehavior");
    objc_msgSend(v6, "currentActionContentAttributionTracker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flowTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allowedOnceSmartPromptStates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionResourceClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v6, "shouldDisablePrivacyPrompts");
    v8 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v21, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", v20, v25, v24, v26, v23, v22, v19, v18, v9, v10, v17, v16, v11, v12, v13,
           v15);

    v4 = v27;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WFWorkflowRunningContext)runningContext
{
  WFWorkflowRunningContext *runningContext;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFWorkflowRunningContext *v9;

  runningContext = self->_runningContext;
  if (!runningContext)
  {
    if (self->_workflow)
    {
      v4 = objc_alloc(MEMORY[0x1E0DC7E80]);
      -[WFWorkflowController workflow](self, "workflow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "workflowID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v4, "initWithWorkflowIdentifier:", v6);

      -[WFWorkflowController runSource](self, "runSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRunSource:", v8);

      objc_msgSend(v7, "setOutputBehavior:", -[WFWorkflowController outputBehavior](self, "outputBehavior"));
      v9 = self->_runningContext;
      self->_runningContext = (WFWorkflowRunningContext *)v7;

      runningContext = self->_runningContext;
    }
    else
    {
      runningContext = 0;
    }
  }
  return runningContext;
}

- (BOOL)runningAsStepWiseExecutor
{
  void *v2;
  char v3;

  -[WFWorkflowController runningContext](self, "runningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStepwise");

  return v3;
}

- (void)publishRunningState:(int64_t)a3
{
  void *v4;
  id v5;

  -[WFWorkflowController progress](self, "progress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInfoObject:forKey:", v4, *MEMORY[0x1E0DC8410]);

}

- (void)publishActionProgress
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFWorkflowController currentIndex](self, "currentIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC8400]);

  -[WFWorkflowController currentAction](self, "currentAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProgressIndeterminate");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[WFWorkflowController currentActionProgress](self, "currentActionProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fractionCompleted");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC83F8]);

  }
  -[WFWorkflowController progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfoObject:forKey:", v10, *MEMORY[0x1E0DC8408]);

}

- (void)setCurrentActionProgress:(id)a3
{
  NSProgress *v4;
  NSProgress *currentActionProgress;
  NSProgress *v6;

  v4 = (NSProgress *)a3;
  -[NSProgress removeObserver:forKeyPath:context:](self->_currentActionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), WFCurrentActionFractionCompletedContext);
  currentActionProgress = self->_currentActionProgress;
  self->_currentActionProgress = v4;
  v6 = v4;

  -[NSProgress addObserver:forKeyPath:options:context:](self->_currentActionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 4, WFCurrentActionFractionCompletedContext);
}

- (WFControlFlowAttributionTracker)flowTracker
{
  WFControlFlowAttributionTracker *flowTracker;
  WFControlFlowAttributionTracker *v4;
  WFControlFlowAttributionTracker *v5;

  flowTracker = self->_flowTracker;
  if (!flowTracker)
  {
    v4 = objc_alloc_init(WFControlFlowAttributionTracker);
    v5 = self->_flowTracker;
    self->_flowTracker = v4;

    flowTracker = self->_flowTracker;
  }
  return flowTracker;
}

- (WFContentItemCache)contentItemCache
{
  WFContentItemCache *contentItemCache;
  WFContentItemCache *v4;
  WFContentItemCache *v5;

  contentItemCache = self->_contentItemCache;
  if (!contentItemCache)
  {
    v4 = objc_alloc_init(WFContentItemCache);
    v5 = self->_contentItemCache;
    self->_contentItemCache = v4;

    contentItemCache = self->_contentItemCache;
  }
  return contentItemCache;
}

- (WFContentCollection)capturedFiles
{
  WFContentCollection *capturedFiles;
  WFContentCollection *v4;
  WFContentCollection *v5;

  capturedFiles = self->_capturedFiles;
  if (!capturedFiles)
  {
    v4 = (WFContentCollection *)objc_alloc_init(MEMORY[0x1E0D13EA8]);
    v5 = self->_capturedFiles;
    self->_capturedFiles = v4;

    capturedFiles = self->_capturedFiles;
  }
  return capturedFiles;
}

- (id)actionOutputs
{
  return self->_actionOutputsByWorkflowIndex;
}

- (WFSmartPromptsExfiltrationLogger)exfiltrationLogger
{
  WFSmartPromptsExfiltrationLogger *exfiltrationLogger;
  WFSmartPromptsExfiltrationLogger *v4;
  WFSmartPromptsExfiltrationLogger *v5;

  exfiltrationLogger = self->_exfiltrationLogger;
  if (!exfiltrationLogger)
  {
    v4 = objc_alloc_init(WFSmartPromptsExfiltrationLogger);
    v5 = self->_exfiltrationLogger;
    self->_exfiltrationLogger = v4;

    exfiltrationLogger = self->_exfiltrationLogger;
  }
  return exfiltrationLogger;
}

- (void)_step
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[WFWorkflowController isStepping](self, "isStepping"))
  {
    -[WFWorkflowController workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count")
      && -[WFWorkflowController runningAsStepWiseExecutor](self, "runningAsStepWiseExecutor"))
    {
      getWFWorkflowExecutionLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[WFWorkflowController _step]";
        v37 = 2048;
        v38 = -[WFWorkflowController currentIndex](self, "currentIndex");
        v39 = 2048;
        v40 = objc_msgSend(v6, "count");
        v8 = "%s Step-wise executor: no actions yet (ci: %lu, actions count: %lu), ending step";
LABEL_17:
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0x20u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    v9 = -[WFWorkflowController currentIndex](self, "currentIndex");
    v10 = -[WFWorkflowController currentIndex](self, "currentIndex");
    if (!v9)
    {
      objc_msgSend(v6, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      -[WFWorkflowController input](self, "input");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[WFWorkflowController workflow](self, "workflow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "variableAvailability");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isShortcutInputVariableUsed");

        if (v20)
        {
          -[WFWorkflowController input](self, "input");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowController setContent:forVariableWithName:](self, "setContent:forVariableWithName:", v21, CFSTR("FB539828-643B-41E5-BA20-9C1717057230-workflowinput"));

        }
        if (objc_msgSend(v11, "usesLegacyInputBehavior"))
        {
          -[WFWorkflowController input](self, "input");
          v22 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v22;
        }
        -[WFWorkflowController setInput:](self, "setInput:", 0);
      }
      -[WFWorkflowController pendingActionInput](self, "pendingActionInput");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[WFWorkflowController pendingActionInput](self, "pendingActionInput");
        v24 = objc_claimAutoreleasedReturnValue();

        -[WFWorkflowController setPendingActionInput:](self, "setPendingActionInput:", 0);
        v9 = (void *)v24;
      }
      -[WFWorkflowController pendingProcessedParameters](self, "pendingProcessedParameters");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[WFWorkflowController pendingProcessedParameters](self, "pendingProcessedParameters");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setProcessedParameters:", v26);

        -[WFWorkflowController setPendingProcessedParameters:](self, "setPendingProcessedParameters:", 0);
      }
      -[WFWorkflowController setStepping:](self, "setStepping:", 1);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __29__WFWorkflowController__step__block_invoke;
      v32[3] = &unk_1E7AF55D0;
      v32[4] = self;
      v33 = v11;
      v34 = v9;
      v27 = v9;
      v7 = v11;
      -[WFWorkflowController prepareToRunAction:withInput:completionHandler:](self, "prepareToRunAction:withInput:completionHandler:", v7, v27, v32);

      goto LABEL_36;
    }
    if (v10 >= objc_msgSend(v6, "count"))
    {
      if (!-[WFWorkflowController runningAsStepWiseExecutor](self, "runningAsStepWiseExecutor"))
      {
        if ((-[WFWorkflowController outputBehavior](self, "outputBehavior") & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          objc_msgSend(v6, "lastObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "output");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowController setOutput:](self, "setOutput:", v29);

          -[WFWorkflowController contentItemCache](self, "contentItemCache");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWorkflowController output](self, "output");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addContentCollection:", v31);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 7, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        -[WFWorkflowController _finishStepWithError:](self, "_finishStepWithError:", v7);
        goto LABEL_36;
      }
      getWFWorkflowExecutionLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[WFWorkflowController _step]";
        v37 = 2048;
        v38 = -[WFWorkflowController currentIndex](self, "currentIndex");
        v39 = 2048;
        v40 = objc_msgSend(v6, "count");
        v8 = "%s Step-wise executor: nowhere to step, holding (ci: %lu, actions count: %lu)";
        goto LABEL_17;
      }
LABEL_36:

      goto LABEL_37;
    }
    objc_msgSend(v6, "objectAtIndex:", -[WFWorkflowController currentIndex](self, "currentIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", -[WFWorkflowController currentIndex](self, "currentIndex") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController workflow](self, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "ignoresOutputFromAction:inWorkflow:", v12, v13) & 1) != 0)
    {

    }
    else
    {
      v14 = objc_msgSend(v11, "usesLegacyInputBehavior");

      if (v14)
      {
        objc_msgSend(v12, "output");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
    }
    v9 = 0;
LABEL_21:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v12, "mode"))
      objc_msgSend(v12, "resetOutput");
    -[WFWorkflowController contentItemCache](self, "contentItemCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "output");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addContentCollection:", v16);

    goto LABEL_25;
  }
  getWFWorkflowExecutionLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[WFWorkflowController _step]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_ERROR, "%s Step called while already stepping.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 37, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController _finishStepWithError:](self, "_finishStepWithError:", v5);
LABEL_37:

}

- (void)_finishStepWithError:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD block[5];
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFWorkflowController currentAction](self, "currentAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController setLastExecutedAction:](self, "setLastExecutedAction:", v4);

  objc_msgSend(v24, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB2FE0];
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v7 = v24;
    v8 = objc_msgSend(v24, "code");

    if (v8 == 37)
      goto LABEL_31;
  }
  else
  {

    v7 = v24;
  }
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v6))
  {
    v10 = objc_msgSend(v24, "code");

    if (v10 == 7)
    {
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", 0);
      v11 = dispatch_group_create();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[WFWorkflowController workflow](self, "workflow");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v17, "extendedOperation");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              dispatch_group_enter(v11);
              objc_initWeak(&location, v17);
              objc_msgSend(v17, "extendedOperation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __45__WFWorkflowController__finishStepWithError___block_invoke;
              v26[3] = &unk_1E7AEFE38;
              objc_copyWeak(&v28, &location);
              v27 = v11;
              objc_msgSend(v19, "addCompletionHandlerIfRunning:", v26);

              objc_destroyWeak(&v28);
              objc_destroyWeak(&location);
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v14);
      }

      -[WFWorkflowController executionQueue](self, "executionQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__WFWorkflowController__finishStepWithError___block_invoke_2;
      block[3] = &unk_1E7AF94B0;
      block[4] = self;
      dispatch_group_notify(v11, v20, block);

      goto LABEL_30;
    }
  }
  else
  {

  }
  v7 = v24;
  if (objc_msgSend(v24, "wf_isUserCancelledError"))
  {
    -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:", 0, 1);
    -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", 0);
    -[WFWorkflowController progress](self, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
    v22 = v21;
    objc_msgSend(v21, "unpublish");

    -[WFWorkflowController setProgress:](self, "setProgress:", 0);
LABEL_30:
    v7 = v24;
    goto LABEL_31;
  }
  if (v24)
  {
    if (objc_msgSend(v24, "wf_isUnsupportedUserInterfaceError"))
    {
      -[WFWorkflowController setFinishedRunningWithSuccess:](self, "setFinishedRunningWithSuccess:", 0);
      -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:", v24, 0);
      -[WFWorkflowController progress](self, "progress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    if (!-[WFWorkflowController runningAsStepWiseExecutor](self, "runningAsStepWiseExecutor"))
    {
      -[WFWorkflowController setFinishedRunningWithSuccess:](self, "setFinishedRunningWithSuccess:", 0);
      -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:", v24, 0);
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", 0);
      -[WFWorkflowController progress](self, "progress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
  }
  if (!-[WFWorkflowController runningAsStepWiseExecutor](self, "runningAsStepWiseExecutor"))
  {
    if (!self->_running)
    {
      -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:", 0, 1);
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", 0);
      goto LABEL_31;
    }
    -[WFWorkflowController setResumed:](self, "setResumed:", 0);
  }
  -[WFWorkflowController _step](self, "_step");
LABEL_31:

}

- (void)run
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (void *)voucher_copy();
  -[WFWorkflowController setExecutionVoucher:](self, "setExecutionVoucher:", v3);

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__WFWorkflowController_run__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_run
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFWorkflowExecutionLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[WFWorkflowController workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFWorkflowController _run]";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Starting workflow execution: %@", buf, 0x16u);

  }
  -[WFWorkflowController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "disabledOnLockScreen"))
  {
    v7 = +[WFCompactUnlockService isDeviceLocked](WFCompactUnlockService, "isDeviceLocked");

    if (v7)
    {
      getWFWorkflowExecutionLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[WFWorkflowController workflow](self, "workflow");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v16 = "-[WFWorkflowController _run]";
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution because the device is locked and this workflow is disabled on the lock screen: %@", buf, 0x16u);

      }
      +[WFSmartPromptState localizedUnlockedDeviceRequiredError](WFSmartPromptState, "localizedUnlockedDeviceRequiredError");
      v10 = objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:", v10, 0);
LABEL_16:

      return;
    }
  }
  else
  {

  }
  -[WFWorkflowController restorePendingStateIfNecessary](self, "restorePendingStateIfNecessary");
  -[WFWorkflowController workflow](self, "workflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasActions") & 1) != 0)
  {

LABEL_12:
    if (-[WFWorkflowController canRun](self, "canRun"))
    {
      -[WFWorkflowController setActionDidRunRemotely:](self, "setActionDidRunRemotely:", 0);
      -[WFWorkflowController setUpRunState](self, "setUpRunState");
      -[WFWorkflowController workflowControllerWillRun:](self, "workflowControllerWillRun:", self);
      -[WFWorkflowController resetEvaluationCriteriaForControlFlowActions](self, "resetEvaluationCriteriaForControlFlowActions");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __28__WFWorkflowController__run__block_invoke;
      v14[3] = &unk_1E7AF7CF0;
      v14[4] = self;
      -[WFWorkflowController resolveWorkflowInputWithCompletion:](self, "resolveWorkflowInputWithCompletion:", v14);
      return;
    }
    getWFWorkflowExecutionLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[WFWorkflowController workflow](self, "workflow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFWorkflowController _run]";
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_INFO, "%s Workflow is already running, returning early: %@", buf, 0x16u);

    }
    goto LABEL_16;
  }
  v12 = -[WFWorkflowController runningAsStepWiseExecutor](self, "runningAsStepWiseExecutor");

  if (v12)
    goto LABEL_12;
  -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:", 0, 0);
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__WFWorkflowController_stop__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__WFWorkflowController_stopWithError___block_invoke;
  v7[3] = &unk_1E7AF92C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)queue_stopWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  LODWORD(v4) = self->_running;
  -[WFWorkflowController setFinishedRunningWithSuccess:](self, "setFinishedRunningWithSuccess:", 0);
  if ((_DWORD)v4)
  {
    -[WFWorkflowController currentAction](self, "currentAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isRunning"))
    {
      if (v6)
        objc_msgSend(v5, "finishRunningWithError:");
      else
        objc_msgSend(v5, "cancel");
    }
    else
    {
      -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:");
    }

  }
}

- (void)step
{
  NSObject *v3;
  _QWORD block[5];

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__WFWorkflowController_step__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setFinishedRunningWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_running)
  {
    -[WFWorkflowController progress](self, "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInfoObject:forKey:", 0, *MEMORY[0x1E0DC8408]);

    -[WFWorkflowController logFinishRunEvent:](self, "logFinishRunEvent:", v3);
    self->_running = 0;
    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[WFWorkflowController workflow](self, "workflow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("no");
      v11 = "-[WFWorkflowController setFinishedRunningWithSuccess:]";
      v10 = 136315650;
      v12 = 2112;
      v13 = v8;
      if (v3)
        v9 = CFSTR("yes");
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Stopping workflow execution: %@. success: %@", (uint8_t *)&v10, 0x20u);

    }
  }
}

- (void)reset
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WFWorkflowController_reset__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)queue_reset
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFWorkflowController queue_stopWithError:](self, "queue_stopWithError:", 0);
  -[WFWorkflowController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_resetOutput);

  -[WFWorkflowController setOutput:](self, "setOutput:", 0);
  -[WFWorkflowController setLastExecutedAction:](self, "setLastExecutedAction:", 0);
  -[WFWorkflowController variableTable](self, "variableTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[WFWorkflowController actionOutputsByWorkflowIndex](self, "actionOutputsByWorkflowIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[WFWorkflowController environmentValueTable](self, "environmentValueTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[WFWorkflowController contentItemCache](self, "contentItemCache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clear");

}

- (NSMapTable)variableTable
{
  NSMapTable *variableTable;
  NSMapTable *v4;
  NSMapTable *v5;

  variableTable = self->_variableTable;
  if (!variableTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_variableTable;
    self->_variableTable = v4;

    variableTable = self->_variableTable;
  }
  return variableTable;
}

- (NSMapTable)environmentValueTable
{
  NSMapTable *environmentValueTable;
  NSMapTable *v4;
  NSMapTable *v5;

  environmentValueTable = self->_environmentValueTable;
  if (!environmentValueTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_environmentValueTable;
    self->_environmentValueTable = v4;

    environmentValueTable = self->_environmentValueTable;
  }
  return environmentValueTable;
}

- (BOOL)setContent:(id)a3 forVariableWithName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("user-%@"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WFWorkflowController flowTracker](self, "flowTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentCollectionByTaintingContentCollection:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v6;
    v12 = v11;

    -[WFWorkflowController variableTable](self, "variableTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v7);

    -[WFWorkflowController contentItemCache](self, "contentItemCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addContentCollection:", v12);

  }
  else
  {
    -[WFWorkflowController contentItemCache](self, "contentItemCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController variableTable](self, "variableTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteContentCollection:", v17);

    -[WFWorkflowController variableTable](self, "variableTable");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v7);
  }

  return 1;
}

- (id)contentForVariableWithName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("user-%@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController variableTable](self, "variableTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)workflowInput
{
  return -[WFWorkflowController contentForVariableWithName:](self, "contentForVariableWithName:", CFSTR("FB539828-643B-41E5-BA20-9C1717057230-workflowinput"));
}

- (void)setContent:(id)a3 forPrivateVariableKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFWorkflowController variableTable](self, "variableTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (id)contentForPrivateVariableKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFWorkflowController variableTable](self, "variableTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)captureFileRepresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflowController capturedFiles](self, "capturedFiles");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFile:", v4);

}

- (void)requestAccessToFileAtLocations:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t v13[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFFilesLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFWorkflowController requestAccessToFileAtLocations:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Requesting file access to %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = __Block_byref_object_copy__24267;
  v19 = __Block_byref_object_dispose__24268;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__WFWorkflowController_requestAccessToFileAtLocations_completionHandler___block_invoke;
  v12[3] = &unk_1E7AEFE60;
  v12[4] = buf;
  objc_msgSend(v6, "if_compactMap:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    -[WFWorkflowController requestAccessToFileAtURLs:completionHandler:](self, "requestAccessToFileAtURLs:completionHandler:", v9, v7);
  }
  else
  {
    getWFFilesLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v13 = 136315394;
      v14 = "-[WFWorkflowController requestAccessToFileAtLocations:completionHandler:]";
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not resolve location with error: %@", v13, 0x16u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

  _Block_object_dispose(buf, 8);
}

- (void)requestAccessToFileAtURLs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[WFWorkflowController userInterface](self, "userInterface");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController workflow](self, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E7AFA810;
  -[WFWorkflowController workflow](self, "workflow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workflowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestFileAccessForURLs:workflowName:workflowID:completionHandler:", v7, v11, v13, v6);

}

- (id)environmentValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFWorkflowController environmentValueTable](self, "environmentValueTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setEnvironmentValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFWorkflowController environmentValueTable](self, "environmentValueTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (id)remoteDialogPresenterEndpointForRunWorkflowAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[WFWorkflowController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteDialogPresenterEndpointForController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)action:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[WFWorkflowController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "workflowController:didDecideRunningProgressIsAllowed:forAction:", self, v4, v9);

  }
}

- (id)actionReversalStateForAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFWorkflowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workflowController:actionReversalStateForAction:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)action:(id)a3 didGenerateReversalState:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFWorkflowController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workflowController:didGenerateReversalState:forAction:", self, v6, v10);

  }
}

- (BOOL)isTesting
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFWorkflowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[WFWorkflowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "workflowControllerIsTesting:", self);

  return v6;
}

- (void)action:(id)a3 handleTestingEvent:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  -[WFWorkflowController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workflowController:handleTestingEvent:completionHandler:", self, v11, v7);

  }
  else
  {
    v7[2](v7, 1, 0);
  }

}

- (void)retainSelf
{
  objc_storeStrong((id *)&self->_strongSelf, self);
}

- (void)autoreleaseSelf
{
  WFWorkflowController **p_strongSelf;
  WFWorkflowController *v3;

  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, objc_retainAutorelease(self->_strongSelf));
  v3 = *p_strongSelf;
  *p_strongSelf = 0;

}

- (void)acquireAssertionIfNeeded
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[WFWorkflowController acquiresAssertionWhileRunning](self, "acquiresAssertionWhileRunning"))
  {
    -[WFWorkflowController workflowRunAssertion](self, "workflowRunAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v4 = (void *)getRBSAssertionClass_softClass;
      v23 = getRBSAssertionClass_softClass;
      if (!getRBSAssertionClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSAssertionClass_block_invoke;
        v26 = &unk_1E7AF9520;
        v27 = &v20;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        v4 = (void *)v21[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v20, 8);
      v6 = [v5 alloc];
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v7 = (void *)getRBSTargetClass_softClass;
      v23 = getRBSTargetClass_softClass;
      if (!getRBSTargetClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSTargetClass_block_invoke;
        v26 = &unk_1E7AF9520;
        v27 = &v20;
        __getRBSTargetClass_block_invoke((uint64_t)buf);
        v7 = (void *)v21[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v8, "currentProcess");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v10 = (void *)getRBSDomainAttributeClass_softClass;
      v23 = getRBSDomainAttributeClass_softClass;
      if (!getRBSDomainAttributeClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getRBSDomainAttributeClass_block_invoke;
        v26 = &unk_1E7AF9520;
        v27 = &v20;
        __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
        v10 = (void *)v21[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v11, "attributeWithDomain:name:", CFSTR("com.apple.shortcuts"), CFSTR("RunningBackground"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v6, "initWithExplanation:target:attributes:", CFSTR("Running shortcuts in background"), v9, v13);
      -[WFWorkflowController setWorkflowRunAssertion:](self, "setWorkflowRunAssertion:", v14);

      -[WFWorkflowController workflowRunAssertion](self, "workflowRunAssertion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v16 = objc_msgSend(v15, "acquireWithError:", &v19);
      v17 = v19;

      if ((v16 & 1) == 0)
      {
        getWFWorkflowExecutionLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFWorkflowController acquireAssertionIfNeeded]";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v17;
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Unable to acquire workflow run assertion: %{public}@", buf, 0x16u);
        }

      }
    }
  }
}

- (void)invalidateAssertionIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFWorkflowController workflowRunAssertion](self, "workflowRunAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowController workflowRunAssertion](self, "workflowRunAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v5 = objc_msgSend(v4, "invalidateWithError:", &v8);
    v6 = v8;

    if ((v5 & 1) == 0)
    {
      getWFWorkflowExecutionLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[WFWorkflowController invalidateAssertionIfNeeded]";
        v11 = 2114;
        v12 = v6;
        _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to invalidate existing workflow run assertion: %{public}@", buf, 0x16u);
      }

    }
    -[WFWorkflowController setWorkflowRunAssertion:](self, "setWorkflowRunAssertion:", 0);

  }
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[WFWorkflowController parameterInputProviderForAction:](self, "parameterInputProviderForAction:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    getWFWorkflowExecutionLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = 136315394;
      v20 = "-[WFWorkflowController action:provideInputForParameters:withDefaultStates:prompts:completionHandler:]";
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s Asking input provider to provide input for parameters: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    objc_msgSend(v17, "action:provideInputForParameters:withDefaultStates:prompts:completionHandler:", v12, v13, v14, v15, v16);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }

}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[WFWorkflowController parameterInputProviderForAction:](self, "parameterInputProviderForAction:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "action:canProvideInputForParameter:", v7, v6);

  return v9;
}

- (void)logStartEvent
{
  -[WFWorkflowController trackRunShortcutEventWithKey:completed:](self, "trackRunShortcutEventWithKey:completed:", CFSTR("RunShortcutStart"), 0);
}

- (void)logFinishRunEvent:(BOOL)a3
{
  -[WFWorkflowController trackRunShortcutEventWithKey:completed:](self, "trackRunShortcutEventWithKey:completed:", CFSTR("RunShortcutFinish"), a3);
}

- (void)trackRunShortcutEventWithKey:(id)a3 completed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  WFRunShortcutEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFWorkflowController runSource](self, "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    getWFEventTrackerLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v27 = 136315138;
      v28 = "-[WFWorkflowController trackRunShortcutEventWithKey:completed:]";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Missing run source when tracking WFRunShortcutEvent", (uint8_t *)&v27, 0xCu);
    }

  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("RunShortcutStart"))
    || !-[WFWorkflowController resumed](self, "resumed"))
  {
    v9 = objc_alloc_init(WFRunShortcutEvent);
    -[WFRunShortcutEvent setKey:](v9, "setKey:", v6);
    -[WFWorkflowController workflow](self, "workflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setActionCount:](v9, "setActionCount:", objc_msgSend(v11, "count"));

    -[WFWorkflowController workflow](self, "workflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setShortcutSource:](v9, "setShortcutSource:", v13);

    -[WFRunShortcutEvent shortcutSource](v9, "shortcutSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      getWFEventTrackerLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v27 = 136315138;
        v28 = "-[WFWorkflowController trackRunShortcutEventWithKey:completed:]";
        _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s RunEvent source was unexpectedly nil", (uint8_t *)&v27, 0xCu);
      }

      -[WFRunShortcutEvent setShortcutSource:](v9, "setShortcutSource:", CFSTR("ShortcutSourceUnknown"));
    }
    -[WFWorkflowController runSource](self, "runSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setRunSource:](v9, "setRunSource:", v16);

    -[WFWorkflowController automationType](self, "automationType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setAutomationType:](v9, "setAutomationType:", v17);

    -[WFWorkflowController workflow](self, "workflow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "record");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "galleryIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setGalleryIdentifier:](v9, "setGalleryIdentifier:", v20);

    -[WFRunShortcutEvent setCompleted:](v9, "setCompleted:", v4);
    -[WFRunShortcutEvent setDidRunRemotely:](v9, "setDidRunRemotely:", -[WFWorkflowController actionDidRunRemotely](self, "actionDidRunRemotely"));
    -[WFRunShortcutEvent setIsFromAutomationSuggestion:](v9, "setIsFromAutomationSuggestion:", -[WFWorkflowController isAutomationSuggestion](self, "isAutomationSuggestion"));
    -[WFWorkflowController automationTrialID](self, "automationTrialID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setAutomationSuggestionsTrialIdentifier:](v9, "setAutomationSuggestionsTrialIdentifier:", v21);

    -[WFWorkflowController runningContext](self, "runningContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "originatingBundleIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    -[WFRunShortcutEvent setScriptingRunBundleIdentifier:](v9, "setScriptingRunBundleIdentifier:", v23);

    -[WFWorkflowController userInterface](self, "userInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[WFWorkflowController userInterface](self, "userInterface");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "dialogTransformer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRunShortcutEvent setNumberOfDialogsPresented:](v9, "setNumberOfDialogsPresented:", objc_msgSend(v26, "numberOfDialogsPresented"));

    }
    -[WFEvent track](v9, "track");

  }
}

- (void)logStartActionEventWithAction:(id)a3
{
  -[WFWorkflowController trackRunActionEventWithKey:action:completed:error:](self, "trackRunActionEventWithKey:action:completed:error:", CFSTR("RunActionStart"), a3, 0, 0);
}

- (void)logFinishActionEventWithAction:(id)a3 completed:(BOOL)a4 error:(id)a5
{
  -[WFWorkflowController trackRunActionEventWithKey:action:completed:error:](self, "trackRunActionEventWithKey:action:completed:error:", CFSTR("RunActionFinish"), a3, a4, a5);
}

- (void)trackRunActionEventWithKey:(id)a3 action:(id)a4 completed:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  WFRunActionEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(WFRunActionEvent);
  -[WFRunActionEvent setKey:](v13, "setKey:", v12);

  objc_msgSend(v10, "metricsIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setActionIdentifier:](v13, "setActionIdentifier:", v14);

  objc_msgSend(v10, "externalMetricsBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setExternalBundleIdentifier:](v13, "setExternalBundleIdentifier:", v15);

  objc_msgSend(v10, "externalMetricsActionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setExternalActionIdentifier:](v13, "setExternalActionIdentifier:", v16);

  -[WFRunActionEvent actionIdentifier](v13, "actionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v17, "wf_isEmpty");

  if ((_DWORD)v12)
  {
    getWFEventTrackerLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      -[WFWorkflowController workflow](self, "workflow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 136315394;
      v31 = "-[WFWorkflowController trackRunActionEventWithKey:action:completed:error:]";
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_FAULT, "%s Unexpected empty actionIdentifier. Run source: %{public}@", (uint8_t *)&v30, 0x16u);

    }
  }
  -[WFWorkflowController runSource](self, "runSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setRunSource:](v13, "setRunSource:", v21);

  -[WFWorkflowController workflow](self, "workflow");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "source");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setShortcutSource:](v13, "setShortcutSource:", v23);

  -[WFWorkflowController automationType](self, "automationType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setAutomationType:](v13, "setAutomationType:", v24);

  -[WFRunActionEvent setDidRunRemotely:](v13, "setDidRunRemotely:", objc_msgSend(v10, "didRunRemotely"));
  -[WFRunActionEvent setCompleted:](v13, "setCompleted:", v7);
  -[WFWorkflowController runSource](self, "runSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0DC8448]))
    v26 = objc_msgSend(v11, "wf_isUserCancelledError");
  else
    v26 = 0;
  -[WFRunActionEvent setIsInvalidatedSystemAction:](v13, "setIsInvalidatedSystemAction:", v26);

  -[WFWorkflowController workflow](self, "workflow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "record");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "galleryIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunActionEvent setGalleryIdentifier:](v13, "setGalleryIdentifier:", v29);

  if (objc_msgSend(v10, "didRunRemotely"))
    -[WFWorkflowController setActionDidRunRemotely:](self, "setActionDidRunRemotely:", 1);
  -[WFEvent track](v13, "track");

}

- (void)workflowControllerWillRun:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];

  -[WFWorkflowController executionQueue](self, "executionQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[WFWorkflowController retainSelf](self, "retainSelf");
  -[WFWorkflowController acquireAssertionIfNeeded](self, "acquireAssertionIfNeeded");
  -[WFWorkflowController delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WFWorkflowController_workflowControllerWillRun___block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_sync(v5, block);

}

- (void)didFinishRunningWithError:(id)a3 cancelled:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7 && v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowController.m"), 1001, CFSTR("Clients of WFWorkflowController should never receive both cancelled = YES and an error; they are mutually exclusive"));

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[WFWorkflowController workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "extendedOperation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "extendedOperation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "cancel");

          objc_msgSend(v15, "setExtendedOperation:", 0);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  -[WFWorkflowController setResumed:](self, "setResumed:", 0);
  -[WFWorkflowController autoreleaseSelf](self, "autoreleaseSelf");
  -[WFWorkflowController delegateQueue](self, "delegateQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WFWorkflowController_didFinishRunningWithError_cancelled___block_invoke;
  block[3] = &unk_1E7AF22C8;
  block[4] = self;
  v22 = v7;
  v23 = v4;
  v19 = v7;
  dispatch_async(v18, block);

  -[WFWorkflowController invalidateAssertionIfNeeded](self, "invalidateAssertionIfNeeded");
}

- (void)prepareToRunAction:(id)a3 withInput:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  void (**v19)(_QWORD);
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  getWFWorkflowExecutionLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[WFWorkflowController prepareToRunAction:withInput:completionHandler:]";
    v22 = 2114;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Preparing to run action: %{public}@, with input: %@", buf, 0x20u);
  }

  -[WFWorkflowController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFWorkflowController delegateQueue](self, "delegateQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke;
    v16[3] = &unk_1E7AF8F70;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    dispatch_async(v15, v16);

  }
  else
  {
    v10[2](v10);
  }

}

- (void)runAction:(id)a3 withInput:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[WFWorkflowController userInterface](self, "userInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "isRunningWithSiriUI"))
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didStartActionWithIdentifier:", v14);

  }
  -[WFWorkflowController userInterface](self, "userInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke;
  v18[3] = &unk_1E7AF6F98;
  v18[4] = self;
  v19 = v9;
  v17 = v9;
  objc_msgSend(v8, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", v10, v15, self, self, v16, v18);

}

- (void)didRunAction:(id)a3 error:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[WFWorkflowController userInterface](self, "userInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "isRunningWithSiriUI"))
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didFinishActionWithIdentifier:", v14);

  }
  -[WFWorkflowController delegateQueue](self, "delegateQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke;
  v19[3] = &unk_1E7AF8F70;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  dispatch_async(v15, v19);

}

- (id)parameterInputProviderForAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFWorkflowController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workflowController:parameterInputProviderForAction:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)userInterface
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFWorkflowController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFWorkflowController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInterfaceForWorkflowController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)handleError:(id)a3 fromAction:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  void (**v49)(id, uint64_t);
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  void (**v54)(id, uint64_t);
  _QWORD block[5];
  id v56;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowController.m"), 1094, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowController.m"), 1095, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

LABEL_3:
  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "code");
  v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("WFActionErrorDomain"));
  v15 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D14318]);
  if (v13 == 2)
    v16 = v14;
  else
    v16 = 0;
  if (v14 && v13 == 4)
  {
    -[WFWorkflowController delegateQueue](self, "delegateQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke;
    block[3] = &unk_1E7AF92C0;
    block[4] = self;
    v18 = v10;
    v56 = v18;
    dispatch_async(v17, block);

    v19 = -[WFWorkflowController outputBehavior](self, "outputBehavior");
    if (v19 <= 3 && v19 != 1)
    {
      objc_msgSend(v18, "output");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController setOutput:](self, "setOutput:", v20);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 7, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v11[2](v11, v21);
    v9 = (id)v21;
  }
  else
  {
    if (v13)
      v22 = 0;
    else
      v22 = v15;
    if (v22 == 1
      && (-[WFWorkflowController delegate](self, "delegate"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_opt_respondsToSelector(),
          v23,
          (v24 & 1) != 0))
    {
      objc_msgSend(v9, "userInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", CFSTR("ActionInput"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "userInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("ActionProcessedParameters"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWorkflowController workflow](self, "workflow");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "actions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController stateWithActionIndex:input:processedParameters:](self, "stateWithActionIndex:input:processedParameters:", objc_msgSend(v30, "indexOfObject:", v10), v26, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWorkflowController delegateQueue](self, "delegateQueue");
      v32 = objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_2;
      v50[3] = &unk_1E7AF5EF8;
      v50[4] = self;
      v51 = v10;
      v52 = v31;
      v54 = v11;
      v9 = v9;
      v53 = v9;
      v33 = v31;
      dispatch_async(v32, v50);

      v34 = v51;
    }
    else
    {
      if (!v16
        || (-[WFWorkflowController delegate](self, "delegate"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v36 = objc_opt_respondsToSelector(),
            v35,
            (v36 & 1) == 0))
      {
        v11[2](v11, (uint64_t)v9);
        goto LABEL_23;
      }
      objc_msgSend(v9, "userInfo");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKey:", CFSTR("ActionInput"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "userInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", CFSTR("ActionProcessedParameters"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWorkflowController workflow](self, "workflow");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "actions");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController stateWithActionIndex:input:processedParameters:](self, "stateWithActionIndex:input:processedParameters:", objc_msgSend(v40, "indexOfObject:", v10), v26, v28);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWorkflowController delegateQueue](self, "delegateQueue");
      v42 = objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_6;
      v45[3] = &unk_1E7AF5EF8;
      v45[4] = self;
      v46 = v10;
      v47 = v41;
      v49 = v11;
      v9 = v9;
      v48 = v9;
      v33 = v41;
      dispatch_async(v42, v45);

      v34 = v46;
    }

  }
LABEL_23:

}

- (void)handleControlFlowActionCompletion:(id)a3 actionGroupSkipped:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[2];

  v4 = a4;
  v85[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "groupedOpenAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupedCloseAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController workflow](self, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WFProgressUnitsBetweenActions(v12, v9, v10);
    v14 = objc_msgSend(v9, "numberOfLoops") * v13;
    objc_msgSend(v9, "progress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTotalUnitCount:", v14);

    if (objc_msgSend(v8, "mode") != 2 && !v4)
      goto LABEL_40;
    if (v4)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v10, "setOutput:onVariableSource:", v16, self);

    }
    if (!objc_msgSend(v9, "shouldRepeatWithVariableSource:", self))
    {
      objc_msgSend(v9, "resetEvaluationCriteriaWithVariableSource:", self);
      objc_msgSend(v9, "setProgress:", 0);
LABEL_40:

LABEL_41:
LABEL_50:

      goto LABEL_51;
    }
    objc_msgSend(v9, "progress");
    v81 = objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController workflow](self, "workflow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "indexOfObject:", v9);

    if (v19 < -[WFWorkflowController currentIndex](self, "currentIndex") - 1)
    {
      v20 = v19;
      do
      {
        -[WFWorkflowController workflow](self, "workflow");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "actions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "resetOutput");

        ++v20;
      }
      while (v20 < -[WFWorkflowController currentIndex](self, "currentIndex") - 1);
    }
    v24 = (void *)v81;
    objc_msgSend(v9, "setProgress:", v81);
    -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", v19);
LABEL_39:

    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "groupedOpenAction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupedIntermediaryActions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "groupedCloseAction");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "mode") && objc_msgSend(v8, "mode") != 1)
    {
      if (objc_msgSend(v8, "mode") == 2 || v4)
      {
        objc_msgSend(v25, "resetEvaluationCriteriaWithVariableSource:", self);
        objc_msgSend(v25, "setProgress:", 0);
      }
      goto LABEL_49;
    }
    v29 = (void *)objc_msgSend(v25, "truthWithVariableSource:", self);
    if (_os_feature_enabled_impl())
    {
      v30 = (void *)MEMORY[0x1E0D13EA8];
      v80 = v27;
      v31 = (void *)MEMORY[0x1E0D13E28];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "itemWithObject:", v76);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
      v79 = v28;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "collectionWithItems:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController actionOutputsByWorkflowIndex](self, "actionOutputsByWorkflowIndex");
      v78 = (int)v29;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v25;
      v35 = (void *)MEMORY[0x1E0CB37E8];
      -[WFWorkflowController workflow](self, "workflow");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "actions");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v37, "indexOfObject:", v82));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, v38);

      v25 = v82;
      LODWORD(v29) = v78;

      v28 = v79;
      v27 = v80;

      if (v80)
      {
        v39 = (void *)MEMORY[0x1E0D13EA8];
        v40 = (void *)MEMORY[0x1E0D13E28];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v78 ^ 1u);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "itemWithObject:", v77);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "collectionWithItems:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWorkflowController actionOutputsByWorkflowIndex](self, "actionOutputsByWorkflowIndex");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0CB37E8];
        -[WFWorkflowController workflow](self, "workflow");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "actions");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "numberWithUnsignedInteger:", objc_msgSend(v46, "indexOfObject:", v80));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v47);

        v25 = v82;
        LODWORD(v29) = v78;

        v28 = v79;
        v27 = v80;

      }
    }
    if (objc_msgSend(v8, "mode"))
      v48 = 1;
    else
      v48 = (char)v29;
    if ((v48 & 1) != 0)
    {
      if (objc_msgSend(v8, "mode") == 1)
        v49 = (int)v29;
      else
        v49 = 0;
      if (v49 != 1)
        goto LABEL_45;
      objc_msgSend(v8, "output");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setOutput:", v50);

    }
    else
    {
      objc_msgSend(v8, "output");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        objc_msgSend(v27, "setOutput:", v61);

        -[WFWorkflowController workflow](self, "workflow");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "actions");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "indexOfObject:", v27) + 1;
LABEL_44:
        -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", v64);

LABEL_45:
        -[WFWorkflowController workflow](self, "workflow");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "actions");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70;
        if ((_DWORD)v29)
        {
          v72 = v25;
          v73 = v27;
        }
        else
        {
          v72 = v27;
          v73 = v28;
        }
        v74 = WFProgressUnitsBetweenActions(v70, v72, v73);
        objc_msgSend(v25, "progress");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setTotalUnitCount:", v74);

LABEL_49:
        goto LABEL_50;
      }
      objc_msgSend(v28, "setOutput:", v61);

    }
    -[WFWorkflowController workflow](self, "workflow");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "actions");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "indexOfObject:", v28);
    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "groupedOpenAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "mode") && objc_msgSend(v8, "mode") != 1)
      goto LABEL_41;
    if (objc_msgSend(v8, "latestMenuChoice") == -1)
    {
      objc_msgSend(v8, "groupedCloseAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "output");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOutput:", v65);

      objc_msgSend(v9, "progress");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "totalUnitCount");
      objc_msgSend(v9, "progress");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setCompletedUnitCount:", v67);

      -[WFWorkflowController workflow](self, "workflow");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "actions");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", objc_msgSend(v53, "indexOfObject:", v10));
    }
    else
    {
      -[WFWorkflowController workflow](self, "workflow");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "actionsGroupedWithAction:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "groupedIntermediaryActions");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectAtIndex:", objc_msgSend(v8, "latestMenuChoice"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v10, "indexOfObject:", v24) + 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController workflow](self, "workflow");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "actions");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = WFProgressUnitsBetweenActions(v55, v24, v53);
      objc_msgSend(v9, "progress");
      v83 = v9;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setTotalUnitCount:", v56);

      objc_msgSend(v8, "output");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setOutput:", v58);

      -[WFWorkflowController workflow](self, "workflow");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "actions");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", objc_msgSend(v60, "indexOfObject:", v24) + 1);

      v9 = v83;
    }

    goto LABEL_39;
  }
LABEL_51:

}

- (BOOL)canRun
{
  return !-[WFWorkflowController isRunning](self, "isRunning");
}

- (void)restorePendingStateIfNecessary
{
  NSObject *v3;
  void *v4;
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
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFWorkflowController pendingState](self, "pendingState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v29 = v4;
    objc_msgSend(v4, "variables");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__WFWorkflowController_restorePendingStateIfNecessary__block_invoke;
    v30[3] = &unk_1E7AEFE98;
    v30[4] = self;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v30);

    objc_msgSend(v29, "currentInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setPendingActionInput:](self, "setPendingActionInput:", v6);

    -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", objc_msgSend(v29, "currentActionIndex"));
    objc_msgSend(v29, "currentProcessedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setPendingProcessedParameters:](self, "setPendingProcessedParameters:", v7);

    -[WFWorkflowController setOutputBehavior:](self, "setOutputBehavior:", objc_msgSend(v29, "outputBehavior"));
    objc_msgSend(v29, "runningContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFWorkflowController runningContext](self, "runningContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "originatingBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "runningContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setOriginatingBundleIdentifier:", v10);

      objc_msgSend(v29, "runningContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController setRunningContext:](self, "setRunningContext:", v12);

    }
    objc_msgSend(v29, "contentItemCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setContentItemCache:](self, "setContentItemCache:", v13);

    objc_msgSend(v29, "flowTracker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setFlowTracker:](self, "setFlowTracker:", v14);

    v15 = objc_msgSend(v29, "currentActionIndex");
    -[WFWorkflowController workflow](self, "workflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v15 < v18)
    {
      -[WFWorkflowController workflow](self, "workflow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "actions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v29, "currentActionIndex"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "currentActionContentAttributionTracker");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContentAttributionTracker:", v22);

      objc_msgSend(v29, "allowedOnceSmartPromptStates");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAllowedOnceSmartPromptStates:", v23);

    }
    objc_msgSend(v29, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setStartDate:](self, "setStartDate:", v24);

    -[WFWorkflowController setResumed:](self, "setResumed:", 1);
    -[WFWorkflowController setPendingState:](self, "setPendingState:", 0);
    -[WFWorkflowController userInterface](self, "userInterface");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[WFWorkflowController userInterface](self, "userInterface");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dialogTransformer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v28, "setNumberOfDialogsPresented:", objc_msgSend(v29, "numberOfDialogsPresented"));
      }

    }
    v4 = v29;
  }

}

- (void)setUpRunState
{
  NSObject *v3;
  int64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[WFWorkflowController executionQueue](self, "executionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFWorkflowController logStartEvent](self, "logStartEvent");
  -[WFWorkflowController setUpProgress](self, "setUpProgress");
  v4 = -[WFWorkflowController currentIndex](self, "currentIndex") - 1;
  if (v4 >= 0)
  {
    -[WFWorkflowController workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v4 < v7)
    {
      -[WFWorkflowController workflow](self, "workflow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFWorkflowController workflow](self, "workflow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = WFProgressUnitsBetweenActions(v12, 0, v10);
      -[WFWorkflowController progress](self, "progress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCompletedUnitCount:", v13);

    }
  }
  -[WFWorkflowController setRunning:](self, "setRunning:", 1);
  -[WFWorkflowController publishRunningState:](self, "publishRunningState:", 1);
  -[WFWorkflowController startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setStartDate:](self, "setStartDate:", v16);

  }
}

- (void)setUpProgress
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[WFWorkflowController runningContext](self, "runningContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFProgressUnitsBetweenActions(v5, 0, 0);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__WFWorkflowController_setUpProgress__block_invoke;
  v11 = &unk_1E7AF5510;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "progressForPublishingWithTotalUnitCount:cancellationHandler:", v6, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowController setProgress:](self, "setProgress:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)resetEvaluationCriteriaForControlFlowActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[WFWorkflowController workflow](self, "workflow", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "resetEvaluationCriteriaWithVariableSource:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)errorByAddingActionIndex:(int64_t)a3 toError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("WFActionIndex"));

  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "code");

  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)resolveWorkflowInputWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  WFWorkflowController *v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD aBlock[5];
  id v27;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowController.m"), 1352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[WFWorkflowController executionQueue](self, "executionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[WFWorkflowController input](self, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItems");

  if (v8 < 1)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke;
    aBlock[3] = &unk_1E7AF76F0;
    aBlock[4] = self;
    v11 = v5;
    v27 = v11;
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[WFWorkflowController workflow](self, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workflowTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", *MEMORY[0x1E0DC84F8]);

    if (v15)
    {
      -[WFWorkflowController workflow](self, "workflow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inputClasses");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc_init(MEMORY[0x1E0DC7C00]);
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_4;
      v21[3] = &unk_1E7AEFF10;
      v22 = v17;
      v23 = self;
      v24 = v11;
      v25 = v12;
      v19 = v17;
      objc_msgSend(v18, "getOnScreenContentForInputContentClasses:completionHandler:", v19, v21);

    }
    else
    {
      v12[2](v12);
    }

  }
  else
  {
    -[WFWorkflowController input](self, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v9, 0);

  }
}

- (void)noInputBehavior:(id)a3 wantsToRunAction:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WFWorkflowController *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__WFWorkflowController_noInputBehavior_wantsToRunAction_completionHandler___block_invoke;
  v11[3] = &unk_1E7AF8378;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  -[WFWorkflowController prepareToRunAction:withInput:completionHandler:](self, "prepareToRunAction:withInput:completionHandler:", v10, 0, v11);

}

- (void)dialogTransformer:(id)a3 stopRunningWithError:(id)a4
{
  -[WFWorkflowController stopWithError:](self, "stopWithError:", a4);
}

- (void)dialogTransformerWillDisplayDialog:(id)a3
{
  -[WFWorkflowController publishRunningState:](self, "publishRunningState:", 2);
}

- (void)dialogTransformerDidDisplayDialog:(id)a3
{
  -[WFWorkflowController publishRunningState:](self, "publishRunningState:", 1);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (WFContentCollection)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (WFAction)lastExecutedAction
{
  return self->_lastExecutedAction;
}

- (void)setLastExecutedAction:(id)a3
{
  objc_storeStrong((id *)&self->_lastExecutedAction, a3);
}

- (BOOL)donateInteraction
{
  return self->_donateInteraction;
}

- (void)setDonateInteraction:(BOOL)a3
{
  self->_donateInteraction = a3;
}

- (WFWorkflowControllerDelegate)delegate
{
  return (WFWorkflowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void)setRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_runningContext, a3);
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRunSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)shouldDisablePrivacyPrompts
{
  return self->_shouldDisablePrivacyPrompts;
}

- (void)setShouldDisablePrivacyPrompts:(BOOL)a3
{
  self->_shouldDisablePrivacyPrompts = a3;
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isAutomationSuggestion
{
  return self->_isAutomationSuggestion;
}

- (void)setIsAutomationSuggestion:(BOOL)a3
{
  self->_isAutomationSuggestion = a3;
}

- (NSString)automationTrialID
{
  return self->_automationTrialID;
}

- (void)setAutomationTrialID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)listenerEndpoints
{
  return self->_listenerEndpoints;
}

- (void)setListenerEndpoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (void)setOutputBehavior:(unint64_t)a3
{
  self->_outputBehavior = a3;
}

- (BOOL)acquiresAssertionWhileRunning
{
  return self->_acquiresAssertionWhileRunning;
}

- (void)setAcquiresAssertionWhileRunning:(BOOL)a3
{
  self->_acquiresAssertionWhileRunning = a3;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (BOOL)isStepping
{
  return self->_stepping;
}

- (void)setStepping:(BOOL)a3
{
  self->_stepping = a3;
}

- (BOOL)resumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (NSProgress)currentActionProgress
{
  return self->_currentActionProgress;
}

- (NSMutableDictionary)actionOutputsByWorkflowIndex
{
  return self->_actionOutputsByWorkflowIndex;
}

- (void)setActionOutputsByWorkflowIndex:(id)a3
{
  objc_storeStrong((id *)&self->_actionOutputsByWorkflowIndex, a3);
}

- (void)setVariableTable:(id)a3
{
  objc_storeStrong((id *)&self->_variableTable, a3);
}

- (void)setEnvironmentValueTable:(id)a3
{
  objc_storeStrong((id *)&self->_environmentValueTable, a3);
}

- (WFWorkflowControllerState)pendingState
{
  return self->_pendingState;
}

- (void)setPendingState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingState, a3);
}

- (NSDictionary)pendingProcessedParameters
{
  return self->_pendingProcessedParameters;
}

- (void)setPendingProcessedParameters:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProcessedParameters, a3);
}

- (WFContentCollection)pendingActionInput
{
  return self->_pendingActionInput;
}

- (void)setPendingActionInput:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActionInput, a3);
}

- (RBSAssertion)workflowRunAssertion
{
  return self->_workflowRunAssertion;
}

- (void)setWorkflowRunAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_workflowRunAssertion, a3);
}

- (OS_voucher)executionVoucher
{
  return self->_executionVoucher;
}

- (void)setExecutionVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_executionVoucher, a3);
}

- (WFOutOfProcessWorkflowController)outOfProcessController
{
  return self->_outOfProcessController;
}

- (void)setOutOfProcessController:(id)a3
{
  objc_storeStrong((id *)&self->_outOfProcessController, a3);
}

- (void)setFlowTracker:(id)a3
{
  objc_storeStrong((id *)&self->_flowTracker, a3);
}

- (void)setContentItemCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemCache, a3);
}

- (void)setCapturedFiles:(id)a3
{
  objc_storeStrong((id *)&self->_capturedFiles, a3);
}

- (void)setExfiltrationLogger:(id)a3
{
  objc_storeStrong((id *)&self->_exfiltrationLogger, a3);
}

- (BOOL)actionDidRunRemotely
{
  return self->_actionDidRunRemotely;
}

- (void)setActionDidRunRemotely:(BOOL)a3
{
  self->_actionDidRunRemotely = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exfiltrationLogger, 0);
  objc_storeStrong((id *)&self->_capturedFiles, 0);
  objc_storeStrong((id *)&self->_contentItemCache, 0);
  objc_storeStrong((id *)&self->_flowTracker, 0);
  objc_storeStrong((id *)&self->_outOfProcessController, 0);
  objc_storeStrong((id *)&self->_executionVoucher, 0);
  objc_storeStrong((id *)&self->_workflowRunAssertion, 0);
  objc_storeStrong((id *)&self->_pendingActionInput, 0);
  objc_storeStrong((id *)&self->_pendingProcessedParameters, 0);
  objc_storeStrong((id *)&self->_pendingState, 0);
  objc_storeStrong((id *)&self->_environmentValueTable, 0);
  objc_storeStrong((id *)&self->_variableTable, 0);
  objc_storeStrong((id *)&self->_actionOutputsByWorkflowIndex, 0);
  objc_storeStrong((id *)&self->_currentActionProgress, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_listenerEndpoints, 0);
  objc_storeStrong((id *)&self->_automationTrialID, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastExecutedAction, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

void __75__WFWorkflowController_noInputBehavior_wantsToRunAction_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "executionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", 0, v5, v3, 0, v4, *(_QWORD *)(a1 + 48));

}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noInputBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noInputBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_2;
    v8[3] = &unk_1E7AF6F98;
    v7 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    objc_msgSend(v5, "resolveWithUserInterface:runningDelegate:completionHandler:", v6, v9, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_5;
    v9[3] = &unk_1E7AEFEE8;
    v4 = *(_QWORD *)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v3, "generateCollectionByCoercingToItemClasses:completionHandler:", v4, v9);

    v5 = v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "executionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_7;
    v7[3] = &unk_1E7AF8F48;
    v8 = *(id *)(a1 + 56);
    dispatch_async(v6, v7);

    v5 = v8;
  }

}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_5(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "executionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_6;
  block[3] = &unk_1E7AEFEC0;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_6(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfItems"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_3;
  block[3] = &unk_1E7AF8378;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __37__WFWorkflowController_setUpProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFWorkflowExecutionLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[WFWorkflowController setUpProgress]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEFAULT, "%s Stopping from progress cancellation", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "stop");
}

void __54__WFWorkflowController_restorePendingStateIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "variableTable");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workflowController:actionDidRequestWorkflowExit:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_3;
  v11[3] = &unk_1E7AF9450;
  v11[4] = v3;
  v12 = *(id *)(a1 + 64);
  LOBYTE(v3) = objc_msgSend(v2, "workflowController:handleUnsupportedUserInterfaceForAction:currentState:completionHandler:", v3, v4, v5, v11);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "executionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_5;
    v8[3] = &unk_1E7AF76F0;
    v10 = *(id *)(a1 + 64);
    v9 = *(id *)(a1 + 56);
    dispatch_async(v7, v8);

  }
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_7;
  v11[3] = &unk_1E7AF9A98;
  v11[4] = v4;
  v12 = v3;
  v13 = *(id *)(a1 + 64);
  LOBYTE(v4) = objc_msgSend(v2, "workflowController:handleUnsupportedEnvironmentForAction:currentState:completionHandler:", v4, v12, v6, v11);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "executionQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_9;
    block[3] = &unk_1E7AF76F0;
    v10 = *(id *)(a1 + 64);
    v9 = *(id *)(a1 + 56);
    dispatch_async(v7, block);

  }
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "executionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_8;
  block[3] = &unk_1E7AF5EF8;
  v12 = a1[5];
  v13 = v5;
  v14 = a1[4];
  v8 = a1[6];
  v15 = v6;
  v16 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setOutput:onVariableSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_4;
  v7[3] = &unk_1E7AF76F0;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_2;
    v14[3] = &unk_1E7AF76F0;
    v14[4] = v5;
    v7 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v4, "workflowController:didRunAction:error:completionHandler:", v5, v6, v7, v14);

    v8 = v15;
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "workflowController:didRunAction:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "executionQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_4;
    block[3] = &unk_1E7AF8F48;
    v13 = *(id *)(a1 + 56);
    dispatch_async(v11, block);

    v8 = v13;
  }

}

void __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_3;
  block[3] = &unk_1E7AF8F48;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke_2;
  v11[3] = &unk_1E7AF8F70;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "executionVoucher");
  objc_claimAutoreleasedReturnValue();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2;
  v6[3] = &unk_1E7AF76F0;
  v6[4] = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "workflowController:prepareToRunAction:withInput:completionHandler:", v3, v4, v5, v6);

}

void __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

}

void __60__WFWorkflowController_didFinishRunningWithError_cancelled___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workflowController:didFinishRunningWithError:cancelled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  }
}

void __50__WFWorkflowController_workflowControllerWillRun___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workflowControllerWillRun:", *(_QWORD *)(a1 + 32));

  }
}

id __73__WFWorkflowController_requestAccessToFileAtLocations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v2 + 40);
  objc_msgSend(a2, "resolveLocationWithError:", &obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

uint64_t __29__WFWorkflowController_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_reset");
}

uint64_t __28__WFWorkflowController_step__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_step");
}

uint64_t __38__WFWorkflowController_stopWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__WFWorkflowController_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopWithError:", 0);
}

void __28__WFWorkflowController__run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    if (objc_msgSend(v5, "wf_isUserCancelledError"))
      v7 = 0;
    else
      v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "didFinishRunningWithError:cancelled:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setInput:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_step");
  }

}

uint64_t __27__WFWorkflowController_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

void __45__WFWorkflowController__finishStepWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setExtendedOperation:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __45__WFWorkflowController__finishStepWithError___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setFinishedRunningWithSuccess:", 1);
  objc_msgSend(*(id *)(a1 + 32), "didFinishRunningWithError:cancelled:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unpublish");

  return objc_msgSend(*(id *)(a1 + 32), "setProgress:", 0);
}

void __29__WFWorkflowController__step__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  _UNKNOWN **v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  _UNKNOWN **v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;

  v1 = a1;
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(*(id *)(v1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &off_1E7AC3000;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(*(id *)(v1 + 40), "mode")
     || (objc_msgSend(*(id *)(v1 + 40), "progress"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v5,
         v5)))
  {
    v6 = 0;
LABEL_5:

    v3 = (void *)v6;
  }
  else
  {
    v7 = objc_msgSend(*(id *)(v1 + 32), "currentIndex");
    if (v7 - 1 >= 0)
    {
      v8 = v7;
      v36 = v3;
      do
      {
        --v8;
        objc_msgSend(*(id *)(v1 + 32), "workflow");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "actions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "groupedOpenAction");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "groupedCloseAction");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 32), "workflow");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "actions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "indexOfObject:", v12);
          if (v16 >= objc_msgSend(*(id *)(v1 + 32), "currentIndex"))
          {

          }
          else
          {
            objc_msgSend(*(id *)(v1 + 32), "workflow");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "actions");
            v18 = v4;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v19, "indexOfObject:", v13);
            v38 = v13;
            v20 = v1;
            v21 = objc_msgSend(*(id *)(v1 + 32), "currentIndex");

            v4 = v18;
            v22 = v37 > v21;
            v1 = v20;
            v13 = v38;
            if (v22)
            {
              objc_msgSend(v12, "progress");
              v6 = objc_claimAutoreleasedReturnValue();

              v3 = v11;
              goto LABEL_5;
            }
          }

        }
      }
      while (v8 > 0);
      v3 = v36;
    }
  }
  if (!objc_msgSend(*(id *)(v1 + 40), "hasChildren")
    || (objc_msgSend(*(id *)(v1 + 40), "progress"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 40), "setProgress:", v24);

  }
  objc_msgSend(*(id *)(v1 + 40), "progress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(*(id *)(v1 + 40), "progress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addChild:withPendingUnitCount:", v26, 1);

    objc_msgSend(*(id *)(v1 + 40), "progress");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "setCurrentActionProgress:", v27);

  }
  if (objc_msgSend(*(id *)(v1 + 32), "resumed"))
  {
    objc_msgSend(*(id *)(v1 + 40), "progress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUserInfoObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("WFActionDidResume"));

  }
  objc_msgSend(*(id *)(v1 + 40), "setDidRunRemotely:", 0);
  objc_msgSend(*(id *)(v1 + 32), "logStartActionEventWithAction:", *(_QWORD *)(v1 + 40));
  v29 = *(id *)(v1 + 40);
  if (v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  objc_msgSend(*(id *)(v1 + 32), "flowTracker");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setControlFlowTracker:", v32);

  v34 = *(void **)(v1 + 32);
  v33 = *(void **)(v1 + 40);
  v35 = *(_QWORD *)(v1 + 48);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __29__WFWorkflowController__step__block_invoke_2;
  v39[3] = &unk_1E7AEFE10;
  v39[4] = v34;
  v40 = v33;
  objc_msgSend(v34, "runAction:withInput:completionHandler:", v40, v35, v39);

}

void __29__WFWorkflowController__step__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  char v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "executionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorByAddingActionIndex:toError:", objc_msgSend(*(id *)(a1 + 32), "currentIndex"), v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WFActionErrorDomain")) & 1) != 0)
      {
        v8 = objc_msgSend(v6, "code");

        if (!v8)
        {
          v9 = 1;
          goto LABEL_8;
        }
      }
      else
      {

      }
      v19 = *(void **)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __29__WFWorkflowController__step__block_invoke_3;
      v26[3] = &unk_1E7AEFDC0;
      v20 = v18;
      v21 = *(_QWORD *)(a1 + 32);
      v27 = v20;
      v28 = v21;
      objc_msgSend(v19, "handleError:fromAction:completionHandler:", v6, v20, v26);
      v17 = v27;
      goto LABEL_16;
    }
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v6 = 0;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "setStepping:", 0);
  if (_os_feature_enabled_impl() && objc_msgSend(*(id *)(a1 + 32), "outputBehavior") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionOutputsByWorkflowIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 32), "setActionOutputsByWorkflowIndex:", v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "output");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionOutputsByWorkflowIndex");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "currentIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIndex:", objc_msgSend(*(id *)(a1 + 32), "currentIndex") + 1);
  v16 = *(void **)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __29__WFWorkflowController__step__block_invoke_5;
  v22[3] = &unk_1E7AEFDE8;
  v25 = v9;
  v22[4] = v16;
  v23 = v15;
  v6 = v6;
  v24 = v6;
  objc_msgSend(v16, "didRunAction:error:withCompletion:", v23, 0, v22);

  v17 = v23;
LABEL_16:

}

void __29__WFWorkflowController__step__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFRunShortcutErrorEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v3 = a2;
  if (!v3)
  {
    v9 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "setStepping:", 0);
    goto LABEL_5;
  }
  v4 = objc_alloc_init(WFRunShortcutErrorEvent);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunShortcutErrorEvent setErrorCode:](v4, "setErrorCode:", v6);

  objc_msgSend(v3, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunShortcutErrorEvent setErrorDomain:](v4, "setErrorDomain:", v7);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunShortcutErrorEvent setActionIdentifier:](v4, "setActionIdentifier:", v8);

  -[WFRunShortcutErrorEvent setDidRunRemotely:](v4, "setDidRunRemotely:", objc_msgSend(*(id *)(a1 + 32), "didRunRemotely"));
  v9 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "runSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunShortcutErrorEvent setRunSource:](v4, "setRunSource:", v10);

  objc_msgSend(*(id *)(a1 + 40), "automationType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRunShortcutErrorEvent setAutomationType:](v4, "setAutomationType:", v11);

  -[WFEvent track](v4, "track");
  objc_msgSend(*(id *)(a1 + 40), "setStepping:", 0);
  if (objc_msgSend(*(id *)(a1 + 40), "runningAsStepWiseExecutor"))
LABEL_5:
    objc_msgSend(*v9, "setCurrentIndex:", objc_msgSend(*v9, "currentIndex") + 1);
  v12 = objc_msgSend(v3, "wf_isSiriPunchOutError");
  v13 = *v9;
  if (v12)
  {
    objc_msgSend(*v9, "_step");
  }
  else
  {
    v14 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __29__WFWorkflowController__step__block_invoke_4;
    v17[3] = &unk_1E7AF55D0;
    v18 = v14;
    v15 = v3;
    v16 = *(_QWORD *)(a1 + 40);
    v19 = v15;
    v20 = v16;
    objc_msgSend(v13, "didRunAction:error:withCompletion:", v18, v15, v17);

  }
}

uint64_t __29__WFWorkflowController__step__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "actionsGroupedWithAction:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentIndex:", objc_msgSend(v6, "indexOfObject:", v4) + 1);

  }
  if ((objc_msgSend(*(id *)(a1 + 40), "hasChildren") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 48), "wf_isUserCancelledError") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "totalUnitCount");
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompletedUnitCount:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "logFinishActionEventWithAction:completed:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) == 0);
  objc_msgSend(*(id *)(a1 + 32), "handleControlFlowActionCompletion:actionGroupSkipped:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_finishStepWithError:", 0);
}

uint64_t __29__WFWorkflowController__step__block_invoke_4(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if ((objc_msgSend(a1[4], "hasChildren") & 1) == 0 && (objc_msgSend(a1[5], "wf_isUserCancelledError") & 1) == 0)
  {
    objc_msgSend(a1[4], "progress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "totalUnitCount");
    objc_msgSend(a1[4], "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCompletedUnitCount:", v3);

  }
  objc_msgSend(a1[6], "logFinishActionEventWithAction:completed:error:", a1[4], a1[5] == 0);
  return objc_msgSend(a1[6], "_finishStepWithError:", a1[5]);
}

id __71__WFWorkflowController_stateWithActionIndex_input_processedParameters___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "resourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_131_24305);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __71__WFWorkflowController_stateWithActionIndex_input_processedParameters___block_invoke_2()
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

uint64_t __36__WFWorkflowController_setWorkflow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setWorkflow:", *(_QWORD *)(a1 + 40));
}

@end
