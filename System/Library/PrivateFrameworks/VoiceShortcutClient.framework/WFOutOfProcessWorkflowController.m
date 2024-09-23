@implementation WFOutOfProcessWorkflowController

- (WFOutOfProcessWorkflowController)initWithEnvironment:(int64_t)a3 runningContext:(id)a4 presentationMode:(int64_t)a5
{
  return -[WFOutOfProcessWorkflowController initWithEnvironment:runningContext:presentationMode:existingConnection:](self, "initWithEnvironment:runningContext:presentationMode:existingConnection:", a3, a4, a5, 0);
}

- (WFOutOfProcessWorkflowController)initWithEnvironment:(int64_t)a3 runningContext:(id)a4 presentationMode:(int64_t)a5 existingConnection:(id)a6
{
  id v10;
  id v11;
  WFOutOfProcessWorkflowController *v12;
  WFOutOfProcessWorkflowController *v13;
  WFWorkflowRunningContext *v14;
  WFWorkflowRunningContext *runningContext;
  WFSandboxExtensionManager *v16;
  WFSandboxExtensionManager *sandboxExtensionManager;
  WFOutOfProcessWorkflowControllerStateMachine *v18;
  WFOutOfProcessWorkflowControllerStateMachine *stateMachine;
  WFOutOfProcessWorkflowControllerStateMachine *v20;
  WFOutOfProcessWorkflowController *v21;
  objc_super v23;

  v10 = a4;
  v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WFOutOfProcessWorkflowController;
  v12 = -[WFOutOfProcessWorkflowController init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_environment = a3;
    if (v10)
      v14 = (WFWorkflowRunningContext *)v10;
    else
      v14 = -[WFWorkflowRunningContext initWithWorkflowIdentifier:]([WFWorkflowRunningContext alloc], "initWithWorkflowIdentifier:", 0);
    runningContext = v13->_runningContext;
    v13->_runningContext = v14;

    v13->_presentationMode = a5;
    v16 = objc_alloc_init(WFSandboxExtensionManager);
    sandboxExtensionManager = v13->_sandboxExtensionManager;
    v13->_sandboxExtensionManager = v16;

    objc_storeStrong((id *)&v13->_serviceConnection, a6);
    v13->_serviceConnectionLock._os_unfair_lock_opaque = 0;
    v18 = objc_alloc_init(WFOutOfProcessWorkflowControllerStateMachine);
    -[WFOutOfProcessWorkflowControllerStateMachine setDelegate:](v18, "setDelegate:", v13);
    stateMachine = v13->_stateMachine;
    v13->_stateMachine = v18;
    v20 = v18;

    -[WFOutOfProcessWorkflowControllerStateMachine idleStateWithReason:](v20, "idleStateWithReason:", CFSTR("initialized"));
    v21 = v13;
  }

  return v13;
}

- (void)reset
{
  -[WFOutOfProcessWorkflowController setCurrentWorkflow:](self, "setCurrentWorkflow:", 0);
  -[WFOutOfProcessWorkflowController setCurrentDialogAttribution:](self, "setCurrentDialogAttribution:", 0);
}

