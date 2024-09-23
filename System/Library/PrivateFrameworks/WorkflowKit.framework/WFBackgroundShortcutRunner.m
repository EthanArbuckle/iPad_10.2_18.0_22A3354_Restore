@implementation WFBackgroundShortcutRunner

- (WFHarnessTestCase)currentTestCase
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "testRunDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v3, "loadTestCaseWithError:", &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (!v4)
    {
      getWFTestHarnessLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[WFBackgroundShortcutRunner(TestHarness) currentTestCase]";
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Running in test harness, but can't load test case: %@", buf, 0x16u);
      }

    }
  }
  else
  {

    v4 = 0;
  }
  return (WFHarnessTestCase *)v4;
}

- (id)createTestUIPresenterInterfaceForTestCase:(id)a3
{
  id v4;
  WFTestUIPresenterInterface *v5;

  v4 = a3;
  v5 = -[WFTestUIPresenterInterface initWithTestCase:backgroundRunner:]([WFTestUIPresenterInterface alloc], "initWithTestCase:backgroundRunner:", v4, self);

  return v5;
}

- (id)createTestSiriUIPresenterInterfaceForTestCase:(id)a3
{
  id v4;
  WFTestUIPresenterInterface *v5;

  v4 = a3;
  v5 = -[WFTestUIPresenterInterface initWithTestCase:backgroundRunner:]([WFTestUIPresenterInterface alloc], "initWithTestCase:backgroundRunner:", v4, self);

  return v5;
}

- (id)workflowForTesting
{
  void *v2;
  void *v3;

  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contextForAction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  WFHarnessActionContext *v11;
  WFHarnessActionContext *v12;
  void *v13;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBackgroundShortcutRunner+TestHarness.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  -[WFBackgroundShortcutRunner workflowForTesting](self, "workflowForTesting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v5);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    getWFTestHarnessLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      -[WFBackgroundShortcutRunner workflowForTesting](self, "workflowForTesting");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v17 = "-[WFBackgroundShortcutRunner(TestHarness) contextForAction:]";
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Can't find executing action %@ in executing workflow %@", buf, 0x20u);

    }
    v11 = 0;
  }
  else
  {
    v12 = [WFHarnessActionContext alloc];
    objc_msgSend(v5, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFHarnessActionContext initWithIdentifier:indexInWorkflow:](v12, "initWithIdentifier:indexInWorkflow:", v13, v8);

  }
  return v11;
}

- (BOOL)isTesting
{
  void *v2;
  BOOL v3;

  -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)handleTestingEventIfTesting:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  WFHarnessActionConditionContext *v18;
  void *v19;
  WFHarnessActionConditionContext *v20;
  void *v21;
  WFHarnessActionConditionContext *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  WFHarnessActionConditionContext *v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  if (-[WFBackgroundShortcutRunner isTesting](self, "isTesting"))
  {
    objc_msgSend(v6, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBackgroundShortcutRunner contextForAction:](self, "contextForAction:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conditions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke;
    v29[3] = &unk_1E7AEAC80;
    v13 = v6;
    v30 = v13;
    v31 = v9;
    v14 = v9;
    objc_msgSend(v11, "if_compactMap:", v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handledConditions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unionSet:", v15);

    v18 = [WFHarnessActionConditionContext alloc];
    -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WFHarnessActionConditionContext initWithVariableDataSource:](v18, "initWithVariableDataSource:", v19);

    objc_msgSend(v15, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_2;
    v26[3] = &unk_1E7AEACD0;
    v27 = v13;
    v28 = v20;
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_4;
    v23[3] = &unk_1E7AF8598;
    v25 = v7;
    v24 = v27;
    v22 = v20;
    objc_msgSend(v21, "if_enumerateAsynchronously:completionHandler:", v26, v23);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

- (id)testingHarnessErrorForWorkflowFinishedError:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 || !v5)
    goto LABEL_8;
  objc_msgSend(v5, "interactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "handledInteractions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v9);

  objc_msgSend(v6, "siriInteractions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v6, "handledSiriInteractions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  objc_msgSend(v6, "conditions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v6, "handledConditions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minusSet:", v15);

  if (!objc_msgSend(v8, "count") && !objc_msgSend(v11, "count") && !objc_msgSend(v14, "count"))
  {

LABEL_8:
    v17 = v4;
    goto LABEL_9;
  }
  +[WFHarnessTestResult failureWithReason:](WFHarnessTestResult, "failureWithReason:", CFSTR("Expected interaction or condition not handled."));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorRepresentation");
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v17;
}

id __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "eventClass");
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "selector"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "matchesContext:", *(_QWORD *)(a1 + 40)),
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_3;
  v10[3] = &unk_1E7AEACA8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(a2, "evaluateWithEvent:context:withResponse:", v8, v7, v10);

}

void __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char isKindOfClass;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WFHarnessTestErrorResult"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      getWFTestHarnessLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v11 = 136315138;
        v12 = "-[WFBackgroundShortcutRunner(TestHarness) handleTestingEventIfTesting:completionHandler:]_block_invoke_4";
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Condition failed, but failure does not contain a test result", (uint8_t *)&v11, 0xCu);
      }

      objc_msgSend(v5, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFHarnessTestResult failureWithReason:](WFHarnessTestResult, "failureWithReason:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    (*(void (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), (isKindOfClass & 1) == 0, 0);
  }

}

void __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "errorRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (WFBackgroundShortcutRunner)initWithProcessPolicy:(unint64_t)a3
{
  WFBackgroundShortcutRunner *v4;
  WFBackgroundShortcutRunner *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFBackgroundShortcutRunnerStateMachine *v10;
  WFBackgroundShortcutRunnerStateMachine *stateMachine;
  WFBackgroundShortcutRunnerStateMachine *v12;
  WFRunningProgressSuppressionStateMachine *v13;
  WFRunningProgressSuppressionStateMachine *runningProgressSuppressionStateMachine;
  WFRunningProgressSuppressionStateMachine *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  NSMutableDictionary *actionReversalStates;
  dispatch_group_t v21;
  OS_dispatch_group *exitTaskGroup;
  WFBackgroundShortcutRunner *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WFBackgroundShortcutRunner;
  v4 = -[WFBackgroundShortcutRunner init](&v25, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        objc_msgSend(MEMORY[0x1E0DC7928], "accessSpecifierUnrestricted");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFBackgroundShortcutRunner setAccessSpecifier:](v5, "setAccessSpecifier:", v6);

        +[WFInitialization initializeProcessWithDatabase:skipDeletingTemporaryFiles:](WFInitialization, "initializeProcessWithDatabase:skipDeletingTemporaryFiles:", 0, 1);
      }
    }
    else
    {
      v7 = -[WFBackgroundShortcutRunner initializeSharedTemporaryDirectoryLock](v4, "initializeSharedTemporaryDirectoryLock") ^ 1;
      +[WFInitialization initializeProcessWithDatabase:skipDeletingTemporaryFiles:](WFInitialization, "initializeProcessWithDatabase:skipDeletingTemporaryFiles:", 0, v7);
      if ((v7 & 1) == 0)
        -[WFBackgroundShortcutRunner demoteSharedTemporaryDirectoryLock](v5, "demoteSharedTemporaryDirectoryLock");
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getVaultItemsAccessForBackgroundRunner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_7095);
      -[WFBackgroundShortcutRunner setDataVaultFileURLs:](v5, "setDataVaultFileURLs:", v9);

    }
    v10 = -[WFBackgroundShortcutRunnerStateMachine initWithProcessPolicy:]([WFBackgroundShortcutRunnerStateMachine alloc], "initWithProcessPolicy:", a3);
    -[WFBackgroundShortcutRunnerStateMachine setDelegate:](v10, "setDelegate:", v5);
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = v10;
    v12 = v10;

    v13 = (WFRunningProgressSuppressionStateMachine *)objc_opt_new();
    -[WFRunningProgressSuppressionStateMachine setDelegate:](v13, "setDelegate:", v5);
    runningProgressSuppressionStateMachine = v5->_runningProgressSuppressionStateMachine;
    v5->_runningProgressSuppressionStateMachine = v13;
    v15 = v13;

    v5->_runningProgressSuppressionMachineResolvedAndDeniedProgress = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.WorkflowKit.BackgroundShortcutRunner.queue", v16);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v17;

    v19 = objc_opt_new();
    actionReversalStates = v5->_actionReversalStates;
    v5->_actionReversalStates = (NSMutableDictionary *)v19;

    v21 = dispatch_group_create();
    exitTaskGroup = v5->_exitTaskGroup;
    v5->_exitTaskGroup = (OS_dispatch_group *)v21;

    v23 = v5;
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFXPCRunnerLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[WFBackgroundShortcutRunner listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEBUG, "%s Received new connection", buf, 0xCu);
  }

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_1E7AF94B0;
  v14[4] = self;
  objc_msgSend(v5, "setInterruptionHandler:", v14);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke_135;
  v13[3] = &unk_1E7AF94B0;
  v13[4] = self;
  objc_msgSend(v5, "setInvalidationHandler:", v13);
  WFOutOfProcessWorkflowControllerHostXPCInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v8);

  WFOutOfProcessWorkflowControllerVendorXPCInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v9);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");
  -[WFBackgroundShortcutRunner setXpcConnection:](self, "setXpcConnection:", v5);
  objc_msgSend(MEMORY[0x1E0DC7928], "accessSpecifierForXPCConnection:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFBackgroundShortcutRunner setAccessSpecifier:](self, "setAccessSpecifier:", v10);
  -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "idleStateWithReason:", CFSTR("incoming connection to runner"));

  return 1;
}

- (BOOL)initializeSharedTemporaryDirectoryLock
{
  id v3;

  WFBackgroundShortcutRunnerLockFileURL();
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_lockFileFD = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 532, 438);

  return flock(-[WFBackgroundShortcutRunner lockFileFD](self, "lockFileFD"), 6) == 0;
}

- (BOOL)promoteSharedTemporaryDirectoryLock
{
  return flock(-[WFBackgroundShortcutRunner lockFileFD](self, "lockFileFD"), 6) == 0;
}

- (void)demoteSharedTemporaryDirectoryLock
{
  flock(-[WFBackgroundShortcutRunner lockFileFD](self, "lockFileFD"), 5);
}

- (void)updateRunViewSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInterfacePresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRunViewSource:", v4);

}

- (void)prewarmRunnerWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  getWFXPCRunnerLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFBackgroundShortcutRunner prewarmRunnerWithCompletion:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Runner prewarm complete", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, 0);
}

- (void)runWorkflowWithDescriptor:(id)a3 request:(id)a4 inEnvironment:(id)a5 runningContext:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSObject *v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  OS_os_transaction *v45;
  OS_os_transaction *transaction;
  void *v47;
  id completionBlock;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  const char *v64;
  void *v65;
  void *v66;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  WFBackgroundShortcutRunner *v73;
  id v74;
  id v75;
  id v76;
  __int128 *p_buf;
  SEL v78;
  id v79;
  uint8_t v80[4];
  const char *v81;
  __int128 buf;
  uint64_t v83;
  char v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  _QWORD v88[4];

  v88[1] = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "isStepwise"))
  {
    -[WFBackgroundShortcutRunner accessSpecifier](self, "accessSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "allowStepwiseExecution");

    if ((v17 & 1) == 0)
    {
      v36 = objc_alloc(MEMORY[0x1E0DC7E68]);
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v87 = *MEMORY[0x1E0CB2D50];
      v88[0] = CFSTR("You're trying to run a shortcut stepwise, but you don't have the entitlement for it.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, &v87, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      WFBackgroundShortcutRunnerError(0, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v36, "initWithError:", v40);

      getWFGeneralLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v28))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C15B3000, v28, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", ", (uint8_t *)&buf, 2u);
      }
      goto LABEL_23;
    }
  }
  v18 = os_log_create("com.apple.shortcuts", "SystemSignpostIntervals");
  objc_msgSend(v14, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");

  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v18, OS_SIGNPOST_INTERVAL_END, v20, "RunnerRunRequest", ", (uint8_t *)&buf, 2u);
  }

  getWFGeneralLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v21))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isRunningShortcut");

  if (!v23)
  {
    if (+[WFAssessmentModeManager isAssessmentModeSupportedOnCurrentDevice](WFAssessmentModeManager, "isAssessmentModeSupportedOnCurrentDevice"))
    {
      -[WFBackgroundShortcutRunner assessmentModeManager](self, "assessmentModeManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isInAssessmentMode");

      getWFXPCRunnerLogObject();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v32)
        {
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:r"
                                          "unningContext:completion:]";
          _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_DEFAULT, "%s Device is in assessmentMode cancelling shortcut execution.", (uint8_t *)&buf, 0xCu);
        }

        v33 = objc_alloc(MEMORY[0x1E0DC7E68]);
        -[WFBackgroundShortcutRunner assessmentModeActiveError](self, "assessmentModeActiveError");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        WFBackgroundShortcutRunnerError(16, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v33, "initWithError:", v35);

        getWFGeneralLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v28))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1C15B3000, v28, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", ", (uint8_t *)&buf, 2u);
        }
        goto LABEL_23;
      }
      if (v32)
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:run"
                                        "ningContext:completion:]";
        _os_log_impl(&dword_1C15B3000, v31, OS_LOG_TYPE_DEFAULT, "%s Device is NOT in assessmentMode observing for changes.", (uint8_t *)&buf, 0xCu);
      }

      -[WFBackgroundShortcutRunner assessmentModeManager](self, "assessmentModeManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "startObservingForAssesmentModeChangesIfNeeded");

    }
    -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("new run request: %@"), v12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handlingRequestStateWithReason:", v44);

    v45 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v45;

    self->_environment = objc_msgSend(v13, "integerValue");
    objc_storeStrong((id *)&self->_currentRunRequest, a4);
    v47 = _Block_copy(v15);
    completionBlock = self->_completionBlock;
    self->_completionBlock = v47;

    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    objc_msgSend(v68, "workflowReferenceWithDatabase:error:", v27, &v79);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v79;
    v41 = v50;
    if (!v49 && v50)
    {
      v51 = objc_alloc(MEMORY[0x1E0DC7E68]);
      WFBackgroundShortcutRunnerError(1, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v51, "initWithError:", v52);

      objc_msgSend(v53, "error");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, void *))v15 + 2))(v15, v53, v54);

