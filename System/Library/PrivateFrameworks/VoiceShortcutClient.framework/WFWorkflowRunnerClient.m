@implementation WFWorkflowRunnerClient

- (WFWorkflowRunnerClient)initWithDescriptor:(id)a3 runRequest:(id)a4
{
  return -[WFWorkflowRunnerClient initWithDescriptor:runRequest:delegateQueue:](self, "initWithDescriptor:runRequest:delegateQueue:", a3, a4, 0);
}

- (WFWorkflowRunnerClient)initWithDescriptor:(id)a3 runRequest:(id)a4 delegateQueue:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFWorkflowRunnerClient *v13;
  WFWorkflowRunnerClient *v14;
  OS_dispatch_queue *v15;
  NSObject *delegateQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *v18;
  void *v19;
  WFWorkflowRunnerClient *v20;
  void *v22;
  void *v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunnerClient.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunnerClient.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)WFWorkflowRunnerClient;
  v13 = -[WFWorkflowRunnerClient init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_descriptor, a3);
    objc_storeStrong((id *)&v14->_runRequest, a4);
    if (v12)
    {
      v15 = (OS_dispatch_queue *)v12;
      delegateQueue = v14->_delegateQueue;
      v14->_delegateQueue = v15;
    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      delegateQueue = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create("com.apple.shortcuts.WFWorkflowRunnerClient", delegateQueue);
      v18 = v14->_delegateQueue;
      v14->_delegateQueue = (OS_dispatch_queue *)v17;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v14, sel_updateRunViewSource_, CFSTR("WFWorkflowRunViewSourceUpdatedNotification"), 0);

    v20 = v14;
  }

  return v14;
}

- (BOOL)isRunning
{
  void *v2;
  BOOL v3;

  -[WFWorkflowRunnerClient progressSubscriber](self, "progressSubscriber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)start
{
  NSObject *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  WFWorkflowRunnerClient *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WFWorkflowRunnerClient descriptor](self, "descriptor");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunnerClient runRequest](self, "runRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v29 = "-[WFWorkflowRunnerClient start]";
    v30 = 2112;
    v31 = self;
    v32 = 2112;
    v33 = v4;
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_1AF681000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting shortcut run from client: %@, descriptor: %@, request: %@", buf, 0x2Au);

  }
  if (-[WFWorkflowRunnerClient isRunning](self, "isRunning"))
    -[WFWorkflowRunnerClient stop](self, "stop");
  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __31__WFWorkflowRunnerClient_start__block_invoke;
  v27[3] = &unk_1E5FC4920;
  v27[4] = self;
  -[WFWorkflowRunnerClient runWorkflowWithRequest:descriptor:completion:](self, "runWorkflowWithRequest:descriptor:completion:", v6, v7, v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient setContext:](self, "setContext:", v8);

  -[WFWorkflowRunnerClient descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  getWFVoiceShortcutClientLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    objc_msgSend(v11, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = CFSTR("none");
    objc_msgSend(v11, "name");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = &stru_1E5FC92C0;
    -[WFWorkflowRunnerClient runRequest](self, "runRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "runSource");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = CFSTR("unknown");
    *(_DWORD *)buf = 138412802;
    v29 = (const char *)v18;
    if (v23)
      v25 = (const __CFString *)v23;
    v30 = 2112;
    v31 = (WFWorkflowRunnerClient *)v21;
    v32 = 2112;
    v33 = v25;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RunWorkflow", "WorkflowID=%{signpost.description:attribute}@,WorkflowName=%{signpost.description:attribute}@,RunSource=%{signpost.description:attribute}@", buf, 0x20u);

  }
  -[WFWorkflowRunnerClient context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient beginObservingProgressForWorkflowWithRunningContext:](self, "beginObservingProgressForWorkflowWithRunningContext:", v26);

  -[WFWorkflowRunnerClient retainSelf](self, "retainSelf");
}

- (void)stop
{
  void *v3;
  void *v4;

  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowRunnerClient workflowController](self, "workflowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

    -[WFWorkflowRunnerClient autoreleaseSelf](self, "autoreleaseSelf");
  }
}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFWorkflowRunnerClient context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowRunnerClient workflowController](self, "workflowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[WFWorkflowRunnerClient context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRunnerClient createWorkflowControllerWithContext:](self, "createWorkflowControllerWithContext:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRunnerClient setWorkflowController:](self, "setWorkflowController:", v6);

    }
    -[WFWorkflowRunnerClient workflowController](self, "workflowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunnerClient runRequest](self, "runRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumeRunningWithRequest:error:", v8, 0);

    -[WFWorkflowRunnerClient retainSelf](self, "retainSelf");
  }
}

