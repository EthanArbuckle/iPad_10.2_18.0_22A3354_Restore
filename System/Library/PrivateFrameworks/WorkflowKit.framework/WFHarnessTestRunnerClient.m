@implementation WFHarnessTestRunnerClient

- (WFHarnessTestRunnerClient)initWithRunRequest:(id)a3
{
  id v5;
  void *v6;
  WFHarnessTestRunnerClient *v7;
  WFHarnessTestRunnerClient *v8;
  WFHarnessTestRunnerClient *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestRunnerClient.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runRequest"));

  }
  objc_msgSend(v5, "testRunDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WFHarnessTestRunnerClient;
  v7 = -[WFWorkflowRunnerClient initWithDescriptor:runRequest:](&v12, sel_initWithDescriptor_runRequest_, v6, v5);
  v8 = v7;
  if (v7)
    v9 = v7;

  return v8;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "testResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_class();
  objc_msgSend(v6, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "underlyingErrorIfRunnerError:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHarnessTestRunnerClient testDelegate](self, "testDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[WFHarnessTestRunnerClient testDelegate](self, "testDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "workflowRunnerClient:didFinishRunningHarnessTestsWithResult:error:", self, v10, v13);

  }
  else
  {
    getWFTestingLifecycleLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[WFHarnessTestRunnerClient handleWorkflowRunResult:completion:]";
      _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_DEFAULT, "%s WFHarnessTestRunnerClient skipping callback because testDelegate does not respond to didFinishRunningHarnessTestsWithResult", (uint8_t *)&v18, 0xCu);
    }

  }
  v7[2](v7);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowRunnerClient runRequest](self, "runRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, runRequest: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WFHarnessTestRunnerClientDelegate)testDelegate
{
  return self->_testDelegate;
}

- (void)setTestDelegate:(id)a3
{
  self->_testDelegate = (WFHarnessTestRunnerClientDelegate *)a3;
}

@end