LABEL_45:
      goto LABEL_46;
    }
    if (objc_msgSend(v49, "disabledOnLockScreen")
      && +[WFCompactUnlockService isDeviceLocked](WFCompactUnlockService, "isDeviceLocked"))
    {
      v55 = (void *)MEMORY[0x1E0CB35C8];
      v85 = *MEMORY[0x1E0CB2D50];
      WFLocalizedString(CFSTR("This shortcut cannot run when the device is locked. You can change this in the Privacy tab of the shortcut settings."));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "errorWithDomain:code:userInfo:", CFSTR("WFWorkflowErrorDomain"), 7, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = objc_alloc(MEMORY[0x1E0DC7E68]);
      WFBackgroundShortcutRunnerError(15, v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(v59, "initWithError:", v60);

      objc_msgSend(v61, "error");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, void *))v15 + 2))(v15, v61, v62);

      goto LABEL_45;
    }
    objc_storeStrong((id *)&self->_currentRunningWorkflowReference, v49);
    objc_storeStrong((id *)&self->_currentRunningContext, a6);
    self->_isPersonalAutomation = objc_msgSend(v49, "hiddenFromLibraryAndSync");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v83 = 0x2020000000;
    v84 = 0;
    if (v49)
    {
      if (-[WFBackgroundShortcutRunner isPersonalAutomation](self, "isPersonalAutomation"))
      {
        getWFSecurityLogObject();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v80 = 136315138;
          v81 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]";
          v64 = "%s Disabling privacy prompts because this is a personal automation.";
LABEL_42:
          _os_log_impl(&dword_1C15B3000, v63, OS_LOG_TYPE_DEFAULT, v64, v80, 0xCu);
        }
      }
      else
      {
        if (self->_environment != 1)
        {
LABEL_44:
          objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC7C88], "all");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke;
          v69[3] = &unk_1E7AEC010;
          v70 = v68;
          v71 = v13;
          v72 = v27;
          v73 = self;
          v78 = a2;
          v74 = v12;
          v75 = v14;
          v76 = v49;
          p_buf = &buf;
          objc_msgSend(v65, "performWithSandboxExtensions:asynchronousBlock:", v66, v69);

          _Block_object_dispose(&buf, 8);
          goto LABEL_45;
        }
        getWFSecurityLogObject();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v80 = 136315138;
          v81 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]";
          v64 = "%s Disabling privacy prompts because this is a home automation.";
          goto LABEL_42;
        }
      }
    }
    else
    {
      getWFSecurityLogObject();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v80 = 136315138;
        v81 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]";
        v64 = "%s Disabling privacy prompts because this is an on-the-fly shortcut.";
        goto LABEL_42;
      }
    }

    *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 1;
    goto LABEL_44;
  }
  getWFXPCRunnerLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:running"
                                    "Context:completion:]";
    _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_ERROR, "%s BackgroundShortcutRunner asked to run two workflows in parallel which is not supported.", (uint8_t *)&buf, 0xCu);
  }

  v25 = objc_alloc(MEMORY[0x1E0DC7E68]);
  WFBackgroundShortcutRunnerError(3, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithError:", v26);

  getWFGeneralLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v28))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v28, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", ", (uint8_t *)&buf, 2u);
  }
LABEL_23:

  objc_msgSend(v27, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, void *))v15 + 2))(v15, v27, v41);
LABEL_46:

}

- (void)stepWithAction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "isMissing"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBackgroundShortcutRunner.m"), 461, CFSTR("Tried to step with an invalid action"));

  }
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getWFXPCRunnerLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[WFBackgroundShortcutRunner stepWithAction:]";
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding action: %@ to workflow: %@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(v7, "addAction:", v5);
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "step");

}

- (void)runActionFromRunRequestData:(id)a3 runningContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_transaction *v11;
  OS_os_transaction *transaction;
  void *v13;
  id completionBlock;
  void *v15;
  WFRemoteExecutionRunRequest *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  WFRemoteExecutionRunRequest *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  WFRemoteExecutionRunRequest *v32;
  WFBackgroundShortcutRunner *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  WFBackgroundShortcutRunner *v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v11;

  self->_environment = 4;
  v13 = _Block_copy(v9);

  completionBlock = self->_completionBlock;
  self->_completionBlock = v13;

  -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handlingRequestStateWithReason:", CFSTR("incoming remote execution request"));

  v38 = 0;
  v16 = -[WFRemoteExecutionRunRequest initWithData:error:]([WFRemoteExecutionRunRequest alloc], "initWithData:error:", v10, &v38);

  v17 = v38;
  if (v16)
  {
    -[WFBackgroundShortcutRunner setCurrentRemoteExecutionRunRequest:](self, "setCurrentRemoteExecutionRunRequest:", v16);
    -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isRunningShortcut");

    if (v19)
    {
      getWFXPCRunnerLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]";
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s BackgroundShortcutRunner asked to run two workflows in parallel which is not supported.", buf, 0xCu);
      }

      WFBackgroundShortcutRunnerError(3, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFBackgroundShortcutRunner currentRemoteExecutionRunRequest](self, "currentRemoteExecutionRunRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke;
      v35[3] = &unk_1E7AF92C0;
      v36 = v21;
      v37 = self;
      v23 = v21;
      -[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:](self, "sendResponseForRunRequest:controller:error:completion:", v22, 0, v23, v35);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC7C88], "all");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2;
      v31[3] = &unk_1E7AEC060;
      v32 = v16;
      v33 = self;
      v34 = v8;
      objc_msgSend(v29, "performWithSandboxExtensions:asynchronousBlock:", v30, v31);

      v23 = v32;
    }
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]";
      v41 = 2114;
      v42 = v17;
      _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_FAULT, "%s failed to read run request from data, error: %{public}@", buf, 0x16u);
    }

    v25 = objc_alloc(MEMORY[0x1E0DC7E68]);
    WFBackgroundShortcutRunnerError(1, v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (WFRemoteExecutionRunRequest *)objc_msgSend(v25, "initWithError:", v26);

    -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to parse remote execution run request from data, error: %@"), v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "finishRunningWithReason:result:", v28, v23);

  }
}

- (void)resumeRunningFromContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_transaction *v11;
  OS_os_transaction *transaction;
  void *v13;
  id completionBlock;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  WFBackgroundShortcutRunner *v35;
  id v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v11;

  self->_environment = 0;
  objc_storeStrong((id *)&self->_currentRunRequest, a4);
  v13 = _Block_copy(v10);

  completionBlock = self->_completionBlock;
  self->_completionBlock = v13;

  -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("incoming resume request (%@) with context: %@"), v9, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handlingRequestStateWithReason:", v16);

  WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v9, "runSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0DC8480]);

    if (v19)
      -[WFBackgroundShortcutRunner setIsPersonalAutomation:](self, "setIsPersonalAutomation:", 1);
    objc_msgSend(v9, "extensionResourceClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v22;

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C88]), "initWithAccessResourceClassNames:", v28);
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke;
    v33[3] = &unk_1E7AEC0B0;
    v34 = v17;
    v35 = self;
    v36 = v8;
    v37 = v9;
    objc_msgSend(v32, "performWithSandboxExtensions:asynchronousBlock:", v29, v33);

    v30 = v34;
  }
  else
  {
    getWFXPCRunnerLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]";
      v42 = 2112;
      v43 = v8;
      _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_FAULT, "%s Unable to get state URL from context: %@", buf, 0x16u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v38[0] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Unable to run"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v25;
    v38[1] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("An error occurred while resuming your shortcut."));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WFBackgroundShortcutRunnerErrorDomain"), 11, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", v28);
    -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to get state URL from context: %@"), v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "finishRunningWithReason:result:", v31, v29);

  }
}

- (void)stopWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFXPCRunnerLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workflow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[WFBackgroundShortcutRunner stopWithError:]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s Requested stopping workflow run: %@", (uint8_t *)&v9, 0x16u);

  }
  -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopShortcutWithError:reason:", v4, CFSTR("-stop was called"));

}

- (void)unaliveProcess
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *exitTaskGroup;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFBackgroundShortcutRunner unaliveProcess]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEBUG, "%s Waiting for exit tasks before exiting.", buf, 0xCu);
  }

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke;
  aBlock[3] = &unk_1E7AF94B0;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  exitTaskGroup = self->_exitTaskGroup;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_248;
  block[3] = &unk_1E7AF8F48;
  v7 = v5;
  v14 = v7;
  v8 = MEMORY[0x1E0C80D38];
  dispatch_group_notify(exitTaskGroup, MEMORY[0x1E0C80D38], block);
  v9 = dispatch_time(0, 20000000000);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_249;
  v11[3] = &unk_1E7AF8F48;
  v12 = v7;
  v10 = v7;
  dispatch_after(v9, v8, v11);

}

- (void)callWorkflowRunningCompletionBlockWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id completionBlock;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFBackgroundShortcutRunner completionBlock](self, "completionBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getWFXPCRunnerLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v11 = 136315138;
      v12 = "-[WFBackgroundShortcutRunner callWorkflowRunningCompletionBlockWithResult:]";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Workflow Did Finish: Calling Completion Block", (uint8_t *)&v11, 0xCu);
    }

    -[WFBackgroundShortcutRunner completionBlock](self, "completionBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v4, 0);

    completionBlock = self->_completionBlock;
    self->_completionBlock = 0;

    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v7, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", ", (uint8_t *)&v11, 2u);
    }
  }
  else if (v8)
  {
    v11 = 136315138;
    v12 = "-[WFBackgroundShortcutRunner callWorkflowRunningCompletionBlockWithResult:]";
    _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_DEFAULT, "%s Workflow Did Finish: No Completion Block", (uint8_t *)&v11, 0xCu);
  }

}

- (void)finishRunningWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];

  v4 = a3;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFBackgroundShortcutRunner runEvent](self, "runEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 2;
    else
      v8 = 1;

    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBackgroundShortcutRunner runEvent](self, "runEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOutcome:forRunEvent:", v8, v10);

    -[WFBackgroundShortcutRunner setRunEvent:](self, "setRunEvent:", 0);
  }
  -[WFBackgroundShortcutRunner currentRunningContext](self, "currentRunningContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && objc_msgSend(v11, "allowsDialogNotifications"))
    {
      objc_msgSend(v4, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "wf_isRequiresShortcutsJrError");

      if ((v14 & 1) != 0)
        goto LABEL_12;
      -[WFBackgroundShortcutRunner currentRunningWorkflowReference](self, "currentRunningWorkflowReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attribution");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:", v16, v12, v18, v11);

    }
  }
LABEL_12:
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userInterfacePresenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (-[WFBackgroundShortcutRunner shortcutShouldShowRunningProgress](self, "shortcutShouldShowRunningProgress")
      && !-[WFBackgroundShortcutRunner runningProgressSuppressionMachineResolvedAndDeniedProgress](self, "runningProgressSuppressionMachineResolvedAndDeniedProgress"))
    {
      dispatch_group_enter((dispatch_group_t)self->_exitTaskGroup);
      -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInterfacePresenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        v25 = 0;
      else
        v25 = objc_msgSend(v4, "isCancelled") ^ 1;
      objc_msgSend(v23, "numberWithInt:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke;
      v29[3] = &unk_1E7AF7B78;
      v29[4] = self;
      objc_msgSend(v22, "completePersistentModeWithSuccess:runningContext:completionHandler:", v26, v11, v29);

    }
    else
    {
      dispatch_group_enter((dispatch_group_t)self->_exitTaskGroup);
      -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInterfacePresenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke_2;
      v28[3] = &unk_1E7AF7B78;
      v28[4] = self;
      objc_msgSend(v22, "dismissPresentedContentForRunningContext:completionHandler:", v11, v28);
    }

  }
  -[WFBackgroundShortcutRunner callWorkflowRunningCompletionBlockWithResult:](self, "callWorkflowRunningCompletionBlockWithResult:", v4);
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reset");

  -[WFBackgroundShortcutRunner setTransaction:](self, "setTransaction:", 0);
  -[WFBackgroundShortcutRunner setCurrentRunRequest:](self, "setCurrentRunRequest:", 0);
  -[WFBackgroundShortcutRunner setCurrentRunningWorkflowReference:](self, "setCurrentRunningWorkflowReference:", 0);
  -[WFBackgroundShortcutRunner setCurrentRunningContext:](self, "setCurrentRunningContext:", 0);

}

- (void)runnerStateMachine:(id)a3 didRequestStoppingShortcutWithError:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopWithError:", v12);
  }
  else
  {
LABEL_4:
    -[WFBackgroundShortcutRunner completionBlock](self, "completionBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", v12);
      -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishRunningWithReason:result:", CFSTR("runner was asked to stop but there's a completion handler and NO workflow"), v9);

    }
    else
    {
      -[WFBackgroundShortcutRunner stateMachine](self, "stateMachine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exitWithReason:", CFSTR("-stop was called and there is no running shortcut, proceeding directly to stop"));
    }
  }

}

- (void)runnerStateMachine:(id)a3 didFinishRunningShortcutWithResult:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__WFBackgroundShortcutRunner_runnerStateMachine_didFinishRunningShortcutWithResult___block_invoke;
  v8[3] = &unk_1E7AF92C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)runnerStateMachineDidRequestProcessExit:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[WFBackgroundShortcutRunner runnerStateMachineDidRequestProcessExit:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEBUG, "%s Notify the host that runner will exit", (uint8_t *)&v5, 0xCu);
  }

  -[WFBackgroundShortcutRunner synchronouslyPerformWithHost:](self, "synchronouslyPerformWithHost:", &__block_literal_global_259);
  -[WFBackgroundShortcutRunner unaliveProcess](self, "unaliveProcess");
}

- (void)runningProgressSuppressionStateMachine:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4 dialogAttribution:(id)a5
{
  id v7;
  NSObject *v8;
  WFRunningProgressSuppressionStateMachine *runningProgressSuppressionStateMachine;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  runningProgressSuppressionStateMachine = self->_runningProgressSuppressionStateMachine;
  self->_runningProgressSuppressionStateMachine = 0;

  self->_runningProgressSuppressionMachineResolvedAndDeniedProgress = !a4;
  if (-[WFBackgroundShortcutRunner shortcutShouldShowRunningProgress](self, "shortcutShouldShowRunningProgress"))
  {
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInterfacePresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      getWFGeneralLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[WFBackgroundShortcutRunner runningProgressSuppressionStateMachine:didDecideRunningProgressIsAllowed:di"
                "alogAttribution:]";
          _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Beginning persistent mode", buf, 0xCu);
        }

        dispatch_group_enter((dispatch_group_t)self->_exitTaskGroup);
        -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userInterfacePresenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFBackgroundShortcutRunner currentRunningContext](self, "currentRunningContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __121__WFBackgroundShortcutRunner_runningProgressSuppressionStateMachine_didDecideRunningProgressIsAllowed_dialogAttribution___block_invoke;
        v17[3] = &unk_1E7AF7B78;
        v17[4] = self;
        objc_msgSend(v15, "beginPersistentModeWithRunningContext:attribution:completionHandler:", v16, v7, v17);

      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[WFBackgroundShortcutRunner runningProgressSuppressionStateMachine:didDecideRunningProgressIsAllowed:di"
                "alogAttribution:]";
          _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Would have started persistent mode, but we are asked to suppress running progress dialogs", buf, 0xCu);
        }

      }
    }
  }

}

