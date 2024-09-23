@implementation WFLibraryRunCoordinator

- (WFWorkflowReference)runningWorkflow
{
  return self->_runningWorkflow;
}

- (WFExecutableAppShortcut)runningAppShortcut
{
  return self->_runningAppShortcut;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFLibraryRunCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (WFLibraryRunCoordinator)initWithSource:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  WFLibraryRunCoordinator *v9;
  uint64_t v10;
  NSString *source;
  uint64_t v12;
  NSHashTable *observers;
  WFLibraryRunCoordinator *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLibraryRunCoordinator.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFLibraryRunCoordinator;
  v9 = -[WFLibraryRunCoordinator init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    source = v9->_source;
    v9->_source = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v12;

    objc_storeStrong((id *)&v9->_database, a4);
    v14 = v9;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setRunningWorkflowProgress:(id)a3
{
  NSProgress *v4;
  NSProgress *runningWorkflowProgress;
  void *v6;
  NSProgress *v7;
  NSProgress *v8;
  NSProgress *v9;
  id v10;

  v4 = (NSProgress *)a3;
  -[NSProgress removeObserver:forKeyPath:context:](self->_runningWorkflowProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), WFWorkflowControllerProgressContext);
  runningWorkflowProgress = self->_runningWorkflowProgress;
  WFNSProgressCreateUserInfoKeyPathForKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSProgress removeObserver:forKeyPath:context:](runningWorkflowProgress, "removeObserver:forKeyPath:context:", self, v6, WFWorkflowControllerRunningStateContext);

  v7 = self->_runningWorkflowProgress;
  self->_runningWorkflowProgress = v4;
  v8 = v4;

  -[NSProgress addObserver:forKeyPath:options:context:](self->_runningWorkflowProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 4, WFWorkflowControllerProgressContext);
  v9 = self->_runningWorkflowProgress;
  WFNSProgressCreateUserInfoKeyPathForKey();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSProgress addObserver:forKeyPath:options:context:](v9, "addObserver:forKeyPath:options:context:", self, v10, 4, WFWorkflowControllerRunningStateContext);

}

- (void)dealloc
{
  WFShortcutsAppRunnerClient *workflowRunnerClient;
  void *v4;
  objc_super v5;

  -[WFShortcutsAppRunnerClient removeObserver:forKeyPath:context:](self->_workflowRunnerClient, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), WFWorkflowControllerProgressContext);
  workflowRunnerClient = self->_workflowRunnerClient;
  WFNSProgressCreateUserInfoKeyPathForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShortcutsAppRunnerClient removeObserver:forKeyPath:context:](workflowRunnerClient, "removeObserver:forKeyPath:context:", self, v4, WFWorkflowControllerRunningStateContext);

  v5.receiver = self;
  v5.super_class = (Class)WFLibraryRunCoordinator;
  -[WFLibraryRunCoordinator dealloc](&v5, sel_dealloc);
}

- (void)resumeWorkflowReference:(id)a3 fromSource:(id)a4 withState:(id)a5
{
  -[WFLibraryRunCoordinator openWorkflowReferenceAndRun:fromSource:withInput:state:requestOutput:runViewSource:completionHandler:](self, "openWorkflowReferenceAndRun:fromSource:withInput:state:requestOutput:runViewSource:completionHandler:", a3, a4, 0, a5, 0, 0, 0);
}

- (void)runWorkflowReference:(id)a3 fromSource:(id)a4 withInput:(id)a5 requestOutput:(BOOL)a6 runViewSource:(id)a7 completionHandler:(id)a8
{
  -[WFLibraryRunCoordinator openWorkflowReferenceAndRun:fromSource:withInput:state:requestOutput:runViewSource:completionHandler:](self, "openWorkflowReferenceAndRun:fromSource:withInput:state:requestOutput:runViewSource:completionHandler:", a3, a4, a5, 0, a6, a7, a8);
}

- (void)runAppShortcut:(id)a3 withLNAction:(id)a4 andMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stop");

  v12 = objc_alloc(MEMORY[0x24BE5FCB0]);
  objc_msgSend(v10, "underlyingAutoShortcut");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "underlyingAutoShortcut");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v12, "initWithActionIdentifier:bundleIdentifier:", v14, v16);

  -[WFLibraryRunCoordinator setRunningAppShortcut:](self, "setRunningAppShortcut:", v10);
  v17 = objc_alloc(MEMORY[0x24BEC4058]);
  objc_msgSend(v10, "triggerPhrase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v17, "initWithIdentifier:name:action:metadata:runSource:remoteDialogPresenterEndpoint:", v22, v18, v9, v8, *MEMORY[0x24BEC1CF0], 0);
  -[WFLibraryRunCoordinator setWorkflowRunnerClient:](self, "setWorkflowRunnerClient:", v19);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "start");

}

- (void)runContextualAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stop");

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4058]), "initWithContextualAction:", v4);
  -[WFLibraryRunCoordinator setWorkflowRunnerClient:](self, "setWorkflowRunnerClient:", v6);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "start");

}