- (void)pause
{
  void *v3;
  id v4;

  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWorkflowRunnerClient workflowController](self, "workflowController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pauseWorkflowAndWriteStateToDisk");

  }
}

- (WFRunnerPrewarmManager)prewarmManager
{
  WFRunnerPrewarmManager *prewarmManager;
  WFRunnerPrewarmManager *v4;
  WFRunnerPrewarmManager *v5;

  prewarmManager = self->_prewarmManager;
  if (!prewarmManager)
  {
    +[WFRunnerPrewarmManager sharedManager](WFRunnerPrewarmManager, "sharedManager");
    v4 = (WFRunnerPrewarmManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prewarmManager;
    self->_prewarmManager = v4;

    prewarmManager = self->_prewarmManager;
  }
  return prewarmManager;
}

- (void)prewarmRunner
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  -[WFWorkflowRunnerClient context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WFWorkflowRunnerClient runRequest](self, "runRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunnerClient descriptor](self, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFWorkflowRunnerClient createRunningContextFromRequestIfNecessary:descriptor:](self, "createRunningContextFromRequestIfNecessary:descriptor:", v4, v5);

  }
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[WFWorkflowRunnerClient context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFWorkflowRunnerClient createWorkflowControllerWithContext:](self, "createWorkflowControllerWithContext:", v8);

  }
  -[WFWorkflowRunnerClient prewarmManager](self, "prewarmManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prewarmRunnerWithHostIfNecessary:", v10);

}

- (void)updateRunViewSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFWorkflowRunnerClient workflowController](self, "workflowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRunViewSource:", v6);

  objc_msgSend(v4, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowRunnerClient setRunViewSource:](self, "setRunViewSource:", v7);
}

- (void)setRunViewSource:(id)a3
{
  WFWorkflowRunViewSource *v4;
  void *v5;
  WFWorkflowRunViewSource *runViewSource;

  v4 = (WFWorkflowRunViewSource *)a3;
  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRunViewSource:", v4);

  runViewSource = self->_runViewSource;
  self->_runViewSource = v4;

}

- (id)createWorkflowControllerWithContext:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WFOutOfProcessWorkflowController *v10;
  void *v11;
  void *v12;
  WFOutOfProcessWorkflowController *v13;

  v4 = a3;
  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = objc_msgSend(v5, "presentationMode");
  if (v7 > 2)
    v8 = 0;
  else
    v8 = qword_1AF780800[v7];
  if ((isKindOfClass & 1) != 0)
    v9 = 3;
  else
    v9 = 0;
  v10 = [WFOutOfProcessWorkflowController alloc];
  -[WFWorkflowRunnerClient prewarmManager](self, "prewarmManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFOutOfProcessWorkflowController initWithEnvironment:runningContext:presentationMode:existingConnection:](v10, "initWithEnvironment:runningContext:presentationMode:existingConnection:", v9, v4, v8, v12);

  -[WFOutOfProcessWorkflowController setDelegate:](v13, "setDelegate:", self);
  -[WFWorkflowRunnerClient setWorkflowController:](self, "setWorkflowController:", v13);

  return v13;
}