- (BOOL)runRequestIsContextualAction
{
  void *v2;
  char isKindOfClass;

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)runRequestOriginatedFromLocalSiri
{
  void *v2;
  void *v3;
  char v4;

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "runSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC84B0]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shortcutShouldShowRunningProgress
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  if (-[WFBackgroundShortcutRunner environment](self, "environment") == 4)
    return 0;
  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "presentationMode");

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSystemAperture");

  if (v7)
  {
    -[WFBackgroundShortcutRunner currentRunningContext](self, "currentRunningContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[WFBackgroundShortcutRunner runRequestOriginatedFromLocalSiri](self, "runRequestOriginatedFromLocalSiri"))
    {
      v9 = 1;
LABEL_22:

      return v9;
    }
    objc_msgSend(v8, "automationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DC8470], *MEMORY[0x1E0DC84D0], *MEMORY[0x1E0DC84C8], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "runSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(v8, "runSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "containsObject:", v14);

      if (v15)
      {
        v9 = v5 == 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {

    }
    v9 = v5 != 3 && v5 != 0;
    goto LABEL_21;
  }
  return v5 == 1;
}

- (BOOL)progressIsPersistentInSystemAperture
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSystemAperture");

  if (!v4
    || self->_runningProgressSuppressionStateMachine
    && -[WFBackgroundShortcutRunner runningProgressSuppressionMachineResolvedAndDeniedProgress](self, "runningProgressSuppressionMachineResolvedAndDeniedProgress")|| !-[WFBackgroundShortcutRunner shortcutShouldShowRunningProgress](self, "shortcutShouldShowRunningProgress"))
  {
    return 0;
  }
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfacePresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)applicationWillLaunchInForeground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isEqual:", v9));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInterfacePresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBackgroundShortcutRunner currentRunningContext](self, "currentRunningContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationWillLaunchInForegroundForRunningContext:isLastAction:", v12, v13);

}

- (WFDialogTransformer)dialogTransformer
{
  WFDialogTransformer *dialogTransformer;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFUIPresenter *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  WFUIPresenterLocalConnection *v21;
  void *v22;
  void *v23;
  WFUIPresenterLocalConnection *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  WFUIPresenterXPCConnection *v32;
  WFDialogTransformer *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  WFDialogTransformer *v40;
  WFDialogTransformer *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  WFUIPresenterXPCConnection *v49;
  void *v50;
  void *v51;

  dialogTransformer = self->_dialogTransformer;
  if (dialogTransformer)
    return dialogTransformer;
  -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteDialogPresenterEndpoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "presentationMode");

      if (v26 == 3)
      {
        v12 = 0;
        goto LABEL_5;
      }
      +[WFUIPresenter defaultPresenter](WFUIPresenter, "defaultPresenter");
      v15 = (WFUIPresenter *)objc_claimAutoreleasedReturnValue();
      -[WFUIPresenter setDelegate:](v15, "setDelegate:", self);
LABEL_20:
      v12 = 0;
      goto LABEL_26;
    }
    -[WFBackgroundShortcutRunner siriOptions](self, "siriOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "disableSiriBehavior") & 1) != 0)
    {
      LOBYTE(v19) = 1;
      LOBYTE(v20) = 1;
      if (v18)
        goto LABEL_17;
    }
    else
    {
      -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v27, "handlesDialogRequests");

      if (v18)
      {
        if (v19)
        {
          LOBYTE(v20) = 1;
          goto LABEL_17;
        }
LABEL_22:
        v15 = 0;
LABEL_23:
        v29 = objc_alloc(MEMORY[0x1E0DC7B28]);
        -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "remoteDialogPresenterEndpoint");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (WFUIPresenterXPCConnection *)objc_msgSend(v29, "initWithEndpoint:", v31);

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B20]), "initWithConnection:", v32);
LABEL_24:

        goto LABEL_25;
      }
    }
    -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v28, "handlesDialogRequests");

    if ((v19 & 1) != 0)
    {
LABEL_17:
      +[WFUIPresenter defaultPresenter](WFUIPresenter, "defaultPresenter");
      v15 = (WFUIPresenter *)objc_claimAutoreleasedReturnValue();
      -[WFUIPresenter setDelegate:](v15, "setDelegate:", self);
      if ((v20 & 1) == 0)
      {
        v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (!v20)
    {
      v49 = [WFUIPresenterXPCConnection alloc];
      -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "remoteDialogPresenterEndpoint");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[WFUIPresenterXPCConnection initWithEndpoint:](v49, "initWithEndpoint:", v51);

      v15 = -[WFUIPresenter initWithConnection:]([WFUIPresenter alloc], "initWithConnection:", v32);
      v12 = 0;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriInteractions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v21 = [WFUIPresenterLocalConnection alloc];
    -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBackgroundShortcutRunner createTestUIPresenterInterfaceForTestCase:](self, "createTestUIPresenterInterfaceForTestCase:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFUIPresenterLocalConnection initWithPresenter:](v21, "initWithPresenter:", v23);

    v15 = -[WFUIPresenter initWithConnection:]([WFUIPresenter alloc], "initWithConnection:", v24);
    goto LABEL_20;
  }
  v8 = objc_alloc(MEMORY[0x1E0DC7D30]);
  -[WFBackgroundShortcutRunner currentTestCase](self, "currentTestCase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBackgroundShortcutRunner createTestSiriUIPresenterInterfaceForTestCase:](self, "createTestSiriUIPresenterInterfaceForTestCase:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithPresenter:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B20]), "initWithConnection:", v11);
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "runningContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldForwardSiriActionRequests:", 1);

LABEL_5:
  v15 = 0;
LABEL_26:
  v33 = [WFDialogTransformer alloc];
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "workflow");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "runSource");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "runningContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[WFDialogTransformer initWithWorkflow:userInterfacePresenter:runSource:runningContext:](v33, "initWithWorkflow:userInterfacePresenter:runSource:runningContext:", v35, v15, v37, v39);
  v41 = self->_dialogTransformer;
  self->_dialogTransformer = v40;

  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer setDelegate:](self->_dialogTransformer, "setDelegate:", v42);

  -[WFDialogTransformer setExternalUIPresenter:](self->_dialogTransformer, "setExternalUIPresenter:", v12);
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "runViewSource");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer setRunViewSource:](self->_dialogTransformer, "setRunViewSource:", v44);

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer setAllowsHandoff:](self->_dialogTransformer, "setAllowsHandoff:", objc_msgSend(v45, "allowsHandoff"));

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogTransformer setPresentationMode:](self->_dialogTransformer, "setPresentationMode:", objc_msgSend(v46, "presentationMode"));

  -[WFBackgroundShortcutRunner siriOptions](self, "siriOptions");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    -[WFDialogTransformer setSiriOptions:](self->_dialogTransformer, "setSiriOptions:", v47);

  dialogTransformer = self->_dialogTransformer;
  return dialogTransformer;
}

- (void)presenterWillShowRequest:(id)a3 runningContext:(id)a4
{
  -[WFBackgroundShortcutRunner performWithRunningProgressSuppressionStateMachine:](self, "performWithRunningProgressSuppressionStateMachine:", &__block_literal_global_270, a4);
}

- (void)presenterRequestedWorkflowStopForContext:(id)a3
{
  -[WFBackgroundShortcutRunner stopWithError:](self, "stopWithError:", 0);
}

- (void)presenterRequestedWorkflowPauseForContext:(id)a3 dialogRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;

  v5 = a3;
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "runningContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  v8 = v7;
  if (v8 == v10)
  {

  }
  else
  {
    if (!v10 || !v8)
    {

      goto LABEL_9;
    }
    v9 = objc_msgSend(v10, "isEqual:", v8);

    if ((v9 & 1) == 0)
      goto LABEL_9;
  }
  -[WFBackgroundShortcutRunner pauseWorkflowAndWriteStateToDisk:](self, "pauseWorkflowAndWriteStateToDisk:", v10);
LABEL_9:

}

- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke;
  v10[3] = &unk_1E7AEC1A0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WFBackgroundShortcutRunner performWithHost:](self, "performWithHost:", v10);

}

- (WFRemoteExecutionFileCoordinator)fileCoordinator
{
  WFRemoteExecutionFileCoordinator *fileCoordinator;
  WFRemoteExecutionFileCoordinator *v4;
  WFRemoteExecutionFileCoordinator *v5;

  fileCoordinator = self->_fileCoordinator;
  if (!fileCoordinator)
  {
    v4 = (WFRemoteExecutionFileCoordinator *)objc_opt_new();
    v5 = self->_fileCoordinator;
    self->_fileCoordinator = v4;

    fileCoordinator = self->_fileCoordinator;
  }
  return fileCoordinator;
}

- (WFRemoteExecutionCoordinator)remoteExecutionCoordinator
{
  WFRemoteExecutionCoordinator *remoteExecutionCoordinator;
  WFRemoteExecutionCoordinator *v4;
  WFRemoteExecutionCoordinator *v5;

  remoteExecutionCoordinator = self->_remoteExecutionCoordinator;
  if (!remoteExecutionCoordinator)
  {
    +[WFRemoteExecutionCoordinator sharedCoordinator](WFRemoteExecutionCoordinator, "sharedCoordinator");
    v4 = (WFRemoteExecutionCoordinator *)objc_claimAutoreleasedReturnValue();
    v5 = self->_remoteExecutionCoordinator;
    self->_remoteExecutionCoordinator = v4;

    remoteExecutionCoordinator = self->_remoteExecutionCoordinator;
  }
  return remoteExecutionCoordinator;
}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFRemoteExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[WFBackgroundShortcutRunner handleIncomingFileForRemoteExecutionWithURL:withIdentifier:]";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Incoming file with id: %@, at fileURL: %@", (uint8_t *)&v10, 0x20u);
  }

  -[WFBackgroundShortcutRunner fileCoordinator](self, "fileCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFile:withIdentifier:", v6, v7);

}

- (void)sendResponseForRunRequest:(id)a3 controller:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  WFRemoteExecutionRunRequestResponse *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  getWFRemoteExecutionLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v29 = "-[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:]";
    v30 = 2114;
    v31 = v15;
    v32 = 2114;
    v33 = v12;
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_INFO, "%s <%{public}@> preparing to send response, error: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v10, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = [WFRemoteExecutionRunRequestResponse alloc];
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "output");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[WFRemoteExecutionRunRequestResponse initWithRunRequestIdentifier:variables:output:error:](v17, "initWithRunRequestIdentifier:variables:output:error:", v18, 0, v19, v12);

    -[WFBackgroundShortcutRunner remoteExecutionCoordinator](self, "remoteExecutionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setCoordinator:](v20, "setCoordinator:", v21);

    v22 = objc_alloc_init(MEMORY[0x1E0D82B98]);
    v27 = 0;
    -[NSObject writeTo:error:](v20, "writeTo:error:", v22, &v27);
    v23 = v27;
    objc_msgSend(v22, "immutableData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[WFBackgroundShortcutRunner remoteExecutionCoordinator](self, "remoteExecutionCoordinator");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "immutableData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sendRunRequestResponse:completion:](v25, "sendRunRequestResponse:completion:", v26, v13);

    }
    else
    {
      getWFRemoteExecutionLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:]";
        v30 = 2114;
        v31 = v23;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_FAULT, "%s An error occurred while writing the run request data %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:]";
      _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s Unable to send response for run request because the run request did not have an identifier", buf, 0xCu);
    }
  }

}

- (void)getContextualActionsForContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createActionsWithIdentifiers:serializedParameterArray:", MEMORY[0x1E0C9AA60], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "contextualActionsForSurface:", objc_msgSend(v5, "surface", (_QWORD)v16));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  v6[2](v6, v9, 0);
}

- (void)filterContextualActions:(id)a3 forContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id obj;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v7 = a4;
  v27 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0D13EA8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = v7;
  objc_msgSend(v7, "files");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0D13F78];
        objc_msgSend(v13, "fileURL", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0DC7B30];
        objc_msgSend(v13, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "typeWithString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fileWithURL:options:ofType:", v15, 8, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addFile:", v20);
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  objc_msgSend(v26, "if_map:", &__block_literal_global_283);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createActionsWithIdentifiers:serializedParameterArray:", v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_2;
  v30[3] = &unk_1E7AEC208;
  v31 = v26;
  v32 = v8;
  v24 = v8;
  v25 = v26;
  objc_msgSend(v23, "if_mapAsynchronously:completionHandler:", v30, v27);

}

- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  WFFinderImageResizer *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = a4;
  v8 = a5;
  v9 = objc_alloc_init(WFFinderImageResizer);
  v10 = objc_alloc_init(MEMORY[0x1E0D13EA8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)MEMORY[0x1E0D13F78];
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "fileURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fileWithURL:options:", v17, 29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "addFile:", v18);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  -[WFFinderImageResizer computeResizedSizesForImages:inSizes:completion:](v9, "computeResizedSizesForImages:inSizes:completion:", v10, v19, v8);
}

- (BOOL)allowIncomingRunRequest:(id)a3 withDescriptor:(id)a4 accessSpecifier:(id)a5 record:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char isKindOfClass;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t i;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v9;
  v14 = v10;
  v15 = v13;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

LABEL_6:
      LOBYTE(v18) = objc_msgSend(v11, "allowRunningTestHarnessTests");
      goto LABEL_17;
    }
  }

  v16 = v14;
  if (v16)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
    v20 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v20;
    else
      v19 = 0;
  }
  else
  {

    v19 = 0;
  }
  v21 = v19;

  objc_msgSend(v21, "action");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "associatedAppBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 && (objc_msgSend(v11, "allowBackgroundShortcutRunningWithAssociatedBundleIdentifier:", v23) & 1) != 0
    || (objc_msgSend(v11, "allowBackgroundShortcutRunning") & 1) != 0
    || (objc_msgSend(v11, "allowHomeResidentShortcutRunning") & 1) != 0)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    v25 = v16;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v25, "action");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      WFStaticContextualActionDefinitionsForSurface();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v18)
      {
        v30 = v25;
        v28 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v32 != v28)
              objc_enumerationMutation(v27);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "isEqual:", v26) & 1) != 0)
            {
              LOBYTE(v18) = 1;
              goto LABEL_31;
            }
          }
          v18 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v18)
            continue;
          break;
        }
LABEL_31:
        v25 = v30;
      }

    }
    else
    {

      LOBYTE(v18) = 0;
    }

  }
LABEL_17:

  return v18;
}