- (void)openWorkflowReferenceAndRun:(id)a3 fromSource:(id)a4 withInput:(id)a5 state:(id)a6 requestOutput:(BOOL)a7 runViewSource:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v10 = a7;
  v26 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  if (!v15)
  {
    -[WFLibraryRunCoordinator source](self, "source");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[WFLibraryRunCoordinator setCompletionHandler:](self, "setCompletionHandler:", v19);
  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stop");

  -[WFLibraryRunCoordinator setRunningWorkflow:](self, "setRunningWorkflow:", v26);
  -[WFLibraryRunCoordinator setRunViewSource:](self, "setRunViewSource:", v18);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4058]), "initWithWorkflow:state:runSource:input:remoteDialogPresenterEndpoint:requestOutput:", v26, v17, v15, v16, 0, v10);
  -[WFLibraryRunCoordinator setWorkflowRunnerClient:](self, "setWorkflowRunnerClient:", v21);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelegate:", self);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "runRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRunViewSource:", v18);

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "start");

}

- (void)stop
{
  id v2;

  -[WFLibraryRunCoordinator workflowRunnerClient](self, "workflowRunnerClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (id)view
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFLibraryRunCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLibraryRunCoordinator runningWorkflow](self, "runningWorkflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runCoordinator:userInterfaceForWorkflow:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInterfaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE19950]);

  if ((_DWORD)v4)
  {
    WFViewControllerFromUserInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];
  objc_super v8;

  if ((void *)WFWorkflowControllerProgressContext == a6 || WFWorkflowControllerRunningStateContext == (_QWORD)a6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__WFLibraryRunCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24E604D88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFLibraryRunCoordinator;
    -[WFLibraryRunCoordinator observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)didFinishRunningWorkflow:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  WFShortcutsAppRunnerClient *workflowRunnerClient;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFLibraryRunCoordinator observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "runCoordinator:didFinishRunningWorkflow:withError:", self, v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  workflowRunnerClient = self->_workflowRunnerClient;
  self->_workflowRunnerClient = 0;

  -[WFLibraryRunCoordinator setRunningWorkflowProgress:](self, "setRunningWorkflowProgress:", 0);
}

- (void)updateProgress:(double)a3 waiting:(BOOL)a4 cancelled:(BOOL)a5 forWorkflow:(id)a6
{
  _BOOL8 v6;
  id v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v17 = a5;
  v6 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  *(float *)&v10 = a3;
  -[WFLibraryRunCoordinator setProgress:](self, "setProgress:", v10);
  -[WFLibraryRunCoordinator setWaiting:](self, "setWaiting:", v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFLibraryRunCoordinator observers](self, "observers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "runCoordinator:didChangeRunningStateWithProgress:waiting:forWorkflow:", self, v6, v9, a3);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "runCoordinator:didChangeRunningStateWithProgress:waiting:cancelled:forWorkflow:", self, v6, v17, v9, a3);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFLibraryRunCoordinator observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)accessibilityAnnounce:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFLibraryRunCoordinator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFLibraryRunCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runCoordinator:accessibilityAnnounce:", self, v7);

  }
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  void *v5;
  id v6;

  -[WFLibraryRunCoordinator setRunningWorkflowProgress:](self, "setRunningWorkflowProgress:", a4);
  -[WFLibraryRunCoordinator runningWorkflow](self, "runningWorkflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLibraryRunCoordinator updateProgress:waiting:cancelled:forWorkflow:](self, "updateProgress:waiting:cancelled:forWorkflow:", 0, 0, v5, 0.0);

  WFLocalizedString(CFSTR("Running shortcut"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLibraryRunCoordinator accessibilityAnnounce:](self, "accessibilityAnnounce:", v6);

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  WFLibraryRunCoordinator *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  WFLibraryRunCoordinator *v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[3];

  v6 = a6;
  v57[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WFLibraryRunCoordinator runningWorkflow](self, "runningWorkflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v12 = 1;
  else
    v12 = v6;
  if (v12)
    v13 = -1.0;
  else
    v13 = 1.0;
  -[WFLibraryRunCoordinator runningWorkflow](self, "runningWorkflow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLibraryRunCoordinator updateProgress:waiting:cancelled:forWorkflow:](self, "updateProgress:waiting:cancelled:forWorkflow:", 0, v6, v14, v13);

  -[WFLibraryRunCoordinator progress](self, "progress");
  if (v15 != -1.0)
  {
    -[WFLibraryRunCoordinator runningWorkflow](self, "runningWorkflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLibraryRunCoordinator updateProgress:waiting:cancelled:forWorkflow:](self, "updateProgress:waiting:cancelled:forWorkflow:", 0, 0, v16, -1.0);

  }
  -[WFLibraryRunCoordinator setRunningWorkflow:](self, "setRunningWorkflow:", 0);
  -[WFLibraryRunCoordinator setRunViewSource:](self, "setRunViewSource:", 0);
  -[WFLibraryRunCoordinator runningAppShortcut](self, "runningAppShortcut");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLibraryRunCoordinator setRunningAppShortcut:](self, "setRunningAppShortcut:", 0);
  objc_msgSend(v10, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BEC47A8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;

  if (v10)
  {
    if (WFErrorIsRemoteQuarantineDenialError())
    {
      v50 = MEMORY[0x24BDAC760];
      v51 = 3221225472;
      v52 = __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
      v53 = &unk_24E604E80;
      v54 = self;
      v55 = v11;
      WFAddRecoveryOptionsToRemoteQuarantineDenialError();
      v22 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v22;
    }
    else if (v21)
    {
      -[WFLibraryRunCoordinator delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v10, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "mutableCopy");

        WFLocalizedString(CFSTR("Show"));
        v27 = objc_claimAutoreleasedReturnValue();
        WFLocalizedString(CFSTR("OK"));
        v28 = objc_claimAutoreleasedReturnValue();
        v44 = (void *)v27;
        v45 = (void *)v28;
        v43 = v17;
        if (v17)
        {
          v57[0] = v28;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = &unk_24E6312C0;
        }
        else
        {
          v56[0] = v27;
          v56[1] = v28;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = &unk_24E6312D8;
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDD0FE8]);

        objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE198E0]);
        v31 = objc_alloc(MEMORY[0x24BE193C0]);
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_150;
        v46[3] = &unk_24E603E90;
        v47 = v11;
        v48 = self;
        v49 = v21;
        v32 = (void *)objc_msgSend(v31, "initWithHandlerBlock:", v46);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BDD11D0]);
        v33 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v10, "domain");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, objc_msgSend(v10, "code"), v26);
        v35 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v35;
        v17 = v43;
      }
    }
  }
  -[WFLibraryRunCoordinator completionHandler](self, "completionHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[WFLibraryRunCoordinator completionHandler](self, "completionHandler");
    v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8, id))v37)[2](v37, v9, v6, v10);

    -[WFLibraryRunCoordinator setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLibraryRunCoordinator didFinishRunningWorkflow:withError:](self, "didFinishRunningWorkflow:withError:", v11, v38);

    if (v10)
    {
      v39 = CFSTR("Shortcut stopped");
LABEL_32:
      WFLocalizedString(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLibraryRunCoordinator accessibilityAnnounce:](self, "accessibilityAnnounce:", v41);
      goto LABEL_33;
    }