- (BOOL)runWorkflowWithDescriptor:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  int64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("incoming run request: %@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handlingRequestWithReason:", v11);

  objc_msgSend(v9, "automationType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutomationType:", v12);

  -[WFOutOfProcessWorkflowController setRunRequest:](self, "setRunRequest:", v9);
  -[WFOutOfProcessWorkflowController setRunDescriptor:](self, "setRunDescriptor:", v8);
  v14 = objc_msgSend(v9, "presentationMode");
  -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPresentationMode:", v14);

  v16 = os_log_create("com.apple.shortcuts", "SystemSignpostIntervals");
  -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v19, "RunnerRunRequest", ", buf, 2u);
  }

  getWFVoiceShortcutClientLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = -[WFOutOfProcessWorkflowController environment](self, "environment");
    *(_DWORD *)buf = 136315650;
    v33 = "-[WFOutOfProcessWorkflowController runWorkflowWithDescriptor:request:error:]";
    v34 = 2114;
    v35 = v9;
    v36 = 2048;
    v37 = v21;
    _os_log_impl(&dword_1AF681000, v20, OS_LOG_TYPE_DEFAULT, "%s Getting runner to run workflow with request: (%{public}@), environment (%ld)", buf, 0x20u);
  }

  v31 = 0;
  -[WFOutOfProcessWorkflowController asynchronousRunnerWithError:reason:](self, "asynchronousRunnerWithError:reason:", &v31, CFSTR("incoming run request"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v31;
  if (v22)
  {
    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "startRunningShortcutWithReason:", CFSTR("run workflow"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WFOutOfProcessWorkflowController environment](self, "environment"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__WFOutOfProcessWorkflowController_runWorkflowWithDescriptor_request_error___block_invoke;
    v30[3] = &unk_1E5FC4798;
    v30[4] = self;
    objc_msgSend(v22, "runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:", v8, v9, v25, v26, v30);

    objc_storeStrong((id *)&self->_runner, v22);
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFOutOfProcessWorkflowController runWorkflowWithDescriptor:request:error:]";
      v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_1AF681000, v27, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v23);
    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "exitWithReason:", CFSTR("unable to get runner to run workflow"));

  }
  return v22 != 0;
}

- (BOOL)runActionWithRunRequestData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handlingRequestWithReason:", CFSTR("incoming remote execution request"));

  v17 = 0;
  -[WFOutOfProcessWorkflowController asynchronousRunnerWithError:reason:](self, "asynchronousRunnerWithError:reason:", &v17, CFSTR("incoming remote execution request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[WFOutOfProcessWorkflowController runActionWithRunRequestData:error:]";
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting run for remote execution request", buf, 0xCu);
    }

    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startRunningShortcutWithReason:", CFSTR("incoming remote execution request"));

    -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__WFOutOfProcessWorkflowController_runActionWithRunRequestData_error___block_invoke;
    v16[3] = &unk_1E5FC4798;
    v16[4] = self;
    objc_msgSend(v8, "runActionFromRunRequestData:runningContext:completion:", v6, v13, v16);

    objc_storeStrong((id *)&self->_runner, v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFOutOfProcessWorkflowController runActionWithRunRequestData:error:]";
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v9);
    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exitWithReason:", CFSTR("unable to get runner to run remote execution request"));

  }
  return v8 != 0;
}

- (BOOL)resumeRunningWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("resuming run with request: %@, context: %@"), v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handlingRequestWithReason:", v10);

  v23 = 0;
  -[WFOutOfProcessWorkflowController asynchronousRunnerWithError:reason:](self, "asynchronousRunnerWithError:reason:", &v23, CFSTR("incoming resume request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (v11)
  {
    v13 = objc_msgSend(v6, "presentationMode");
    -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPresentationMode:", v13);

    getWFVoiceShortcutClientLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFOutOfProcessWorkflowController resumeRunningWithRequest:error:]";
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1AF681000, v15, OS_LOG_TYPE_DEFAULT, "%s Resuming a run for context: %@", buf, 0x16u);

    }
    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startRunningShortcutWithReason:", CFSTR("resume shortcut request"));

    -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__WFOutOfProcessWorkflowController_resumeRunningWithRequest_error___block_invoke;
    v22[3] = &unk_1E5FC4798;
    v22[4] = self;
    objc_msgSend(v11, "resumeRunningFromContext:withRequest:completion:", v18, v6, v22);

    objc_storeStrong((id *)&self->_runner, v11);
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[WFOutOfProcessWorkflowController resumeRunningWithRequest:error:]";
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_1AF681000, v19, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);
    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exitWithReason:", CFSTR("unable to get runner to resume running"));

  }
  return v11 != 0;
}

- (void)stop
{
  id v2;

  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopShortcutWithError:reason:", 0, CFSTR("-stop was called"));

}

- (void)updateRunViewSource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRunViewSource:", v4);

}