- (void)performWithHost:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WFBackgroundShortcutRunner_performWithHost___block_invoke;
  v7[3] = &unk_1E7AF76F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)synchronouslyPerformWithHost:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[WFBackgroundShortcutRunner queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WFBackgroundShortcutRunner_synchronouslyPerformWithHost___block_invoke;
  block[3] = &unk_1E7AF76F0;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

- (void)performWithRunningProgressSuppressionStateMachine:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__WFBackgroundShortcutRunner_performWithRunningProgressSuppressionStateMachine___block_invoke;
  v7[3] = &unk_1E7AF76F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)synchronouslyPerformWithRunningProgressSuppressionStateMachine:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[WFBackgroundShortcutRunner queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[WFBackgroundShortcutRunner queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__WFBackgroundShortcutRunner_synchronouslyPerformWithRunningProgressSuppressionStateMachine___block_invoke;
  block[3] = &unk_1E7AF76F0;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

- (id)queue_runningProgressSuppressionStateMachine
{
  NSObject *v3;

  -[WFBackgroundShortcutRunner queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_runningProgressSuppressionStateMachine;
}

- (void)workflowControllerWillRun:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFXPCRunnerLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFBackgroundShortcutRunner workflowControllerWillRun:]";
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEBUG, "%s Workflow controller starting for workflow: %@", buf, 0x16u);

  }
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribution");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v4, "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentAction:", v13);

  }
  objc_msgSend(v4, "input");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requiredResourcesForContent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v18 = objc_msgSend(v17, "requestSandboxExtensionForRunningActionWithAccessResources:error:", v16, &v27);
    v19 = v27;

    if ((v18 & 1) == 0)
    {
      getWFSecurityLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFBackgroundShortcutRunner workflowControllerWillRun:]";
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s Error consuming sandbox resources %@ required to access shortcut input. The shortcut might have trouble accessing its input.", buf, 0x16u);
      }

    }
  }
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "workflowWillBegin");

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __56__WFBackgroundShortcutRunner_workflowControllerWillRun___block_invoke;
  v24[3] = &unk_1E7AEC270;
  v24[4] = self;
  v25 = v8;
  v26 = v4;
  v22 = v4;
  v23 = v8;
  -[WFBackgroundShortcutRunner performWithHost:](self, "performWithHost:", v24);

}

- (void)workflowController:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4 forAction:(id)a5
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__WFBackgroundShortcutRunner_workflowController_didDecideRunningProgressIsAllowed_forAction___block_invoke;
  v5[3] = &__block_descriptor_33_e50_v16__0__WFRunningProgressSuppressionStateMachine_8l;
  v6 = a4;
  -[WFBackgroundShortcutRunner performWithRunningProgressSuppressionStateMachine:](self, "performWithRunningProgressSuppressionStateMachine:", v5, a4, a5);
}

- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  _BOOL4 v13;
  char *v14;
  char *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  WFBackgroundShortcutRunner *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    getWFRunningLifecycleLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "workflow");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v11;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "Shortcut %@ was cancelled.", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v12 = v9;
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFRunningLifecycleLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        objc_msgSend(v8, "workflow");
        v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412547;
        v44 = v14;
        v45 = 2113;
        v46 = v9;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "Shortcut %@ failed with error %{private}@.", buf, 0x16u);

      }
    }
    else
    {
      if (v13)
      {
        objc_msgSend(v8, "workflow");
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "output");
        v16 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412547;
        v44 = v15;
        v45 = 2113;
        v46 = v16;
        _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "Shortcut %@ has finished running with output: %{private}@.", buf, 0x16u);

      }
      v9 = 0;
    }
  }

  -[WFBackgroundShortcutRunner testingHarnessErrorForWorkflowFinishedError:](self, "testingHarnessErrorForWorkflowFinishedError:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke;
  aBlock[3] = &unk_1E7AEC2B8;
  v19 = v8;
  v41 = v19;
  v42 = self;
  v37[0] = v18;
  v37[1] = 3221225472;
  v37[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_298;
  v37[3] = &unk_1E7AF6358;
  v20 = _Block_copy(aBlock);
  v39 = v20;
  v37[4] = self;
  v21 = v19;
  v38 = v21;
  v22 = _Block_copy(v37);
  if (-[WFBackgroundShortcutRunner environment](self, "environment") == 4)
  {
    -[WFBackgroundShortcutRunner currentRemoteExecutionRunRequest](self, "currentRemoteExecutionRunRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v18;
    v34[1] = 3221225472;
    v34[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_5;
    v34[3] = &unk_1E7AF76F0;
    v36 = v22;
    v35 = v17;
    -[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:](self, "sendResponseForRunRequest:controller:error:completion:", v23, v21, v35, v34);

  }
  else if (((objc_msgSend(v17, "wf_isUnsupportedUserInterfaceError") & 1) != 0
          || objc_msgSend(v17, "wf_isUnsupportedEnvironmentError"))
         && (objc_msgSend(v21, "runningContext"),
             v24 = (void *)objc_claimAutoreleasedReturnValue(),
             v25 = objc_msgSend(v24, "isShortcutsApp"),
             v24,
             (v25 & 1) == 0))
  {
    objc_msgSend(v21, "runningContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copyWithNewIdentity");

    objc_msgSend(v21, "currentStateWithContext:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "runSource");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v31[0] = v18;
      v31[1] = 3221225472;
      v31[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_6;
      v31[3] = &unk_1E7AF76F0;
      v32 = 0;
      v33 = v22;
      -[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:](self, "launchAppToContinueFromState:runSource:withCompletion:", v28, v29, v31);

      v30 = v33;
    }
    else
    {
      getWFXPCRunnerLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]";
        _os_log_impl(&dword_1C15B3000, v30, OS_LOG_TYPE_FAULT, "%s Need to handoff, but workflow controller state is nil", buf, 0xCu);
      }
    }

  }
  else
  {
    (*((void (**)(void *, void *))v22 + 2))(v22, v17);
  }

}

- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  WFDialogTransformer *dialogTransformer;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  void *v24;
  id v25;
  id v26;
  void *v27;
  Class v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  WFBackgroundShortcutRunner *v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  getWFRunningLifecycleLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v13;
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "Running action %{public}@", buf, 0xCu);

  }
  getWFRunningLifecycleLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v14, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFFuLL, "UntilFirstAction", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v9, "workflow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "indexOfObject:", v10);

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    dialogTransformer = self->_dialogTransformer;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDialogTransformer willBeginExecutingShortcutStep:](dialogTransformer, "willBeginExecutingShortcutStep:", v19);

  }
  v20 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke;
  aBlock[3] = &unk_1E7AF8378;
  v21 = v10;
  v40 = v21;
  v41 = self;
  v22 = v11;
  v42 = v22;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCurrentAction:", v21);

  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_3;
  v36[3] = &unk_1E7AEC358;
  v25 = v21;
  v37 = v25;
  v26 = v9;
  v38 = v26;
  -[WFBackgroundShortcutRunner performWithRunningProgressSuppressionStateMachine:](self, "performWithRunningProgressSuppressionStateMachine:", v36);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "resignIssuedExtensionsWithReason:", CFSTR("Runner running Run Workflow"));

    v23[2](v23);
  }
  else
  {
    v28 = NSClassFromString(CFSTR("WFHealthKitResource"));
    if (!v28
      || (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), v28, 0),
          (v29 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "resourceManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "resourceObjectsOfClasses:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "if_compactMap:", &__block_literal_global_317);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v20;
    v34[1] = 3221225472;
    v34[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_5;
    v34[3] = &unk_1E7AF64E8;
    v35 = v23;
    objc_msgSend(v33, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v32, v34);

  }
}

- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  char *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  WFActionDidRunTestingEvent *v22;
  void *v23;
  WFActionDidRunTestingEvent *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  void (**v38)(_QWORD);
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  _BYTE v47[14];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  getWFRunningLifecycleLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "description");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "output");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v15;
    v46 = 1026;
    *(_DWORD *)v47 = v12 != 0;
    *(_WORD *)&v47[4] = 2112;
    *(_QWORD *)&v47[6] = v16;
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "Action finished running %{public}@, error: %{BOOL,public}d, output: %@.", buf, 0x1Cu);

  }
  if (-[WFBackgroundShortcutRunner isStepwiseExecution](self, "isStepwiseExecution"))
  {
    v34 = v10;
    getWFRunningLifecycleLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[WFBackgroundShortcutRunner workflowController:didRunAction:error:completionHandler:]";
      v46 = 2112;
      *(_QWORD *)v47 = v12;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEFAULT, "%s [Step-wise] Sending action result (error: %@) out", buf, 0x16u);
    }

    objc_msgSend(v11, "outputVariableWithVariableProvider:UUIDProvider:", v11, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0DC7B18]);
    v20 = v11;
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v26 = v21;

    objc_msgSend(v26, "undoContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v20;
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    v31 = objc_msgSend(v30, "didRunOpensIntent");
    v32 = (void *)objc_msgSend(v19, "initWithUndoContext:didRunOpensIntent:", v27, v31);

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke;
    v39[3] = &unk_1E7AEC3A0;
    v40 = v28;
    v41 = v12;
    v42 = v18;
    v43 = v32;
    v33 = v28;
    v25 = v32;
    v24 = v18;
    -[WFBackgroundShortcutRunner performWithHost:](self, "performWithHost:", v39);
    v13[2](v13);

    v10 = v34;
  }
  else
  {
    v22 = [WFActionDidRunTestingEvent alloc];
    objc_msgSend(v11, "output");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WFActionDidRunTestingEvent initWithAction:output:error:](v22, "initWithAction:output:error:", v11, v23, v12);

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_2;
    v35[3] = &unk_1E7AEC4C8;
    v35[4] = self;
    v38 = v13;
    v36 = v11;
    v37 = v10;
    v25 = v11;
    -[WFBackgroundShortcutRunner handleTestingEventIfTesting:completionHandler:](self, "handleTestingEventIfTesting:completionHandler:", v24, v35);

  }
}

- (void)workflowController:(id)a3 actionDidRequestWorkflowExit:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  getWFRunningLifecycleLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requested shortcut exit.", (uint8_t *)&v7, 0xCu);

  }
}

- (BOOL)workflowController:(id)a3 handleUnsupportedUserInterfaceForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  char *v14;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  v10 = -[WFBackgroundShortcutRunner isRunningWithSiriUI](self, "isRunningWithSiriUI");
  getWFRunningLifecycleLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[WFBackgroundShortcutRunner workflowController:handleUnsupportedUserInterfaceForAction:currentState:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s Using new punch out logic", buf, 0xCu);
    }

    v11 = objc_alloc_init(MEMORY[0x1E0DC7D18]);
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke;
    v16[3] = &unk_1E7AEC430;
    v16[4] = self;
    v17 = v9;
    objc_msgSend(v13, "performSiriRequest:completionHandler:", v11, v16);

  }
  else if (v12)
  {
    objc_msgSend(v8, "description");
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v14;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ is not supported in the current user interface.", buf, 0xCu);

  }
  return v10;
}

- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  getWFRunningLifecycleLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v15;
    _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ is not supported in the current environment.", (uint8_t *)&v19, 0xCu);

  }
  if (-[WFBackgroundShortcutRunner environment](self, "environment") == 4)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v10, "runSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = WFRemoteExecuteActionIfApplicable(v11, v12, self, self, v17, v13);

  }
  return v16;
}

- (void)workflowController:(id)a3 requestToQuarantineWorkflow:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "quarantineWorkflowWithReference:", v5);
}

- (id)remoteDialogPresenterEndpointForController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfacePresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  return 1;
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (-[WFBackgroundShortcutRunner isInRemoteExecutionEnvironment](self, "isInRemoteExecutionEnvironment"))
  {
    -[WFBackgroundShortcutRunner sendRemoteAskWhenRunRequestWithParameters:action:completion:](self, "sendRemoteAskWhenRunRequestWithParameters:action:completion:", v12, v17, v15);
  }
  else
  {
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "action:provideInputForParameters:withDefaultStates:prompts:completionHandler:", v17, v12, v13, v14, v15);

  }
}

- (id)workflowController:(id)a3 actionReversalStateForAction:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[WFBackgroundShortcutRunner workflowController](self, "workflowController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= 1)
  {
    -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v10, "action");
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

      objc_msgSend(v13, "reversalState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)workflowController:(id)a3 didGenerateReversalState:(id)a4 forAction:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[WFBackgroundShortcutRunner actionReversalStates](self, "actionReversalStates");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)workflowController:(id)a3 handleTestingEvent:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__WFBackgroundShortcutRunner_workflowController_handleTestingEvent_completionHandler___block_invoke;
  v9[3] = &unk_1E7AEC458;
  v10 = v7;
  v8 = v7;
  -[WFBackgroundShortcutRunner handleTestingEventIfTesting:completionHandler:](self, "handleTestingEventIfTesting:completionHandler:", a4, v9);

}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x1E0D14320];
}

- (BOOL)requestedFromAnotherDevice
{
  return -[WFBackgroundShortcutRunner environment](self, "environment") == 4;
}

- (BOOL)requestedInHomeResident
{
  return -[WFBackgroundShortcutRunner environment](self, "environment") == 1;
}

- (void)presentAlert:(id)a3
{
  id v4;
  NSObject *v5;
  WFRemoteExecutionAlertRequest *v6;
  void *v7;
  void *v8;
  WFRemoteExecutionAlertRequest *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WFBackgroundShortcutRunner environment](self, "environment") == 4)
  {
    getWFXPCRunnerLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFBackgroundShortcutRunner presentAlert:]";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_INFO, "%s Trying to present an alert in a remote execution environment, going to send to originating device", buf, 0xCu);
    }

    v6 = [WFRemoteExecutionAlertRequest alloc];
    -[WFBackgroundShortcutRunner currentRemoteExecutionRunRequest](self, "currentRemoteExecutionRunRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFRemoteExecutionAlertRequest initWithAlert:associatedRunRequestIdentifier:](v6, "initWithAlert:associatedRunRequestIdentifier:", v4, v8);

    -[WFBackgroundShortcutRunner remoteExecutionCoordinator](self, "remoteExecutionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__WFBackgroundShortcutRunner_presentAlert___block_invoke;
    v12[3] = &unk_1E7AEC480;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v10, "sendAlertRequest:completion:", v9, v12);

  }
  else
  {
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentAlert:", v4);

  }
}

- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestActionInterfacePresentationForActionClassName:classNamesByType:completionHandler:", v10, v9, v8);

}

- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showConfirmInteraction:prompt:requireAuthentication:completionHandler:", v12, v11, v6, v10);

}

- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showHandleInteraction:prompt:completionHandler:", v10, v9, v8);

}

- (void)showPreviewForContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showPreviewForContentCollection:completionHandler:", v7, v6);

}