- (id)createRunningContextFromRequestIfNecessary:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFWorkflowRunningContext *v9;
  WFWorkflowRunningContext *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  -[WFWorkflowRunnerClient context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFWorkflowRunnerClient context](self, "context");
    v9 = (WFWorkflowRunningContext *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [WFWorkflowRunningContext alloc];
    -[WFWorkflowRunnerClient descriptor](self, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[WFWorkflowRunningContext initWithWorkflowIdentifier:](v10, "initWithWorkflowIdentifier:", v14);
    -[WFWorkflowRunningContext setAllowsDialogNotifications:](v9, "setAllowsDialogNotifications:", objc_msgSend(v6, "allowsDialogNotifications"));
    objc_msgSend(v6, "runSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunningContext setRunSource:](v9, "setRunSource:", v15);

    objc_msgSend(v7, "kind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunningContext setRunKind:](v9, "setRunKind:", v16);

    -[WFWorkflowRunningContext setOutputBehavior:](v9, "setOutputBehavior:", objc_msgSend(v6, "outputBehavior"));
    objc_msgSend(v6, "runViewSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunningContext setRunViewSource:](v9, "setRunViewSource:", v17);

    -[WFWorkflowRunningContext setStepwise:](v9, "setStepwise:", objc_msgSend(v6, "isStepwise"));
    -[WFWorkflowRunningContext setShouldForwardDialogRequests:](v9, "setShouldForwardDialogRequests:", objc_msgSend(v6, "handlesDialogRequests"));
    -[WFWorkflowRunningContext setShouldForwardSiriActionRequests:](v9, "setShouldForwardSiriActionRequests:", objc_msgSend(v6, "handlesSiriActionRequests"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowRunningContext setOriginatingBundleIdentifier:](v9, "setOriginatingBundleIdentifier:", v19);

    -[WFWorkflowRunnerClient setContext:](self, "setContext:", v9);
  }

  return v9;
}

- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  WFWorkflowRunResult *v15;
  id v17;

  -[WFWorkflowRunnerClient createRunningContextFromRequestIfNecessary:descriptor:](self, "createRunningContextFromRequestIfNecessary:descriptor:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient createWorkflowControllerWithContext:](self, "createWorkflowControllerWithContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient prewarmManager](self, "prewarmManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFWorkflowRunnerClient prewarmManager](self, "prewarmManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reset");

  }
  -[WFWorkflowRunnerClient descriptor](self, "descriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v12 = objc_msgSend(v7, "runWorkflowWithDescriptor:request:error:", v10, v11, &v17);
  v13 = v17;

  if ((v12 & 1) != 0)
  {
    v14 = v6;
  }
  else
  {
    v15 = -[WFWorkflowRunResult initWithError:]([WFWorkflowRunResult alloc], "initWithError:", v13);
    -[WFWorkflowRunnerClient dispatchWorkflowResultHandlingWithResult:](self, "dispatchWorkflowResultHandlingWithResult:", v15);

    v14 = 0;
  }

  return v14;
}

- (void)dispatchWorkflowResultHandlingWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFVoiceShortcutClientLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFWorkflowRunnerClient dispatchWorkflowResultHandlingWithResult:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEBUG, "%s Workflow finished running, preparing to deliver result to client: %@", buf, 0x16u);

  }
  getWFVoiceShortcutClientLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF681000, v7, OS_SIGNPOST_INTERVAL_END, v10, "RunWorkflow", ", buf, 2u);
  }

  -[WFWorkflowRunnerClient delegateQueue](self, "delegateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke;
  v13[3] = &unk_1E5FC7AC0;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_async(v11, v13);

}

- (void)handleWorkflowDidStart:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workflowRunnerClient:didStartRunningWorkflowWithProgress:", self, v7);

  }
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  WFWorkflowRunnerClient *v38;
  id v39;
  void (**v40)(_QWORD);
  _QWORD block[4];
  id v42;
  WFWorkflowRunnerClient *v43;
  id v44;
  void (**v45)(_QWORD);
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlyingErrorIfRunnerError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = v6;
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (objc_msgSend(v13, "hasOutputs"))
        {
          getWFVoiceShortcutClientLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            -[WFWorkflowRunnerClient delegate](self, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
            v48 = 2112;
            v49 = v15;
            _os_log_impl(&dword_1AF681000, v14, OS_LOG_TYPE_DEBUG, "%s Preparing result with outputs for client (%@)", buf, 0x16u);

          }
          dispatch_get_global_queue(25, 0);
          v16 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke;
          block[3] = &unk_1E5FC4998;
          v13 = v13;
          v42 = v13;
          v43 = self;
          v44 = v10;
          v45 = v7;
          dispatch_async(v16, block);

          v17 = v42;
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {

        v13 = 0;
      }
      getWFVoiceShortcutClientLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        -[WFWorkflowRunnerClient delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
        v48 = 2112;
        v49 = v35;
        _os_log_impl(&dword_1AF681000, v34, OS_LOG_TYPE_DEBUG, "%s Preparing result without output for client (%@)", buf, 0x16u);

      }
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "workflowRunnerClient:didFinishRunningWorkflowWithAllResults:error:cancelled:", self, 0, v10, objc_msgSend(v13, "isCancelled"));
      goto LABEL_30;
    }
  }
  -[WFWorkflowRunnerClient delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    getWFVoiceShortcutClientLogObject();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        -[WFWorkflowRunnerClient delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
        v48 = 2112;
        v49 = v29;

      }
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSObject workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled:](v28, "workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled:", self, v10, objc_msgSend(v6, "isCancelled"));
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
      v48 = 2112;
      v49 = v33;
      _os_log_impl(&dword_1AF681000, v28, OS_LOG_TYPE_ERROR, "%s Workflow finished running, but client (%@) does not respond to -workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled: or workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", buf, 0x16u);

    }
    goto LABEL_25;
  }
  v20 = v6;
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    getWFVoiceShortcutClientLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      -[WFWorkflowRunnerClient delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
      v48 = 2112;
      v49 = v31;
      _os_log_impl(&dword_1AF681000, v30, OS_LOG_TYPE_DEBUG, "%s Delivering workflow run result to client: %@", buf, 0x16u);

    }
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", self, 0, v10, objc_msgSend(v20, "isCancelled"));