- (BOOL)isRunning
{
  void *v2;
  char v3;

  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningShortcut");

  return v3;
}

- (void)pauseWorkflowAndWriteStateToDisk
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[WFOutOfProcessWorkflowController pauseWorkflowAndWriteStateToDisk]";
    _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_DEFAULT, "%s Requested pausing run & writing state to disk", (uint8_t *)&v7, 0xCu);
  }

  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseAndWriteShortcutToDiskState");

  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pauseWorkflowAndWriteStateToDisk:", v6);

}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  WFOutOfProcessWorkflowControllerVendor *v13;
  NSObject *runner;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  getWFVoiceShortcutClientLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[WFOutOfProcessWorkflowController handleIncomingFileForRemoteExecutionWithURL:withIdentifier:]";
    v20 = 2112;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_DEFAULT, "%s Handling incoming file for remote execution with URL: %@, identifier: %{public}@", buf, 0x20u);
  }

  if (v7)
  {
    if (v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOutOfProcessWorkflowController.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

    if (v8)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOutOfProcessWorkflowController.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_5:
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFOutOfProcessWorkflowController runner](self, "runner");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:", v7, v8);
  }
  else
  {
    v17 = 0;
    -[WFOutOfProcessWorkflowController asynchronousRunnerWithError:reason:](self, "asynchronousRunnerWithError:reason:", &v17, CFSTR("handling incoming remote execution file"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (v12)
    {
      objc_msgSend(v12, "handleIncomingFileForRemoteExecutionWithURL:withIdentifier:", v7, v8);
      v13 = v12;
      runner = self->_runner;
      self->_runner = v13;
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      runner = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(runner, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[WFOutOfProcessWorkflowController handleIncomingFileForRemoteExecutionWithURL:withIdentifier:]";
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1AF681000, runner, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
      }
    }

  }
}

- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFOutOfProcessWorkflowController runner](self, "runner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getCurrentProgressCompletedWithCompletionHandler:", v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFOutOfProcessWorkflowController runner](self, "runner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFAnySageVariableContent objectWithVariableContent:](WFAnySageVariableContent, "objectWithVariableContent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__WFOutOfProcessWorkflowController_injectContentAsVariable_completionHandler___block_invoke;
    v15[3] = &unk_1E5FC4CA8;
    v16 = v7;
    objc_msgSend(v9, "injectContentAsVariable:completionHandler:", v10, v15);

    v11 = v16;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2FE0];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("You must be running before pushing content into a runtime");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 94, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFOutOfProcessWorkflowController runner](self, "runner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extractVariableContentFromEncodedReference:forEncodedExpectedType:completionHandler:", v8, v9, v10);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("You must be running before pulling content from a runtime");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 94, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

  }
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFOutOfProcessWorkflowController runner](self, "runner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resolveDeferredValueFromEncodedStorage:forEncodedExpectedType:completionHandler:", v8, v9, v10);

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("You must be running before pulling content from a runtime");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 94, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

  }
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFOutOfProcessWorkflowController runner](self, "runner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchToolInvocationSummaryForInvocation:completionHandler:", v6, v7);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2FE0];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("You must be running before pulling content from a runtime");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 94, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);

  }
}

- (void)runToolWithInvocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runToolWithInvocation:", v4);

}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performQuery:inValueSet:toolInvocation:completionHandler:", v13, v12, v11, v10);

}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchDisplayValueForRequest:completionHandler:", v7, v6);

}