- (void)showLinkActionConfirmationWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialog:(id)a5 dialogString:(id)a6 viewSnippet:(id)a7 confirmationActionName:(id)a8 isContinueInAppRequest:(BOOL)a9 completionHandler:(id)a10
{
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;

  v14 = a4;
  v17 = a10;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = a9;
  objc_msgSend(v24, "showLinkActionConfirmationWithActionMetadata:showPrompt:dialog:dialogString:viewSnippet:confirmationActionName:isContinueInAppRequest:completionHandler:", v22, v14, v21, v20, v19, v18, v23, v17);

}

- (void)showLinkParameterConfirmationWithActionMetadata:(id)a3 dialog:(id)a4 dialogString:(id)a5 viewSnippet:(id)a6 parameterValue:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "showLinkParameterConfirmationWithActionMetadata:dialog:dialogString:viewSnippet:parameterValue:completionHandler:", v19, v18, v17, v16, v15, v14);

}

- (void)showLinkResult:(id)a3 dialog:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showLinkResult:dialog:completionHandler:", v10, v9, v8);

}

- (void)showChronoControlOfType:(unint64_t)a3 identity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showChronoControlOfType:identity:completionHandler:", a3, v9, v8);

}

- (void)getEnvironmentForLinkViewSnippetWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getEnvironmentForLinkViewSnippetWithCompletion:", v4);

}

- (void)getPreferredSizeForLinkViewSnippetWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPreferredSizeForLinkViewSnippetWithCompletion:", v4);

}

- (void)presentAlertWithSmartPromptConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WFSmartPromptDialogRequest *v8;
  void *v9;
  WFSmartPromptDialogRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
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
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  v6 = a4;
  v7 = a3;
  if (-[WFBackgroundShortcutRunner requestedFromAnotherDevice](self, "requestedFromAnotherDevice"))
  {
    v8 = [WFSmartPromptDialogRequest alloc];
    objc_msgSend(MEMORY[0x1E0DC7AD0], "attributionWithAppBundleIdentifier:", *MEMORY[0x1E0DC7FD8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFSmartPromptDialogRequest initWithConfiguration:attribution:](v8, "initWithConfiguration:attribution:", v7, v9);

    objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[WFDialogRequest promptForDisplay](v10, "promptForDisplay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workflowName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessage:", v15);

    -[WFSmartPromptDialogRequest allowOnceButton](v10, "allowOnceButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = MEMORY[0x1E0C809B0];
    if (v16)
    {
      v18 = (void *)MEMORY[0x1E0D13DE8];
      -[WFSmartPromptDialogRequest allowOnceButton](v10, "allowOnceButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v17;
      v37[1] = 3221225472;
      v37[2] = __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke;
      v37[3] = &unk_1E7AF8F48;
      v38 = v6;
      objc_msgSend(v18, "buttonWithTitle:style:handler:", v20, 0, v37);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addButton:", v21);
    }
    -[WFSmartPromptDialogRequest allowAlwaysButton](v10, "allowAlwaysButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0D13DE8];
      -[WFSmartPromptDialogRequest allowAlwaysButton](v10, "allowAlwaysButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v17;
      v35[1] = 3221225472;
      v35[2] = __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_2;
      v35[3] = &unk_1E7AF8F48;
      v36 = v6;
      objc_msgSend(v23, "buttonWithTitle:style:handler:", v25, 0, v35);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addButton:", v26);
    }
    -[WFSmartPromptDialogRequest denyButton](v10, "denyButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = (void *)MEMORY[0x1E0D13DE8];
      -[WFSmartPromptDialogRequest denyButton](v10, "denyButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v17;
      v33[1] = 3221225472;
      v33[2] = __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_3;
      v33[3] = &unk_1E7AF8F48;
      v34 = v6;
      objc_msgSend(v28, "buttonWithTitle:style:handler:", v30, 1, v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addButton:", v31);
    }
    -[WFBackgroundShortcutRunner presentAlert:](self, "presentAlert:", v11);

  }
  else
  {
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "presentAlertWithSmartPromptConfiguration:completionHandler:", v7, v6);

  }
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPresentedContentWithCompletionHandler:", v4);

}

- (void)resolveDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolveDescriptor:completionHandler:", v7, v6);

}

- (void)handleAppProtectionRequestWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleAppProtectionRequestWithBundleIdentifier:completionHandler:", v7, v6);

}

- (BOOL)isInRemoteExecutionEnvironment
{
  return -[WFBackgroundShortcutRunner environment](self, "environment") == 4;
}

- (void)pauseWorkflowAndWriteStateToDisk:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFBackgroundShortcutRunner synchronouslyPerformWithHost:](self, "synchronouslyPerformWithHost:", &__block_literal_global_344);
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishRunningState:", 3);

  WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v9 = objc_msgSend(v8, "writeToURL:error:", v6, &v14);
    v10 = v14;

    if ((v9 & 1) == 0)
    {
      getWFXPCRunnerLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[WFBackgroundShortcutRunner pauseWorkflowAndWriteStateToDisk:]";
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Failed to write current workflow controller state to disk because of %@", buf, 0x16u);
      }

    }
    v12 = dispatch_time(0, 500000000);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__WFBackgroundShortcutRunner_pauseWorkflowAndWriteStateToDisk___block_invoke_345;
    v13[3] = &unk_1E7AF94B0;
    v13[4] = self;
    dispatch_after(v12, MEMORY[0x1E0C80D38], v13);
  }
  else
  {
    getWFXPCRunnerLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFBackgroundShortcutRunner pauseWorkflowAndWriteStateToDisk:]";
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Unable to get destination URL from context: %@", buf, 0x16u);
    }
  }

}

- (BOOL)shouldNotHandoff
{
  void *v3;
  void *v4;
  int v5;

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsHandoff") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestAuthorizationWithConfiguration:completionHandler:", v7, v6);

}

- (void)requestFileAccessForURLs:(id)a3 workflowName:(id)a4 workflowID:(id)a5 completionHandler:(id)a6
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
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestFileAccessForURLs:workflowName:workflowID:completionHandler:", v13, v12, v11, v10);

}

- (BOOL)isRunningWithSiriUI
{
  void *v2;
  char v3;

  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningWithSiriUI");

  return v3;
}

- (BOOL)isRunningWithExternalUI
{
  void *v2;
  char v3;

  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningWithExternalUI");

  return v3;
}

- (BOOL)isRunningWithToolKitClient
{
  void *v2;
  char v3;

  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningWithToolKitClient");

  return v3;
}

- (id)siriOptions
{
  void *v2;
  void *v3;

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "options");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)executionContext
{
  void *v2;
  void *v3;
  int64_t v4;

  -[WFBackgroundShortcutRunner siriOptions](self, "siriOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "executionContext");
  else
    v4 = 0;

  return v4;
}

- (NSArray)airPlayRouteIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[WFBackgroundShortcutRunner siriOptions](self, "siriOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "airPlayRouteIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)configureIntent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[WFBackgroundShortcutRunner isRunningWithSiriUI](self, "isRunningWithSiriUI"))
  {
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureIntent:", v5);

  }
}

- (BOOL)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "performSiriRequest:completionHandler:", v7, v6);

  return v9;
}

- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  WFActionWillOpenURLTestingEvent *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = -[WFActionWillOpenURLTestingEvent initWithAction:URL:bundleIdentifier:]([WFActionWillOpenURLTestingEvent alloc], "initWithAction:URL:bundleIdentifier:", v12, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__WFBackgroundShortcutRunner_openURL_withBundleIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E7AEC4C8;
    v18 = v10;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    -[WFBackgroundShortcutRunner handleTestingEventIfTesting:completionHandler:](self, "handleTestingEventIfTesting:completionHandler:", v13, v15);

  }
  else
  {
    -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "openURL:withBundleIdentifier:completionHandler:", v8, v9, v10);

  }
}

- (void)didStartActionWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStartActionWithIdentifier:", v4);

}

- (void)didFinishActionWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFBackgroundShortcutRunner dialogTransformer](self, "dialogTransformer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishActionWithIdentifier:", v4);

}

- (void)sendRemoteAskWhenRunRequestWithParameters:(id)a3 action:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6937;
  v21[4] = __Block_byref_object_dispose__6938;
  v22 = (id)objc_opt_new();
  objc_msgSend(v8, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke;
  v18[3] = &unk_1E7AEC540;
  v18[4] = self;
  v13 = v9;
  v19 = v13;
  v20 = v21;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_3;
  v15[3] = &unk_1E7AF14C8;
  v17 = v21;
  v14 = v10;
  v16 = v14;
  objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v18, v15);

  _Block_object_dispose(v21, 8);
}

- (void)sendDialogRequestForParameter:(id)a3 action:(id)a4 dialogRequest:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  +[WFRemoteExecutionCoordinator sharedCoordinator](WFRemoteExecutionCoordinator, "sharedCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__WFBackgroundShortcutRunner_sendDialogRequestForParameter_action_dialogRequest_completion___block_invoke;
  v17[3] = &unk_1E7AEC568;
  v19 = v10;
  v20 = v11;
  v18 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v9;
  objc_msgSend(v13, "sendDialogRequest:completion:", v12, v17);

}

- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "progress");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "fractionCompleted");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7, 0);

}

- (BOOL)launchAppToContinueFromState:(id)a3 runSource:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBackgroundShortcutRunner.m"), 1886, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFXPCRunnerLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]";
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_DEFAULT, "%s Launching Shortcuts app to continue running", buf, 0xCu);
  }

  if (-[WFBackgroundShortcutRunner environment](self, "environment") == 1)
  {
    getWFXPCRunnerLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]";
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s Can't open app from resident device", buf, 0xCu);
    }
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    getWFXPCRunnerLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[WFBackgroundShortcutRunner workflowController](self, "workflowController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]";
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_ERROR, "%s failed to get state from controller (%@)", buf, 0x16u);

    }
    goto LABEL_15;
  }
  if (v10)
    v14 = v10;
  else
    v14 = (id)*MEMORY[0x1E0DC8458];
  +[WFHandoffSimulator userActivityForContinuingWorkflowWithState:fromSource:](WFHandoffSimulator, "userActivityForContinuingWorkflowWithState:fromSource:", v9, v14);
  v13 = objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0D13E10]);
  v16 = (void *)objc_msgSend(v15, "initWithBundleIdentifier:options:URL:userActivity:", *MEMORY[0x1E0DC7FD8], 0, 0, v13);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__WFBackgroundShortcutRunner_launchAppToContinueFromState_runSource_withCompletion___block_invoke;
  v21[3] = &unk_1E7AF8860;
  v22 = v11;
  objc_msgSend(v16, "performWithCompletionHandler:", v21);

  v17 = 1;
LABEL_16:

  return v17;
}

- (id)metricsRunSourceFromEnvironment:(int64_t)a3 runSource:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  id v11;

  v5 = a4;
  v6 = v5;
  v7 = *MEMORY[0x1E0DC84D8];
  if (v5)
    v8 = v5;
  else
    v8 = (void *)*MEMORY[0x1E0DC84D8];
  v9 = v8;
  v10 = objc_msgSend(v9, "isEqualToString:", v7);
  if ((unint64_t)(a3 - 1) <= 3 && v10)
  {
    v11 = **((id **)&unk_1E7AEC5B0 + a3 - 1);

    v9 = v11;
  }

  return v9;
}

- (BOOL)isStepwiseExecution
{
  void *v2;
  char v3;

  -[WFBackgroundShortcutRunner currentRunRequest](self, "currentRunRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStepwise");

  return v3;
}

- (void)evaluateRemoteQuarantinePolicyForWorkflow:(id)a3 workflowReference:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  WFWorkflowRemoteQuarantineRequest *v34;
  void *v35;
  WFWorkflowRemoteQuarantineRequest *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  os_signpost_id_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFWorkflowExecutionLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    v13 = os_signpost_id_generate(v11);

    getWFWorkflowExecutionLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoteQuarantineEvaluation", ", buf, 2u);
    }

    getWFWorkflowExecutionLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
      v45 = 2112;
      v46 = v18;
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Evaluating remote quarantine policy for workflow %@", buf, 0x16u);

    }
    +[WFRemoteQuarantinePolicyEvaluator sharedEvaluator](WFRemoteQuarantinePolicyEvaluator, "sharedEvaluator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "remoteQuarantineHashForWorkflowReference:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "remoteQuarantineStatus") == 2)
    {
      getWFWorkflowExecutionLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
        v45 = 2112;
        v46 = v22;
        _os_log_impl(&dword_1C15B3000, v21, OS_LOG_TYPE_INFO, "%s Skipping remote quarantine policy evaluation for workflow %@, since it has been explicitly allowed by the user.", buf, 0x16u);

      }
      getWFWorkflowExecutionLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23))
        goto LABEL_23;
      *(_WORD *)buf = 0;
    }
    else
    {
      objc_msgSend(v9, "remoteQuarantineHash");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToData:", v20);

      getWFWorkflowExecutionLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
      if (!v26)
      {
        if (v28)
        {
          objc_msgSend(v9, "identifier");
          v38 = v8;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "remoteQuarantineHash");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "debugDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "debugDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
          v45 = 2112;
          v46 = v31;
          v47 = 2112;
          v48 = v32;
          v49 = 2112;
          v50 = v33;
          _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_INFO, "%s Remote quarantine policy evaluation required for workflow %@: %@ != %@", buf, 0x2Au);

          v8 = v38;
        }

        v34 = [WFWorkflowRemoteQuarantineRequest alloc];
        objc_msgSend(v8, "record");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[WFWorkflowRemoteQuarantineRequest initWithWorkflowRecord:](v34, "initWithWorkflowRecord:", v35);

        objc_msgSend(v19, "setDelegate:", self);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __112__WFBackgroundShortcutRunner_evaluateRemoteQuarantinePolicyForWorkflow_workflowReference_withCompletionHandler___block_invoke;
        v39[3] = &unk_1E7AEC590;
        v42 = v13;
        v41 = v10;
        v40 = v20;
        objc_msgSend(v19, "evaluatePolicyForRequest:completion:", v36, v39);

        goto LABEL_27;
      }
      if (v28)
      {
        objc_msgSend(v9, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
        v45 = 2112;
        v46 = v29;
        _os_log_impl(&dword_1C15B3000, v27, OS_LOG_TYPE_INFO, "%s Skipping remote quarantine policy evaluation for workflow %@, since it has already been checked.", buf, 0x16u);

      }
      getWFWorkflowExecutionLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      v24 = v30;
      if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30))
      {
LABEL_23:

        (*((void (**)(id, uint64_t, void *, _QWORD))v10 + 2))(v10, 1, v20, 0);
LABEL_27:

        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v24, OS_SIGNPOST_INTERVAL_END, v13, "RemoteQuarantineEvaluation", ", buf, 2u);
    goto LABEL_23;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
    _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Skipping remote quarantine policy evaluation for workflow, since it has no database reference.", buf, 0xCu);
  }

  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v10 + 2))(v10, 1, 0, 0);