LABEL_25:
    v7[2](v7);
    goto LABEL_31;
  }
  getWFVoiceShortcutClientLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    -[WFWorkflowRunnerClient delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
    v48 = 2112;
    v49 = v22;
    _os_log_impl(&dword_1AF681000, v21, OS_LOG_TYPE_DEBUG, "%s Preparing output for client (%@)", buf, 0x16u);

  }
  dispatch_get_global_queue(25, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_71;
  v36[3] = &unk_1E5FC4998;
  v37 = v20;
  v38 = self;
  v39 = v10;
  v40 = v7;
  v24 = v20;
  dispatch_async(v23, v36);

LABEL_31:
}

- (void)beginObservingProgressForWorkflowWithRunningContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunnerClient.m"), 303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke;
  aBlock[3] = &unk_1E5FC4A30;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "addProgressSubscriberUsingPublishingHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient setProgressSubscriber:](self, "setProgressSubscriber:", v7);

}

- (void)stopObservingRunProgress
{
  void *v3;
  void *v4;

  -[WFWorkflowRunnerClient context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient progressSubscriber](self, "progressSubscriber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeProgressSubscriber:", v4);

  -[WFWorkflowRunnerClient setProgressSubscriber:](self, "setProgressSubscriber:", 0);
}

- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6
{
  -[WFWorkflowRunnerClient dispatchWorkflowResultHandlingWithResult:](self, "dispatchWorkflowResultHandlingWithResult:", a4);
  -[WFWorkflowRunnerClient autoreleaseSelf](self, "autoreleaseSelf");
}

- (void)outOfProcessWorkflowController:(id)a3 didRequestUpdatedRunViewSource:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *, _QWORD);

  v12 = (void (**)(id, void *, _QWORD))a5;
  v7 = a4;
  -[WFWorkflowRunnerClient runViewSource](self, "runViewSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    -[WFWorkflowRunnerClient runViewSource](self, "runViewSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "refresh");

    -[WFWorkflowRunnerClient runViewSource](self, "runViewSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11, 0);

  }
  else
  {
    v12[2](v12, 0, 0);
  }

}

- (void)retainSelf
{
  objc_storeStrong((id *)&self->_strongSelf, self);
}

- (void)autoreleaseSelf
{
  WFWorkflowRunnerClient **p_strongSelf;
  WFWorkflowRunnerClient *v3;

  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, objc_retainAutorelease(self->_strongSelf));
  v3 = *p_strongSelf;
  *p_strongSelf = 0;

}

- (WFWorkflowRunnerClientDelegate)delegate
{
  return (WFWorkflowRunnerClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (void)setProgressSubscriber:(id)a3
{
  objc_storeStrong(&self->_progressSubscriber, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (WFWorkflowRunDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (WFWorkflowRunRequest)runRequest
{
  return self->_runRequest;
}

- (void)setRunRequest:(id)a3
{
  objc_storeStrong((id *)&self->_runRequest, a3);
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (WFOutOfProcessWorkflowController)workflowController
{
  return self->_workflowController;
}

- (void)setWorkflowController:(id)a3
{
  objc_storeStrong((id *)&self->_workflowController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_runRequest, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prewarmManager, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

void *__78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke_2;
  v7[3] = &unk_1E5FC7AC0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v7);

  return &__block_literal_global_626;
}

uint64_t __78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWorkflowDidStart:", *(_QWORD *)(a1 + 40));
}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2;
  v3[3] = &unk_1E5FC4970;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "getActionOutputsWithCompletionHandler:", v3);

}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_71(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2_72;
  v3[3] = &unk_1E5FC49E8;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "getOutputWithCompletionHandler:", v3);

}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2_72(uint64_t a1, void *a2, void *a3)
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
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3_73;
  v11[3] = &unk_1E5FC49C0;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v14 = v6;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3_73(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]_block_invoke_3";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_DEFAULT, "%s Delivering workflow run result to client: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  if (!v5)
    v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v4, "workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, objc_msgSend(*(id *)(a1 + 64), "isCancelled"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3;
  block[3] = &unk_1E5FC4948;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]_block_invoke_3";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_DEFAULT, "%s Delivering workflow run result to client: %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workflowRunnerClient:didFinishRunningWorkflowWithAllResults:error:cancelled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isCancelled"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke_2;
  v4[3] = &unk_1E5FC7288;
  v4[4] = v2;
  return objc_msgSend(v2, "handleWorkflowRunResult:completion:", v1, v4);
}

uint64_t __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObservingRunProgress");
}

uint64_t __31__WFWorkflowRunnerClient_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchWorkflowResultHandlingWithResult:", a2);
}

+ (id)underlyingErrorIfRunnerError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("WFBackgroundShortcutRunnerErrorDomain")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_5:
    v9 = v3;
    goto LABEL_6;
  }
  objc_msgSend(v3, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

@end