- (void)forTestingOnly_simulateXPCInterruption
{
  void *v3;
  id v4;

  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFOutOfProcessWorkflowController currentDialogAttribution](self, "currentDialogAttribution");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleXPCErrorWithDescription:reason:currentDialogAttribution:", CFSTR("simulated XPC interruption"), CFSTR("simulating XPC interruption for testing"), v3);

}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  WFOutOfProcessWorkflowControllerVendor *runner;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemonJobLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siriactionsd"));

  if ((v10 & 1) != 0)
  {
    -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handlingRequestWithReason:", CFSTR("new incoming ToolKit indexing request"));

    v20 = 0;
    -[WFOutOfProcessWorkflowController asynchronousRunnerWithError:reason:](self, "asynchronousRunnerWithError:reason:", &v20, CFSTR("incoming ToolKit indexing request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__WFOutOfProcessWorkflowController_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E5FC8698;
    v18[4] = self;
    v19 = v7;
    v14 = v13;
    objc_msgSend(v12, "reindexToolKitDatabaseWithRequest:completionHandler:", v6, v18);
    runner = self->_runner;
    self->_runner = (WFOutOfProcessWorkflowControllerVendor *)v12;
    v16 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", WFOutOfProcessWorkflowControllerErrorDomain, 5, MEMORY[0x1E0C9AA70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

- (id)asynchronousRunnerWithError:(id *)a3 reason:(id)a4
{
  return -[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:](self, "runnerWithError:synchronous:reason:", a3, 0, a4);
}

- (id)synchronousRunnerWithError:(id *)a3 reason:(id)a4
{
  return -[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:](self, "runnerWithError:synchronous:reason:", a3, 1, a4);
}

- (id)runnerWithError:(id *)a3 synchronous:(BOOL)a4 reason:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  os_unfair_lock_s *p_serviceConnectionLock;
  WFRunnerConnection *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WFRunnerConnection *v14;
  void *v15;
  void *v16;
  id *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _BOOL4 v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id location;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v25 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acquiringRunnerWithReason:", v6);

  getWFVoiceShortcutClientLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:]";
    _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_DEFAULT, "%s Creating new connection", buf, 0xCu);
  }

  p_serviceConnectionLock = &self->_serviceConnectionLock;
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  -[WFOutOfProcessWorkflowController serviceConnection](self, "serviceConnection");
  v10 = (WFRunnerConnection *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_serviceConnectionLock);
  objc_initWeak((id *)buf, v10);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke;
  aBlock[3] = &unk_1E5FC47C0;
  objc_copyWeak(&v33, (id *)buf);
  objc_copyWeak(&v34, &location);
  v12 = _Block_copy(aBlock);
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke_106;
  v29[3] = &unk_1E5FC47C0;
  objc_copyWeak(&v30, (id *)buf);
  objc_copyWeak(&v31, &location);
  v13 = _Block_copy(v29);
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  if (v10)
  {
    -[WFRunnerConnection setOnInterruption:](v10, "setOnInterruption:", v12);
    -[WFRunnerConnection setOnInvalidation:](v10, "setOnInvalidation:", v13);
  }
  else
  {
    v14 = [WFRunnerConnection alloc];
    -[WFOutOfProcessWorkflowController runDescriptor](self, "runDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFRunnerConnection initWithRunDescriptor:host:onInterruption:onInvalidation:](v14, "initWithRunDescriptor:host:onInterruption:onInvalidation:", v15, self, v12, v13);

    -[WFOutOfProcessWorkflowController setServiceConnection:](self, "setServiceConnection:", v10);
  }
  -[WFOutOfProcessWorkflowController serviceConnection](self, "serviceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v28 = 0;
    v17 = (id *)&v28;
    objc_msgSend(v16, "syncRunnerWithReason:error:", v6, &v28);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
    v17 = (id *)&v27;
    objc_msgSend(v16, "asyncRunnerWithReason:error:", v6, &v27);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  v20 = *v17;

  os_unfair_lock_unlock(p_serviceConnectionLock);
  if (a3 && v20)
  {
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CB3388]);

    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("connection bringup failed"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", WFOutOfProcessWorkflowControllerErrorDomain, 2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v23;
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v19;
}

- (void)controllerStateMachine:(id)a3 didRequestStoppingShortcutWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[WFOutOfProcessWorkflowController runner](self, "runner");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopWithError:", v5);

}