LABEL_28:

}

- (WFAssessmentModeManager)assessmentModeManager
{
  WFAssessmentModeManager *assessmentModeManager;
  WFAssessmentModeManager *v4;
  void *v5;
  WFAssessmentModeManager *v6;
  WFAssessmentModeManager *v7;

  assessmentModeManager = self->_assessmentModeManager;
  if (!assessmentModeManager)
  {
    v4 = [WFAssessmentModeManager alloc];
    -[WFBackgroundShortcutRunner queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFAssessmentModeManager initWithQueue:delegate:](v4, "initWithQueue:delegate:", v5, self);
    v7 = self->_assessmentModeManager;
    self->_assessmentModeManager = v6;

    assessmentModeManager = self->_assessmentModeManager;
  }
  return assessmentModeManager;
}

- (void)assessmentModeManagerDidBecomeActive:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[WFBackgroundShortcutRunner assessmentModeManagerDidBecomeActive:]";
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "%s Assessment Mode became active stopping workflow execution.", (uint8_t *)&v6, 0xCu);
  }

  -[WFBackgroundShortcutRunner assessmentModeActiveError](self, "assessmentModeActiveError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBackgroundShortcutRunner stopWithError:](self, "stopWithError:", v5);

}

- (id)assessmentModeActiveError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB2FE0];
  v8 = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("A shortcut cannot be run while in Assessment Mode."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2FE0];
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Unsupported runner type");
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 94, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v9, 0, v11);

}

- (void)fetchAvailableParameterStatesForEncodedValueSetDefinition:(id)a3 searchTerm:(id)a4 forEncodedToolInvocation:(id)a5 completionHandler:(id)a6
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2FE0];
  v13 = *MEMORY[0x1E0CB2D50];
  v14[0] = CFSTR("Unsupported runner type");
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a6;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 94, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a6 + 2))(v10, 0, v12);

}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2FE0];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Unsupported runner type");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 94, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v8, 0, v10);

}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2FE0];
  v13 = *MEMORY[0x1E0CB2D50];
  v14[0] = CFSTR("Unsupported runner type");
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a6;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 94, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a6 + 2))(v10, 0, v12);

}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2FE0];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Unsupported runner type");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 94, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v8, 0, v10);

}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2FE0];
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = CFSTR("Unsupported runner type");
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 94, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v9, 0, v11);

}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2FE0];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Unsupported runner type");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 94, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a4 + 2))(v8, 0, v10);

}

- (void)runToolWithInvocation:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBackgroundShortcutRunner.m"), 2039, CFSTR("-[WFBackgroundShortcutRunner runToolWithInvocation:] should be overridden by subclass"));

}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2FE0];
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = CFSTR("Unsupported runner type");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 94, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a4 + 2))(v8, v10);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setRemoteExecutionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_remoteExecutionCoordinator, a3);
}

- (void)setFileCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinator, a3);
}

- (WFRemoteExecutionRunRequest)currentRemoteExecutionRunRequest
{
  return self->_currentRemoteExecutionRunRequest;
}

- (void)setCurrentRemoteExecutionRunRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRemoteExecutionRunRequest, a3);
}

- (void)setDialogTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_dialogTransformer, a3);
}

- (BOOL)isPersonalAutomation
{
  return self->_isPersonalAutomation;
}

- (void)setIsPersonalAutomation:(BOOL)a3
{
  self->_isPersonalAutomation = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFWorkflowRunningContext)currentRunningContext
{
  return self->_currentRunningContext;
}

- (void)setCurrentRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentRunningContext, a3);
}

- (WFWorkflowReference)currentRunningWorkflowReference
{
  return self->_currentRunningWorkflowReference;
}

- (void)setCurrentRunningWorkflowReference:(id)a3
{
  objc_storeStrong((id *)&self->_currentRunningWorkflowReference, a3);
}

- (WFWorkflowRunEvent)runEvent
{
  return self->_runEvent;
}

- (void)setRunEvent:(id)a3
{
  objc_storeStrong((id *)&self->_runEvent, a3);
}

- (NSSet)dataVaultFileURLs
{
  return self->_dataVaultFileURLs;
}

- (void)setDataVaultFileURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int)lockFileFD
{
  return self->_lockFileFD;
}

- (void)setLockFileFD:(int)a3
{
  self->_lockFileFD = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSMutableDictionary)actionReversalStates
{
  return self->_actionReversalStates;
}

- (void)setActionReversalStates:(id)a3
{
  objc_storeStrong((id *)&self->_actionReversalStates, a3);
}

- (OS_dispatch_group)exitTaskGroup
{
  return self->_exitTaskGroup;
}

- (BOOL)runningProgressSuppressionMachineResolvedAndDeniedProgress
{
  return self->_runningProgressSuppressionMachineResolvedAndDeniedProgress;
}

- (void)setRunningProgressSuppressionMachineResolvedAndDeniedProgress:(BOOL)a3
{
  self->_runningProgressSuppressionMachineResolvedAndDeniedProgress = a3;
}

- (WFWorkflowRunRequest)currentRunRequest
{
  return self->_currentRunRequest;
}

- (void)setCurrentRunRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRunRequest, a3);
}

- (WFWorkflowController)workflowController
{
  return self->_workflowController;
}

- (void)setWorkflowController:(id)a3
{
  objc_storeStrong((id *)&self->_workflowController, a3);
}

- (WFBackgroundShortcutRunnerStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (VCAccessSpecifier)accessSpecifier
{
  return self->_accessSpecifier;
}

- (void)setAccessSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessSpecifier, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_workflowController, 0);
  objc_storeStrong((id *)&self->_currentRunRequest, 0);
  objc_storeStrong((id *)&self->_exitTaskGroup, 0);
  objc_storeStrong((id *)&self->_actionReversalStates, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_dataVaultFileURLs, 0);
  objc_storeStrong((id *)&self->_runEvent, 0);
  objc_storeStrong((id *)&self->_currentRunningWorkflowReference, 0);
  objc_storeStrong((id *)&self->_currentRunningContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_currentRemoteExecutionRunRequest, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteExecutionCoordinator, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_assessmentModeManager, 0);
  objc_storeStrong((id *)&self->_runningProgressSuppressionStateMachine, 0);
}

void __112__WFBackgroundShortcutRunner_evaluateRemoteQuarantinePolicyForWorkflow_workflowReference_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint8_t v8[16];

  v4 = a3;
  getWFWorkflowExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RemoteQuarantineEvaluation", ", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __84__WFBackgroundShortcutRunner_launchAppToContinueFromState_runSource_withCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]_block_invoke";
      v6 = "%s Succeeded launching Shortcuts app";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1C15B3000, v7, v8, v6, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315138;
    v12 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]_block_invoke";
    v6 = "%s Failed to open Shortcuts app to continue";
    v7 = v5;
    v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v9);
}

void __92__WFBackgroundShortcutRunner_sendDialogRequestForParameter_action_dialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
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
  WFInputtedState *v33;
  void *v34;
  WFInputtedState *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "dialogResponse");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isCancelled"))
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

    }
    else
    {
      v6 = v6;
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(a1 + 40);
        objc_msgSend(v6, "serializedParameterState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "createStateForParameter:fromSerializedRepresentation:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {

        objc_msgSend(*(id *)(a1 + 32), "parameterStateFromDialogResponse:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_msgSend(*(id *)(a1 + 32), "stateClass");
      if (v15 == objc_opt_class())
      {
        v33 = [WFInputtedState alloc];
        objc_msgSend(*(id *)(a1 + 32), "key");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[WFInputtedState initWithParameterKey:parameterState:](v33, "initWithParameterKey:parameterState:", v34, v14);

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        v36 = v5;
        getWFRemoteExecutionLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v17 = (void *)objc_opt_class();
          v18 = *(void **)(a1 + 32);
          v19 = v17;
          v20 = (void *)objc_msgSend(v18, "stateClass");
          v21 = v20;
          *(_DWORD *)buf = 136315906;
          v40 = "-[WFBackgroundShortcutRunner sendDialogRequestForParameter:action:dialogRequest:completion:]_block_invoke";
          v41 = 2112;
          v42 = v17;
          v43 = 2112;
          v44 = v20;
          v45 = 2112;
          v46 = (id)objc_opt_class();
          v22 = v46;
          _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_FAULT, "%s %@ expected a parameter state of class: %@, but received a different parameter state class: %@", buf, 0x2Au);

        }
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v37[0] = *MEMORY[0x1E0CB2D50];
        WFLocalizedString(CFSTR("Invalid parameter state"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v24;
        v37[1] = *MEMORY[0x1E0CB2D68];
        v25 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("Received invalid parameter state for action %@ and parameter %@"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "localizedName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "localizedLabel");
        v28 = v14;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringWithFormat:", v26, v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("WFBackgroundShortcutRunnerErrorDomain"), 14, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v28;
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        v5 = v36;
      }

    }
  }
  else
  {
    getWFRemoteExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFBackgroundShortcutRunner sendDialogRequestForParameter:action:dialogRequest:completion:]_block_invoke";
      v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Received an invalid dialog request for parameter: %@", buf, 0x16u);

    }
    WFBackgroundShortcutRunnerError(12, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  WFRemoteExecutionDialogRequest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  WFRemoteExecutionDialogRequest *v16;
  WFRemoteExecutionDialogRequest *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  WFRemoteExecutionDialogRequest *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  WFRemoteExecutionDialogRequest *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF71A338))
  {
    v8 = (WFRemoteExecutionDialogRequest *)v6;
    objc_msgSend(*(id *)(a1 + 32), "dialogTransformer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2;
    v58[3] = &unk_1E7AEC518;
    v62 = v7;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v59 = v8;
    v60 = v11;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 48);
    v61 = v13;
    v63 = v14;
    v15 = v7;
    v16 = v8;
    -[WFRemoteExecutionDialogRequest createDialogRequestWithAttribution:defaultState:prompt:completionHandler:](v16, "createDialogRequestWithAttribution:defaultState:prompt:completionHandler:", v10, 0, 0, v58);

    v17 = v59;
  }
  else
  {
    v49 = v7;
    v50 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v18 = a1;
    objc_msgSend(*(id *)(a1 + 40), "parameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v55 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v24, "key");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "key");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if ((v27 & 1) == 0)
          {
            v28 = *(void **)(v18 + 40);
            objc_msgSend(v24, "key");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "parameterStateForKey:fallingBackToDefaultValue:", v29, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "serializedRepresentation");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "key");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "if_setObjectIfNonNil:forKey:", v31, v32);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v21);
    }

    v33 = objc_msgSend(MEMORY[0x1E0DC79B0], "dialogComponentStyleForParameter:", v6);
    objc_msgSend(MEMORY[0x1E0DC7AD8], "doneButton");
    v16 = (WFRemoteExecutionDialogRequest *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v6;
      if (objc_msgSend(v34, "isTimePickerParameter"))
      {
        objc_msgSend(MEMORY[0x1E0DC7AD8], "startButton");
        v35 = objc_claimAutoreleasedReturnValue();

        v16 = (WFRemoteExecutionDialogRequest *)v35;
      }

    }
    v36 = objc_alloc(MEMORY[0x1E0DC79B0]);
    objc_msgSend(*(id *)(v18 + 40), "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "key");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AD0]), "initWithTitle:icon:", 0, 0);
    objc_msgSend(v6, "localizedPrompt");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v48) = 1;
    v10 = v50;
    v15 = (id)objc_msgSend(v36, "initWithActionIdentifier:parameterKey:serializedParameterStates:style:attribution:prompt:doneButton:focusImmediatelyWhenPresented:", v37, v38, v50, v33, v39, v40, v16, v48);

    v41 = [WFRemoteExecutionDialogRequest alloc];
    objc_msgSend(*(id *)(v18 + 32), "currentRemoteExecutionRunRequest");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WFRemoteExecutionDialogRequest initWithDialogRequest:runRequestIdentifier:](v41, "initWithDialogRequest:runRequestIdentifier:", v15, v43);

    v44 = *(void **)(v18 + 32);
    v45 = *(_QWORD *)(v18 + 40);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2_416;
    v51[3] = &unk_1E7AEC4F0;
    v46 = *(_QWORD *)(v18 + 48);
    v52 = v49;
    v53 = v46;
    v47 = v49;
    objc_msgSend(v44, "sendDialogRequestForParameter:action:dialogRequest:completion:", v6, v45, v17, v51);

  }
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "parameterState", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "parameterKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WFRemoteExecutionDialogRequest *v4;
  void *v5;
  void *v6;
  WFRemoteExecutionDialogRequest *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = [WFRemoteExecutionDialogRequest alloc];
    objc_msgSend(*(id *)(a1 + 40), "currentRemoteExecutionRunRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFRemoteExecutionDialogRequest initWithDialogRequest:runRequestIdentifier:](v4, "initWithDialogRequest:runRequestIdentifier:", v3, v6);

    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_410;
    v19[3] = &unk_1E7AEC4F0;
    v18 = *(_OWORD *)(a1 + 56);
    v11 = (id)v18;
    v20 = v18;
    objc_msgSend(v8, "sendDialogRequestForParameter:action:dialogRequest:completion:", v9, v10, v7, v19);

  }
  else
  {
    getWFRemoteExecutionLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFBackgroundShortcutRunner sendRemoteAskWhenRunRequestWithParameters:action:completion:]_block_invoke_2";
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_FAULT, "%s Unable to create valid dialog request for parameter: %@", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v21[0] = *MEMORY[0x1E0CB2D50];
    WFLocalizedString(CFSTR("Unable to Run"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v21[1] = *MEMORY[0x1E0CB2D68];
    WFLocalizedString(CFSTR("Unable to finish running action due to missing values."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("WFBackgroundShortcutRunnerErrorDomain"), 5, v17);
    v7 = (WFRemoteExecutionDialogRequest *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2_416(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_410(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __77__WFBackgroundShortcutRunner_openURL_withBundleIdentifier_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dialogTransformer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:withBundleIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(a3, "errorRepresentation");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }

}

void __63__WFBackgroundShortcutRunner_pauseWorkflowAndWriteStateToDisk___block_invoke_345(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopShortcutWithError:reason:", 0, CFSTR("paused workflow"));

}

uint64_t __63__WFBackgroundShortcutRunner_pauseWorkflowAndWriteStateToDisk___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workflowDidPause");
}

uint64_t __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__WFBackgroundShortcutRunner_presentAlert___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void (**v15)(void);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "buttons", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "title");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if (v14)
          {
            objc_msgSend(v12, "handler");
            v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v15[2]();

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workflowController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "workflow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workflowController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v20, "currentActionIndex"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "finishRunningWithError:", v6);
  }

}

void __86__WFBackgroundShortcutRunner_workflowController_handleTestingEvent_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "errorRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

void __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  WFCompactUnlockService *v7;
  void *v8;
  WFCompactUnlockService *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  WFCompactUnlockService *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "shouldPunchOut");
    getWFRunningLifecycleLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "Received punch out success from Siri, performing unlock if needed", buf, 2u);
      }

      v7 = objc_alloc_init(WFCompactUnlockService);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_330;
      v16[3] = &unk_1E7AEC408;
      v8 = *(void **)(a1 + 40);
      v16[4] = *(_QWORD *)(a1 + 32);
      v17 = v7;
      v18 = v8;
      v9 = v7;
      -[WFCompactUnlockService requestUnlockIfNeeded:](v9, "requestUnlockIfNeeded:", v16);

    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "Received punch out failure from Siri, terminating without handoff", buf, 2u);
      }

      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

    }
    v13 = v3;
  }
  else
  {

    getWFRunningLifecycleLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFBackgroundShortcutRunner workflowController:handleUnsupportedUserInterfaceForAction:currentState:complet"
            "ionHandler:]_block_invoke";
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v11 = v22;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", buf, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }

}