LABEL_31:
    v39 = CFSTR("Shortcut finished");
    goto LABEL_32;
  }
  -[WFLibraryRunCoordinator didFinishRunningWorkflow:withError:](self, "didFinishRunningWorkflow:withError:", v11, v10);
  if (!v10)
    goto LABEL_31;
  if (!v36)
  {
    -[WFLibraryRunCoordinator delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "runCoordinator:userInterfaceForWorkflow:", self, v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE19370], "alertWithError:", v10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "presentAlert:", v42);

LABEL_33:
  }

}

- (WFLibraryRunCoordinatorDelegate)delegate
{
  return (WFLibraryRunCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (void)setRunningWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_runningWorkflow, a3);
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_runViewSource, a3);
}

- (void)setRunningAppShortcut:(id)a3
{
  objc_storeStrong((id *)&self->_runningAppShortcut, a3);
}

- (NSString)source
{
  return self->_source;
}

- (WFShortcutsAppRunnerClient)workflowRunnerClient
{
  return self->_workflowRunnerClient;
}

- (void)setWorkflowRunnerClient:(id)a3
{
  objc_storeStrong((id *)&self->_workflowRunnerClient, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (WFAction)currentlyRunningAction
{
  return self->_currentlyRunningAction;
}

- (void)setCurrentlyRunningAction:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyRunningAction, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (WFWorkflowRunEvent)runEvent
{
  return self->_runEvent;
}

- (void)setRunEvent:(id)a3
{
  objc_storeStrong((id *)&self->_runEvent, a3);
}

- (WFDialogTransformer)dialogTransformer
{
  return self->_dialogTransformer;
}

- (void)setDialogTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_dialogTransformer, a3);
}

- (NSProgress)runningWorkflowProgress
{
  return self->_runningWorkflowProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningWorkflowProgress, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_runEvent, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentlyRunningAction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_runningAppShortcut, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runningWorkflow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteReference:error:", *(_QWORD *)(a1 + 40), 0);

}

void __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_150(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = a4;
  v10 = a5;
  if (!a3 && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(*(id *)(a1 + 48), "integerValue");
    objc_msgSend(v16, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "runCoordinator:openWorkflow:scrolledToActionIndex:message:", v12, v13, v14, v15);

  }
  if (v10)
    v10[2](v10, 1, 0);

}

void __74__WFLibraryRunCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "workflowRunnerClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "runningWorkflowProgress");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "runningWorkflowProgress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEC1CD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "runningWorkflowProgress");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fractionCompleted");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "runningWorkflow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateProgress:waiting:cancelled:forWorkflow:", v6 == 2, 0, v10, v9);

  }
}

@end