- (void)controllerStateMachine:(id)a3 didFinishRunningShortcutWithResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOutOfProcessWorkflowController currentDialogAttribution](self, "currentDialogAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyDelegateWithReason:result:currentDialogAttribution:", CFSTR("workflow did finish running"), v5, v7);

  -[WFOutOfProcessWorkflowController reset](self, "reset");
}

- (void)controllerStateMachine:(id)a3 shouldNotifyDelegateWithResult:(id)a4 currentDialogAttribution:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[WFOutOfProcessWorkflowController runRequest](self, "runRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isStepwise") & 1) != 0)
  {
    objc_msgSend(v7, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      getWFVoiceShortcutClientLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[WFOutOfProcessWorkflowController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 136315650;
        v20 = "-[WFOutOfProcessWorkflowController controllerStateMachine:shouldNotifyDelegateWithResult:currentDialogAttribution:]";
        v21 = 2112;
        v22 = v7;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s Workflow stepped successfully (%@) but the run request is stepwise, not notifying the delegate %@", (uint8_t *)&v19, 0x20u);

      }
      goto LABEL_12;
    }
  }
  else
  {

  }
  getWFVoiceShortcutClientLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[WFOutOfProcessWorkflowController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315650;
    v20 = "-[WFOutOfProcessWorkflowController controllerStateMachine:shouldNotifyDelegateWithResult:currentDialogAttribution:]";
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1AF681000, v13, OS_LOG_TYPE_DEFAULT, "%s Reporting finish with result (%@) to the delegate (%@)", (uint8_t *)&v19, 0x20u);

  }
  -[WFOutOfProcessWorkflowController serviceConnection](self, "serviceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "targetType");

  if (v16)
    v17 = 2 * (v16 == 1);
  else
    v17 = 1;
  -[WFOutOfProcessWorkflowController delegate](self, "delegate");
  v11 = objc_claimAutoreleasedReturnValue();
  -[NSObject outOfProcessWorkflowController:didFinishWithResult:dialogAttribution:runResidency:](v11, "outOfProcessWorkflowController:didFinishWithResult:dialogAttribution:runResidency:", self, v7, v8, v17);
LABEL_12:

  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tearDownRunnerWithReason:", CFSTR("finished processing result, and notifying the delegate if applicable, done"));

}

- (void)controllerStateMachineDidRequestRunnerTearDown:(id)a3
{
  os_unfair_lock_s *p_serviceConnectionLock;
  void *v5;
  id v6;

  p_serviceConnectionLock = &self->_serviceConnectionLock;
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  -[WFOutOfProcessWorkflowController serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[WFOutOfProcessWorkflowController setServiceConnection:](self, "setServiceConnection:", 0);
  os_unfair_lock_unlock(p_serviceConnectionLock);
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exitWithReason:", CFSTR("runner is torn down"));

}

- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFOutOfProcessWorkflowController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFOutOfProcessWorkflowController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outOfProcessWorkflowController:didRequestUpdatedRunViewSource:completionHandler:", self, v10, v6);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)runnerWillExit
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[WFOutOfProcessWorkflowController runnerWillExit]";
    _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_DEFAULT, "%s Runner is about to tear down", (uint8_t *)&v7, 0xCu);
  }

  -[WFOutOfProcessWorkflowController setRunner:](self, "setRunner:", 0);
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  -[WFOutOfProcessWorkflowController serviceConnection](self, "serviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnInterruption:", 0);

  -[WFOutOfProcessWorkflowController serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOnInvalidation:", 0);

  os_unfair_lock_unlock(&self->_serviceConnectionLock);
  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleRunnerWillExit");

}