void __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_330(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  getWFRunningLifecycleLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "Received unlock success, performing handoff", buf, 2u);
    }

    +[WFUIPresenter defaultPresenter](WFUIPresenter, "defaultPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "dialogTransformer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "swapExternalUIPresenterWithPresenter:", v6);

    objc_msgSend(*(id *)(a1 + 32), "currentRunRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresentationMode:", 1);

    objc_msgSend(*(id *)(a1 + 32), "dialogTransformer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributionAllowingAction:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "dialogTransformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInterfacePresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentRunningContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginPersistentModeWithRunningContext:attribution:completionHandler:", v13, v10, &__block_literal_global_332);

    objc_msgSend(*(id *)(a1 + 32), "synchronouslyPerformWithHost:", &__block_literal_global_334);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfSiriPunchOutError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEFAULT, "Received unlock failure, terminating without handoff", v17, 2u);
    }

    v16 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v6);
  }

}

uint64_t __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_333(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "runnerDidPunchToShortcutsJr");
}

void __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_331(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    getWFGeneralLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFBackgroundShortcutRunner workflowController:handleUnsupportedUserInterfaceForAction:currentState:completi"
           "onHandler:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s Failed to begin persistent mode: %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "UUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC7970];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectWithPropertyListObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithUUID:didFinishRunningWithError:serializedVariable:executionMetadata:", v9, v6, v8, *(_QWORD *)(a1 + 56));

}

void __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_2(id *a1, char a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD aBlock[4];
  id v15;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E7AF8F48;
    v15 = a1[7];
    v6 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(a1[4], "dialogTransformer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentAction:", 0);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC7C80], "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v9 = objc_msgSend(v8, "retakeResignedExtensionsWithReason:error:", CFSTR("Runner finished Run Workflow"), &v13);
      v10 = v13;

      if ((v9 & 1) == 0)
        objc_msgSend(a1[6], "stopWithError:", v10);

    }
    v6[2](v6);

  }
  else
  {
    objc_msgSend(a1[4], "stateMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopShortcutWithError:reason:", v12, CFSTR("harness test failed"));

  }
}

uint64_t __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke(_QWORD *a1)
{
  WFActionWillRunTestingEvent *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = -[WFActionTestingEvent initWithAction:]([WFActionWillRunTestingEvent alloc], "initWithAction:", a1[4]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2;
  v4[3] = &unk_1E7AEC330;
  v3 = (void *)a1[6];
  v5 = (id)a1[5];
  v6 = v3;
  objc_msgSend(v5, "handleTestingEventIfTesting:completionHandler:", v2, v4);

}

void __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "workflow");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startedRunningAction:inShortcut:", v2, v5);

}

uint64_t __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "containsObject:", CFSTR("WFCalendarAccessResource")))
    WFClearWorkflowEventStore();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_4()
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

void __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopShortcutWithError:reason:", v6, CFSTR("harness test failed"));

  }
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char IsExemptFromOutputApproval;
  WFSmartPromptConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFSmartPromptConfiguration *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "output");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfItems") < 1
    || objc_msgSend(*(id *)(a1 + 32), "outputBehavior") != 2
    || (objc_msgSend(*(id *)(a1 + 32), "shouldDisablePrivacyPrompts") & 1) != 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastExecutedAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "runSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsExemptFromOutputApproval = WFRunSourceIsExemptFromOutputApproval();

  if ((IsExemptFromOutputApproval & 1) == 0)
  {
    v9 = [WFSmartPromptConfiguration alloc];
    objc_msgSend(*(id *)(a1 + 32), "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "runSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFSmartPromptConfiguration initWithOutputContentCollection:reference:source:](v9, "initWithOutputContentCollection:reference:source:", v10, v12, v13);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2;
    v16[3] = &unk_1E7AECC78;
    v15 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 32);
    v18 = v3;
    objc_msgSend(v15, "presentAlertWithSmartPromptConfiguration:completionHandler:", v14, v16);

    goto LABEL_8;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "output");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v3 + 2))(v3, v6);

LABEL_8:
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_298(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2_299;
  v8[3] = &unk_1E7AEC308;
  v4 = (void *)a1[5];
  v5 = a1[6];
  v8[4] = a1[4];
  v9 = v4;
  v10 = v3;
  v6 = *(void (**)(uint64_t, _QWORD *))(v5 + 16);
  v7 = v3;
  v6(v5, v8);

}

uint64_t __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2_299(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = a2;
  if (_os_feature_enabled_impl()
    && (objc_msgSend(*(id *)(a1 + 32), "workflowController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "outputBehavior"),
        v4,
        v5 == 3))
  {
    objc_msgSend(*(id *)(a1 + 40), "actionOutputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_3;
    v13[3] = &unk_1E7AEC2E0;
    v13[4] = *(_QWORD *)(a1 + 32);
    WFBackgroundShortcutRunnerMakeAllActionsResult(v6, v8, v7, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentRunRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "actionReversalStates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    v11 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_4;
    v12[3] = &unk_1E7AEC2E0;
    v12[4] = *(_QWORD *)(a1 + 32);
    WFBackgroundShortcutRunnerMakeResult(v6, v3, v10, v11, v12);

  }
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishRunningWithReason:result:", CFSTR("workflow controller did finish"), v3);

}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishRunningWithReason:result:", CFSTR("workflow controller did finish"), v3);

}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    getWFSecurityLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Once at output smart prompt", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "output");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a2 == 1)
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]_block_invoke";
      _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Always at output smart prompt", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "output");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workflow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveOutputActionSmartPromtDataForWorkflowReference:error:", v9, 0);

  }
  else
  {
    if (!a2)
    {
      getWFSecurityLogObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]_block_invoke_2";
        _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Deny at output smart prompt", (uint8_t *)&v10, 0xCu);
      }

    }
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __93__WFBackgroundShortcutRunner_workflowController_didDecideRunningProgressIsAllowed_forAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decideRunningProgressIsAllowed:withReason:", *(unsigned __int8 *)(a1 + 32), CFSTR("action said so"));
}

void __56__WFBackgroundShortcutRunner_workflowControllerWillRun___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "workflowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isPersonalAutomation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workflowDidStartRunning:isAutomation:dialogAttribution:", v7, v8, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "queue_runningProgressSuppressionStateMachine");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startedRunningShortcut:withDialogAttribution:", v9, *(_QWORD *)(a1 + 40));

}

uint64_t __93__WFBackgroundShortcutRunner_synchronouslyPerformWithRunningProgressSuppressionStateMachine___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __80__WFBackgroundShortcutRunner_performWithRunningProgressSuppressionStateMachine___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __59__WFBackgroundShortcutRunner_synchronouslyPerformWithHost___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_289_6959);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__WFBackgroundShortcutRunner_synchronouslyPerformWithHost___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  getWFXPCRunnerLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[WFBackgroundShortcutRunner synchronouslyPerformWithHost:]_block_invoke_2";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s failed to get remote object proxy to host: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __46__WFBackgroundShortcutRunner_performWithHost___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_288);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __46__WFBackgroundShortcutRunner_performWithHost___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  getWFXPCRunnerLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[WFBackgroundShortcutRunner performWithHost:]_block_invoke_2";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_ERROR, "%s failed to get remote object proxy to host: %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_3;
  v14[3] = &unk_1E7AF8548;
  v15 = v10;
  v16 = v7;
  v12 = v10;
  v13 = v7;
  objc_msgSend(v9, "matchContextualAction:toContentCollection:completionHandler:", v12, v11, v14);

}

uint64_t __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke_2;
    v4[3] = &unk_1E7AEC178;
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(a2, "presenterRequestedUpdatedRunViewSource:completionHandler:", v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__WFBackgroundShortcutRunner_presenterWillShowRequest_runningContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decideRunningProgressIsAllowed:withReason:", 1, CFSTR("dialog request came in, stop suppressing persistent mode"));
}

void __121__WFBackgroundShortcutRunner_runningProgressSuppressionStateMachine_didDecideRunningProgressIsAllowed_dialogAttribution___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[WFBackgroundShortcutRunner runningProgressSuppressionStateMachine:didDecideRunningProgressIsAllowed:dialogA"
           "ttribution:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_ERROR, "%s Failed to begin persistent mode: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));

}

uint64_t __70__WFBackgroundShortcutRunner_runnerStateMachineDidRequestProcessExit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "runnerWillExit");
}

void __84__WFBackgroundShortcutRunner_runnerStateMachine_didFinishRunningShortcutWithResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithResult:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exitWithReason:", CFSTR("shortcut finished running"));

}

void __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

void __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

void __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "promoteSharedTemporaryDirectoryLock"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WFBackgroundShortcutRunnerLockFileURL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v11);
    v5 = v11;

    if ((v4 & 1) == 0)
    {
      getWFXPCRunnerLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete the BackgroundShortcutRunner lock file: %@", buf, 0x16u);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0D44178], "invalidateAllConnections");
  close(objc_msgSend(*(id *)(a1 + 32), "lockFileFD"));
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  getWFXPCRunnerLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Dropping sandbox extensions to the data vault", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "dataVaultFileURLs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_246);

  getWFXPCRunnerLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke_2";
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Exiting process", buf, 0xCu);
  }

  exit(0);
}

uint64_t __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_248(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_DEBUG, "%s Finished exit tasks. Preparing to exit.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_249(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_FAULT, "%s Forcing BGSR exit with dirty tasks. This is a programmer error. Exiting anyways.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_245(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "url");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAccessingSecurityScopedResource");

}

void __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    getWFSecurityLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]_block_invoke";
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Error temporarily taking all sandbox extensions at workflow run resume: %@", buf, 0x16u);
    }

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke_234;
  v12[3] = &unk_1E7AEC088;
  v11 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v16 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v10 = v7;
  +[WFWorkflowControllerState getStateFromURL:completionHandler:](WFWorkflowControllerState, "getStateFromURL:completionHandler:", v9, v12);

}

void __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  WFWorkflow *v10;
  WFWorkflow *v11;
  WFWorkflowController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = 0;
    goto LABEL_11;
  }
  +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workflowRecordForDescriptor:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v10 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v9, v7, 0, 1, objc_msgSend(*(id *)(a1 + 32), "environment"), 0);
  v11 = v10;
  if (v5 && v10)
  {
    v12 = objc_alloc_init(WFWorkflowController);
    -[WFWorkflowController setWorkflow:](v12, "setWorkflow:", v11);
    -[WFWorkflowController setCurrentState:](v12, "setCurrentState:", v5);
    -[WFWorkflowController setDelegate:](v12, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "currentRunSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setRunSource:](v12, "setRunSource:", v13);

    -[WFWorkflowController setShouldDisablePrivacyPrompts:](v12, "setShouldDisablePrivacyPrompts:", objc_msgSend(v5, "shouldDisablePrivacyPrompts"));
    -[WFWorkflowController setRunningContext:](v12, "setRunningContext:", *(_QWORD *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v12);
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(*(id *)(a1 + 32), "environment");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resuming shortcut run for context: %@, request: %@"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startRunningShortcutWithEnvironment:reference:isPersonalAutomation:reason:", v15, v7, 0, v16);

    -[WFWorkflowController run](v12, "run");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v31 = v6;
    LOBYTE(v16) = objc_msgSend(v17, "removeItemAtURL:error:", v18, &v31);
    v19 = v31;

    if ((v16 & 1) == 0)
    {
      getWFXPCRunnerLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v35 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]_block_invoke";
        v36 = 2112;
        v37 = v21;
        v38 = 2112;
        v39 = v19;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_ERROR, "%s Unable to remove serialized state file at URL (%@): %@", buf, 0x20u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v6 = v19;
    goto LABEL_15;
  }
LABEL_12:
  getWFXPCRunnerLogObject();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    v23 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v35 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]_block_invoke";
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_FAULT, "%s Unable to get deserialized state from (%@): %@", buf, 0x20u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v32[0] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Unable to run"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v25;
  v32[1] = *MEMORY[0x1E0CB2D68];
  WFLocalizedString(CFSTR("An error occurred while resuming your shortcut."));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("WFBackgroundShortcutRunnerErrorDomain"), 11, v27);
  v12 = (WFWorkflowController *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", v12);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to deserialize workflow controller state: URL: %@, error: %@"), *(_QWORD *)(a1 + 40), v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "finishRunningWithReason:result:", v30, v28);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_15:

}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRunningWithReason:result:", CFSTR("incoming remote execution request landed in existing runner, which is not supported"), v3);

}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    getWFSecurityLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]_block_invoke_2";
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Error temporarily taking all sandbox extensions at workflow run start: %@", buf, 0x16u);
    }

  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fileCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_204;
  v14[3] = &unk_1E7AEC038;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v16 = v7;
  v14[4] = v11;
  v15 = v12;
  v13 = v7;
  objc_msgSend(v9, "inflateWithFileCoordinator:completion:", v10, v14);

}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_204(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  WFWorkflowController *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  WFWorkflowControllerState *v44;
  WFWorkflowControllerState *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  WFWorkflowRecord *v50;
  void *v51;
  WFRemoteExecutionRunRequestWorkflow *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  _QWORD aBlock[4];
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2_205;
  aBlock[3] = &unk_1E7AF8F48;
  v61 = a1[6];
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v6)
  {
    getWFRemoteExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v63 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]_block_invoke";
      v64 = 2114;
      v65 = v10;
      v66 = 2114;
      v67 = v6;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s <%{public}@> an error occurred while inflating request: %{public}@", buf, 0x20u);

    }
    WFBackgroundShortcutRunnerError(5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[4];
    objc_msgSend(v12, "currentRemoteExecutionRunRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v7;
    v56[1] = 3221225472;
    v56[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_206;
    v56[3] = &unk_1E7AF55D0;
    v14 = v11;
    v15 = a1[4];
    v57 = v14;
    v58 = v15;
    v59 = v6;
    objc_msgSend(v12, "sendResponseForRunRequest:controller:error:completion:", v13, 0, v14, v56);

    v16 = v57;
  }
  else
  {
    +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serializedParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createActionWithIdentifier:serializedParameters:", v18, v19);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v5, "workflowID");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "referenceForWorkflowID:", v16);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_alloc_init(WFWorkflowRecord);
      objc_msgSend(v51, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowRecord setName:](v50, "setName:", v27);

      v52 = -[WFWorkflow initWithRecord:reference:storageProvider:error:]([WFRemoteExecutionRunRequestWorkflow alloc], "initWithRecord:reference:storageProvider:error:", v50, v51, 0, 0);
      objc_msgSend(v5, "workflowID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRemoteExecutionRunRequestWorkflow setWorkflowID:](v52, "setWorkflowID:", v28);

      -[WFWorkflow addAction:](v52, "addAction:", v14);
      objc_msgSend(v14, "willBeAddedToWorkflow:", v52);
      objc_msgSend(v14, "wasAddedToWorkflow:", v52);
      v29 = objc_alloc(MEMORY[0x1E0DC7E80]);
      -[WFRemoteExecutionRunRequestWorkflow workflowID](v52, "workflowID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)objc_msgSend(v29, "initWithWorkflowIdentifier:", v30);

      objc_msgSend(v49, "setRunKind:", *MEMORY[0x1E0DC8428]);
      v44 = [WFWorkflowControllerState alloc];
      objc_msgSend(v5, "variables");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "input");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processedParameters");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contentAttributionTracker");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      objc_msgSend(v35, "controlFlowTracker");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v42) = 0;
      v45 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v44, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", 0, v48, 0, v49, v47, v46, v31, 0, 0, 2, v32, 0, v36, 0, 0,
              v42);

      v37 = objc_alloc_init(WFWorkflowController);
      -[WFWorkflowController setWorkflow:](v37, "setWorkflow:", v52);
      -[WFWorkflowController setCurrentState:](v37, "setCurrentState:", v45);
      -[WFWorkflowController setDelegate:](v37, "setDelegate:", a1[4]);
      v38 = a1[4];
      v39 = objc_msgSend(v38, "environment");
      objc_msgSend(v38, "metricsRunSourceFromEnvironment:runSource:", v39, *MEMORY[0x1E0DC8488]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWorkflowController setRunSource:](v37, "setRunSource:", v40);

      -[WFWorkflowController setRunningContext:](v37, "setRunningContext:", a1[5]);
      objc_storeStrong((id *)a1[4] + 12, a1[5]);
      objc_storeStrong((id *)a1[4] + 20, v37);
      objc_msgSend(a1[4], "stateMachine");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "startRunningShortcutWithEnvironment:reference:isPersonalAutomation:reason:", objc_msgSend(a1[4], "environment"), 0, 0, CFSTR("running remote execution request"));

      -[WFWorkflowController run](v37, "run");
      v26 = v43;
    }
    else
    {
      getWFRemoteExecutionLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v5, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v63 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]_block_invoke_2";
        v64 = 2114;
        v65 = v21;
        v66 = 2114;
        v67 = v14;
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_FAULT, "%s <%{public}@> stopping execution because of invalid action: %{public}@", buf, 0x20u);

      }
      WFBackgroundShortcutRunnerError(4, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = a1[4];
      objc_msgSend(v23, "currentRemoteExecutionRunRequest");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v7;
      v53[1] = 3221225472;
      v53[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_211;
      v53[3] = &unk_1E7AF92C0;
      v16 = v22;
      v25 = a1[4];
      v54 = v16;
      v55 = v25;
      objc_msgSend(v23, "sendResponseForRunRequest:controller:error:completion:", v24, 0, v16, v53);

      v26 = v54;
    }

  }
  v8[2](v8);

}