- (void)workflowDidStartRunning:(id)a3 isAutomation:(id)a4 dialogAttribution:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[WFOutOfProcessWorkflowController setCurrentWorkflow:](self, "setCurrentWorkflow:", v8);
  v11 = objc_msgSend(v10, "BOOLValue");

  -[WFOutOfProcessWorkflowController setIsAutomation:](self, "setIsAutomation:", v11);
  -[WFOutOfProcessWorkflowController setCurrentDialogAttribution:](self, "setCurrentDialogAttribution:", v9);
  getWFVoiceShortcutClientLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136315138;
    v17 = "-[WFOutOfProcessWorkflowController workflowDidStartRunning:isAutomation:dialogAttribution:]";
    _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_DEBUG, "%s Background runner started running workflow", (uint8_t *)&v16, 0xCu);
  }

  -[WFOutOfProcessWorkflowController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[WFOutOfProcessWorkflowController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outOfProcessWorkflowController:didStartFromWorkflowReference:dialogAttribution:", self, v8, v9);

  }
}

- (void)actionWithUUID:(id)a3 didFinishRunningWithError:(id)a4 serializedVariable:(id)a5 executionMetadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  getWFVoiceShortcutClientLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[WFOutOfProcessWorkflowController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315906;
    v21 = "-[WFOutOfProcessWorkflowController actionWithUUID:didFinishRunningWithError:serializedVariable:executionMetadata:]";
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1AF681000, v14, OS_LOG_TYPE_DEFAULT, "%s Host received finish for action (%@), delegate: %@, error: %@", (uint8_t *)&v20, 0x2Au);

  }
  -[WFOutOfProcessWorkflowController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[WFOutOfProcessWorkflowController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "propertyListObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "outOfProcessWorkflowController:actionWithUUID:didFinishRunningWithError:serializedVariable:executionMetadata:", self, v10, v11, v19, v13);

  }
}

- (void)workflowDidPause
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFOutOfProcessWorkflowController workflowDidPause]";
    _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_DEFAULT, "%s Workflow paused", (uint8_t *)&v5, 0xCu);
  }

  -[WFOutOfProcessWorkflowController stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseAndWriteShortcutToDiskState");

}

- (void)runnerDidPunchToShortcutsJr
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[WFOutOfProcessWorkflowController runRequest](self, "runRequest");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFOutOfProcessWorkflowController runningContext](self, "runningContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsDialogNotifications:", 1);

    -[WFOutOfProcessWorkflowController setPresentationMode:](self, "setPresentationMode:", 3);
  }
  else
  {

    getWFVoiceShortcutClientLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "-[WFOutOfProcessWorkflowController runnerDidPunchToShortcutsJr]";
      _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_FAULT, "%s Attempted to perform punch out for non-Siri request", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (id)localizedXPCInterruptionErrorDescription
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int IsSuggestion;

  if (-[WFOutOfProcessWorkflowController isAutomation](self, "isAutomation"))
  {
    v3 = CFSTR("There was a problem running the automation.");
    goto LABEL_7;
  }
  -[WFOutOfProcessWorkflowController currentWorkflow](self, "currentWorkflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    -[WFOutOfProcessWorkflowController currentWorkflow](self, "currentWorkflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_6;
    -[WFOutOfProcessWorkflowController runRequest](self, "runRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      v15 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v15 = 1;
    }

    -[WFOutOfProcessWorkflowController runRequest](self, "runRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "runSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IsSuggestion = WFRunSourceIsSuggestion(v17);

    if ((v15 & 1) == 0)
    {
      v3 = CFSTR("There was a problem running the action.");
      goto LABEL_7;
    }
    if (!IsSuggestion)
LABEL_6:
      v3 = CFSTR("There was a problem running the shortcut.");
    else
      v3 = CFSTR("There was a problem running the suggestion.");
LABEL_7:
    WFLocalizedString(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("There was a problem running the shortcut “%@”."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOutOfProcessWorkflowController currentWorkflow](self, "currentWorkflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedTimeoutErrorDescription
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int IsSuggestion;

  if (-[WFOutOfProcessWorkflowController isAutomation](self, "isAutomation"))
  {
    v3 = CFSTR("the automation took too long to run.");
    goto LABEL_7;
  }
  -[WFOutOfProcessWorkflowController currentWorkflow](self, "currentWorkflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    -[WFOutOfProcessWorkflowController currentWorkflow](self, "currentWorkflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_6;
    -[WFOutOfProcessWorkflowController runRequest](self, "runRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      v15 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v15 = 1;
    }

    -[WFOutOfProcessWorkflowController runRequest](self, "runRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "runSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IsSuggestion = WFRunSourceIsSuggestion(v17);

    if ((v15 & 1) == 0)
    {
      v3 = CFSTR("The action took too long to run.");
      goto LABEL_7;
    }
    if (!IsSuggestion)
LABEL_6:
      v3 = CFSTR("The shortcut took too long to run.");
    else
      v3 = CFSTR("The suggestion took too long to run.");
LABEL_7:
    WFLocalizedString(v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("The shortcut “%@” took too long to run."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOutOfProcessWorkflowController currentWorkflow](self, "currentWorkflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (WFOutOfProcessWorkflowControllerDelegate)delegate
{
  return (WFOutOfProcessWorkflowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (WFOutOfProcessWorkflowControllerVendor)runner
{
  return self->_runner;
}

- (void)setRunner:(id)a3
{
  objc_storeStrong((id *)&self->_runner, a3);
}

- (int64_t)environment
{
  return self->_environment;
}

- (WFRunnerConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (os_unfair_lock_s)serviceConnectionLock
{
  return self->_serviceConnectionLock;
}

- (WFWorkflowRunDescriptor)runDescriptor
{
  return self->_runDescriptor;
}

- (void)setRunDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_runDescriptor, a3);
}

- (WFWorkflowRunRequest)runRequest
{
  return self->_runRequest;
}

- (void)setRunRequest:(id)a3
{
  objc_storeStrong((id *)&self->_runRequest, a3);
}

- (WFWorkflowDescriptor)currentWorkflow
{
  return self->_currentWorkflow;
}

- (void)setCurrentWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_currentWorkflow, a3);
}

- (BOOL)isAutomation
{
  return self->_isAutomation;
}

- (void)setIsAutomation:(BOOL)a3
{
  self->_isAutomation = a3;
}

- (WFDialogAttribution)currentDialogAttribution
{
  return self->_currentDialogAttribution;
}

- (void)setCurrentDialogAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (WFSandboxExtensionManager)sandboxExtensionManager
{
  return self->_sandboxExtensionManager;
}

- (WFOutOfProcessWorkflowControllerStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionManager, 0);
  objc_storeStrong((id *)&self->_currentDialogAttribution, 0);
  objc_storeStrong((id *)&self->_currentWorkflow, 0);
  objc_storeStrong((id *)&self->_runRequest, 0);
  objc_storeStrong((id *)&self->_runDescriptor, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_runner, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:]_block_invoke";
    v10 = 2112;
    v11 = WeakRetained;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_INFO, "%s connection was interrupted: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v3, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedXPCInterruptionErrorDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDialogAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleXPCErrorWithDescription:reason:currentDialogAttribution:", v6, CFSTR("XPC connection interrupted"), v7);

}

void __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke_106(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:]_block_invoke";
    v10 = 2112;
    v11 = WeakRetained;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_INFO, "%s connection was invalidated: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v3, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedXPCInterruptionErrorDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDialogAttribution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleXPCErrorWithDescription:reason:currentDialogAttribution:", v6, CFSTR("XPC connection invalidated"), v7);

}

void __88__WFOutOfProcessWorkflowController_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tearDownRunnerWithReason:", CFSTR("indexing complete"));

}

void __78__WFOutOfProcessWorkflowController_injectContentAsVariable_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "propertyListObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __67__WFOutOfProcessWorkflowController_resumeRunningWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishRunningWithReason:result:", CFSTR("resumed run finished"), v3);

}

void __70__WFOutOfProcessWorkflowController_runActionWithRunRequestData_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishRunningWithReason:result:", CFSTR("remote execution finished"), v3);

}

void __76__WFOutOfProcessWorkflowController_runWorkflowWithDescriptor_request_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishRunningWithReason:result:", CFSTR("runner callback"), v3);

}

@end