uint64_t __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2_205(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_206(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("an error occurred while inflating request: %@"), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRunningWithReason:result:", v3, v4);

}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_211(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRunningWithReason:result:", CFSTR("couldn't make the action in the remote execution request"), v3);

}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    getWFSecurityLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      v34 = 2112;
      v35 = v8;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Error temporarily taking all sandbox extensions at workflow run start: %@", buf, 0x16u);
    }

  }
  getWFXPCRunnerLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  getWFXPCRunnerLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoadWorkflow", ", buf, 2u);
  }

  v15 = *(void **)(a1 + 32);
  v16 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_157;
  v22[3] = &unk_1E7AEBFE8;
  v17 = *(_QWORD *)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 56);
  v28 = v9;
  v18 = *(_QWORD *)(a1 + 96);
  v30 = v12;
  v31 = v18;
  v23 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 32);
  v25 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 80);
  v20 = *(_QWORD *)(a1 + 88);
  v26 = v19;
  v29 = v20;
  v27 = *(id *)(a1 + 48);
  v21 = v9;
  objc_msgSend(v15, "createWorkflowWithEnvironment:database:completionHandler:", v16, v17, v22);

}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
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
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFXPCRunnerLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 96);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LoadWorkflow", ", buf, 2u);
  }

  if (!v5)
  {
    getWFXPCRunnerLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v70 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      v71 = 2112;
      v72 = v6;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from descriptor. %@", buf, 0x16u);
    }

    v13 = objc_alloc(MEMORY[0x1E0DC7E68]);
    WFBackgroundShortcutRunnerError(1, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "initWithError:", v14);

    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = CFSTR("unable to find requested workflow to run");
    goto LABEL_23;
  }
  v10 = objc_msgSend(v5, "environment");
  if (v10 != objc_msgSend(*(id *)(a1 + 32), "environment"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("WFBackgroundShortcutRunner.m"), 347, CFSTR("Environment on workflow should be the same as environment of BGSR"));

  }
  objc_msgSend(v5, "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {

    goto LABEL_13;
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "isStepwiseExecution");

  if ((v19 & 1) != 0)
  {
LABEL_13:
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v20, "accessSpecifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "record");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = objc_msgSend(v20, "allowIncomingRunRequest:withDescriptor:accessSpecifier:record:", v21, v22, v23, v24);

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v5, "setIgnoreModifications:", 1);
      getWFRunningLifecycleLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v70 = (const char *)v5;
        v71 = 2114;
        v72 = v26;
        _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_DEFAULT, "Starting shortcut run: %{public}@, request: %{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "stateMachine");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(*(id *)(a1 + 32), "environment");
      objc_msgSend(v5, "reference");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(*(id *)(a1 + 32), "isPersonalAutomation");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("running run request: %@"), *(_QWORD *)(a1 + 40));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startRunningShortcutWithEnvironment:reference:isPersonalAutomation:reason:", v28, v29, v30, v31);

      if (objc_msgSend(*(id *)(a1 + 32), "environment") != 1 || (objc_msgSend(v5, "isResidentCompatible") & 1) != 0)
      {
        v32 = *(id *)(a1 + 40);
        if (v32)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v33 = v32;
          else
            v33 = 0;
        }
        else
        {
          v33 = 0;
        }
        v15 = v33;

        objc_msgSend(v15, "action");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "setContextualAction:", v47);

        objc_msgSend(v15, "actionContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "setContextualActionContext:", v48);

        v49 = *(void **)(a1 + 40);
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_182;
        v58[3] = &unk_1E7AEBFC0;
        v50 = *(id *)(a1 + 80);
        v51 = *(_QWORD *)(a1 + 32);
        v65 = v50;
        v58[4] = v51;
        v59 = v5;
        v60 = *(id *)(a1 + 64);
        v61 = *(id *)(a1 + 40);
        v62 = *(id *)(a1 + 56);
        v52 = *(id *)(a1 + 48);
        v53 = *(_QWORD *)(a1 + 88);
        v63 = v52;
        v66 = v53;
        v64 = *(id *)(a1 + 72);
        objc_msgSend(v49, "getInputWithCompletionHandler:", v58);

        goto LABEL_29;
      }
      getWFXPCRunnerLogObject();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v70 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
        _os_log_impl(&dword_1C15B3000, v54, OS_LOG_TYPE_ERROR, "%s workflow is not home resident-compatible, but run from home-resident environment", buf, 0xCu);
      }

      v55 = objc_alloc(MEMORY[0x1E0DC7E68]);
      WFBackgroundShortcutRunnerError(2, 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v55, "initWithError:", v56);

      objc_msgSend(*(id *)(a1 + 32), "stateMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("workflow is not home resident-compatible, but run from home-resident environment");
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0DC7E68]);
      WFBackgroundShortcutRunnerError(0, v6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v34, "initWithError:", v35);

      objc_msgSend(*(id *)(a1 + 32), "stateMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("missing required entitlement");
    }
LABEL_23:
    objc_msgSend(v16, "finishRunningWithReason:result:", v18, v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    goto LABEL_29;
  }
  getWFXPCRunnerLogObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v70 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
    v71 = 2112;
    v72 = v37;
    _os_log_impl(&dword_1C15B3000, v36, OS_LOG_TYPE_ERROR, "%s “%@” contains no actions.", buf, 0x16u);

  }
  v38 = (void *)MEMORY[0x1E0CB35C8];
  v67[0] = *MEMORY[0x1E0CB2D50];
  WFLocalizedString(CFSTR("Empty Shortcut"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v39;
  v67[1] = *MEMORY[0x1E0CB2D68];
  v40 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("“%@” contains no actions."));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringWithFormat:", v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("WFBackgroundShortcutRunnerErrorDomain"), 10, v44);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", v15);
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "finishRunningWithReason:result:", CFSTR("no actions in workflow"), v45);

  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_29:

}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_182(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  if (v5 || !v6)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_185;
    v18[3] = &unk_1E7AEBF98;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v19 = v13;
    v20 = v14;
    v21 = v15;
    v22 = v5;
    v23 = *(id *)(a1 + 56);
    v24 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 72);
    v17 = *(_QWORD *)(a1 + 96);
    v25 = v16;
    v27 = v17;
    v26 = *(id *)(a1 + 80);
    objc_msgSend(v10, "evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:", v11, v13, v18);

    v7 = v19;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", v6);
    getWFXPCRunnerLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Could not get input with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishRunningWithReason:result:", CFSTR("no input and input error"), v7);

  }
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_185(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  WFWorkflowController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  CFTimeInterval v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "remoteQuarantineHash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToData:", v7);

      if ((v10 & 1) == 0)
      {
        +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "storeQuarantineHashForWorkflowWithReference:quarantineHash:", *(_QWORD *)(a1 + 32), v7);

      }
    }
    v12 = objc_alloc_init(WFWorkflowController);
    objc_msgSend(*(id *)(a1 + 40), "setWorkflowController:", v12);
    -[WFWorkflowController setWorkflow:](v12, "setWorkflow:", *(_QWORD *)(a1 + 48));
    -[WFWorkflowController setInput:](v12, "setInput:", *(_QWORD *)(a1 + 56));
    -[WFWorkflowController setDelegate:](v12, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 64), "automationType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setAutomationType:](v12, "setAutomationType:", v13);

    objc_msgSend(*(id *)(a1 + 64), "runViewSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setRunViewSource:](v12, "setRunViewSource:", v14);

    -[WFWorkflowController setRunningContext:](v12, "setRunningContext:", *(_QWORD *)(a1 + 72));
    -[WFWorkflowController setDonateInteraction:](v12, "setDonateInteraction:", 0);
    objc_msgSend(*(id *)(a1 + 64), "listenerEndpoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setListenerEndpoints:](v12, "setListenerEndpoints:", v15);

    -[WFWorkflowController setIsAutomationSuggestion:](v12, "setIsAutomationSuggestion:", objc_msgSend(*(id *)(a1 + 64), "isAutomationSuggestion"));
    objc_msgSend(*(id *)(a1 + 64), "trialID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setAutomationTrialID:](v12, "setAutomationTrialID:", v16);

    v17 = *(void **)(a1 + 40);
    v18 = objc_msgSend(v17, "environment");
    objc_msgSend(*(id *)(a1 + 64), "runSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "metricsRunSourceFromEnvironment:runSource:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowController setRunSource:](v12, "setRunSource:", v20);

    -[WFWorkflowController setOutputBehavior:](v12, "setOutputBehavior:", objc_msgSend(*(id *)(a1 + 64), "outputBehavior"));
    v21 = *(id *)(a1 + 80);
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v21, "shouldDisablePrivacyPrompts");
    }
    else
    {

      v21 = 0;
    }
    -[WFWorkflowController setShouldDisablePrivacyPrompts:](v12, "setShouldDisablePrivacyPrompts:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
    getWFXPCRunnerLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      v36 = 2048;
      v37 = CACurrentMediaTime();
      _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_DEBUG, "%s [Performance] Starting workflow run, %f", buf, 0x16u);
    }

    -[WFWorkflowController run](v12, "run");
    if (objc_msgSend(*(id *)(a1 + 64), "logRunEvent"))
    {
      v25 = *(_QWORD *)(a1 + 32);
      if (v25)
      {
        v26 = *(void **)(a1 + 88);
        objc_msgSend(*(id *)(a1 + 64), "runSource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logRunOfWorkflow:withSource:triggerID:", v25, v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setRunEvent:", v28);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 64), "donateInteraction"))
    {
      dispatch_get_global_queue(0, 0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_190;
      v30[3] = &unk_1E7AF9298;
      v30[4] = *(_QWORD *)(a1 + 40);
      v31 = *(id *)(a1 + 80);
      v32 = *(id *)(a1 + 88);
      v33 = *(id *)(a1 + 32);
      dispatch_async(v29, v30);

    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
    {
      +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "quarantineWorkflowWithReference:", *(_QWORD *)(a1 + 32));

    }
    v12 = (WFWorkflowController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E68]), "initWithError:", v8);
    objc_msgSend(*(id *)(a1 + 40), "stateMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "finishRunningWithReason:result:", CFSTR("remote quarantine error"), v12);

  }
}

uint64_t __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_190(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 144));
  v2 = a1[6];
  v3 = a1[7];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2;
  v6[3] = &unk_1E7AF94B0;
  v4 = (void *)a1[5];
  v6[4] = a1[4];
  return objc_msgSend(v4, "donateRunInteractionWithDatabase:workflowReference:completionHandler:", v2, v3, v6);
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 144));
}

void __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[WFBackgroundShortcutRunner listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_ERROR, "%s XPC connection interrupted", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionInvalidatedOrInterrupted");

}

void __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke_135(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFXPCRunnerLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[WFBackgroundShortcutRunner listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C15B3000, v2, OS_LOG_TYPE_ERROR, "%s XPC connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionInvalidatedOrInterrupted");

}

void __52__WFBackgroundShortcutRunner_initWithProcessPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "url");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAccessingSecurityScopedResource");

}

@end
